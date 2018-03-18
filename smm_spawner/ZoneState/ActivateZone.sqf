#include "..\..\patterns.hpp"
MUTEX_LOCK(SPAWN_UNITS)
#define VAR_NAME_ZONE "owner_zone"

params["_object"];
diag_log ("called ActivateZone.sqf with params " + (str _this) );

private _zoneID = [_object] call ZoneState_get_ZoneID;
diag_log ("Zone id is " + (str _zoneID));
private _zone = [call ZonesManager_GetInstance,_zoneID] call ZonesManager_fnc_GetZone;
diag_log ("Zone is " + (str _zone));
private _zoneCenter = [_zone] call Zone_get_Position;
diag_log ("Zone center is " + str(_zoneCenter));
private _size = [_zone] call Zone_get_Size;
private _side = [_zone] call Zone_get_Owner;
private _nbIDS = [_zone] call Zone_get_Neighbours;
private _friendlyNeighbours = (_nbIDS apply {[call ZonesManager_GetInstance,_x] call ZonesManager_fnc_GetZone}) select {([_x] call Zone_get_Owner) == _side};
private _buildingType = ["House", "Building"];
private _buildings = (nearestObjects [_zoneCenter,_buildingType,_size]) select {(count (_x buildingPos -1)) >= smm_spawner_units_per_group};

private _em = call EventManager_GetInstance;

private _currentUnits = [_object] call ZoneState_get_Units;
if((count _currentUnits) == 0) then{

	private _spawnVehicles = [_object] call ZoneState_fnc_GetSpawnVehicles;
	private _spawnInfantry = [_object] call ZoneState_fnc_GetSpawnInfantry;

	private _spawnedVehicles = [];
	private _spawnedVehicleCrew = [];
	private _spawnedInfantry = [];




	//spawn infantry
	{

		private _group = createGroup[_side,true];
		_group setVariable [VAR_NAME_ZONE,_zoneID];
		_group setVariable ["acex_headless_blacklist", true];
		_group enableDynamicSimulation true;
		private _unittypes = _x;
		private _spawnpositions = [];

		//if there are enough buildings, spawn group in one of these
		if((count _buildings) > 3 )then{
			_spawnpositions append  ((selectRandom _buildings) buildingPos -1);
		};

		{
			_spawnpositions pushBack ([_zoneCenter,_size] call smm_fnc_getSpawnPosNear);
		}forEach _unittypes;
		
		assert((count _spawnpositions) >= 1);
		//now spawn each single unit
		{
			private _cn = [_x] call SpawnableInfantry_get_ClassName;
			private _pn = [_x] call SpawnableInfantry_get_PostSpawnFunction;
			private _u = _group createUnit [_cn, (_spawnpositions select (_forEachIndex  % (count _spawnpositions) ) ), [], 0, "CAN_COLLIDE"];
			
			_u call _pn;
			_spawnedInfantry pushBack  _u;

			//set certain settings for ActivateZone
			[_object,_u] call ZoneState_fnc_InitUnit;

		}forEach _unittypes;


	} forEach ([_spawnInfantry,smm_spawner_units_per_group] call smm_fnc_subdivide);

	[_em,"OnInfantrySpawned",[_spawnedInfantry,_zoneID] ] call EventManager_fnc_Trigger;

	//spawn vehicles
	{
		private _group = createGroup[_side,true];
		_group setVariable [VAR_NAME_ZONE,_zoneID];
		_group setVariable ["acex_headless_blacklist", true];
		_group enableDynamicSimulation true;
		private _vehicletypes = _x;
		private _spawnpositions = _vehicletypes apply {[_zoneCenter,_size] call smm_fnc_getSpawnPosNear};
		{
			private _cn = [_x] call SpawnableVehicle_get_ClassName;
			private _pn = [_x] call SpawnableVehicle_get_PostSpawnFunction;
			private _v = _cn createVehicle (_spawnpositions select _forEachIndex);
			createVehicleCrew _v;
			[_object,_v] call ZoneState_fnc_InitVehicle;
			_v call _pn;
			_spawnedVehicleCrew append (crew _v);

			{
				[_object,_x] call ZoneState_fnc_InitUnit;
			}forEach (crew _v);
		}forEach _vehicletypes;


	}forEach ([_spawnVehicles,smm_spawner_vehicles_per_group] call smm_fnc_subdivide);


	//create helipads for reinforcement troops to land
	private _helipadPos = [_zone] call Zone_get_LandingSpots;
	{
		private _xPos = [_x] call Position_get_X;
		private _yPos = [_x] call Position_get_Y;
		private _pos = [_xPos,_yPos];
		private _classname = if(smm_debug)then{"Land_HelipadSquare_F"}else{"Land_HelipadEmpty_F"};
		private _pad = _classname createVehicle _pos;
		_spawnedVehicles pushBack _pad;

	}forEach _helipadPos;
	([_object] call ZoneState_get_Vehicles) append _spawnedVehicles;
	[_object,serverTime] call ZoneState_set_LastReinforcement;
	[_em,"OnVehiclesSpawned",[_spawnedVehicles,_spawnedVehicleCrew,_zoneID]] call EventManager_fnc_Trigger;


	//create objectives
	
	private _objectiveTypes = ["Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_Cargo_Tower_V1_F"];
	{
		//go slightly into direction of the nb zone
		private _objectiveClassname = selectRandom _objectiveTypes;
		private _nbZoneCenter = [_x] call Zone_get_Position;
		private _thisToNb = _zoneCenter getDir _nbZoneCenter;
		private _approxPlacePoint = _zoneCenter getPos [ _size * 0.5,_thisToNb];
		private _placePoint = _approxPlacePoint findEmptyPosition [0,_size * 0.5,_objectiveClassname];
		//if empty position was found
		if((count _placePoint) > 0)then{
			private _objective = _objectiveClassname createVehicle _placePoint;
			([_object] call ZoneState_get_Objectives) pushBack _objective;
		};
	}forEach _friendlyNeighbours;




	[_em,"OnZoneActivated",_zoneID] call EventManager_fnc_Trigger;
}else{
	diag_log (format["Could not activate zone, as present units are %1",_currentUnits]);
};
MUTEX_UNLOCK(SPAWN_UNITS)