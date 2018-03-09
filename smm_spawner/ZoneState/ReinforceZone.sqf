params["_object"];
#include "..\..\patterns.hpp"
MUTEX_LOCK(SPAWN_UNITS)

private _zoneID = [_object] call ZoneState_get_ZoneID;
private _statesManager = call ZoneStatesManager_GetInstance;
diag_log ("Reinforcing zone " + (str _zoneID));
private _zone = [call ZonesManager_GetInstance,_zoneID] call ZonesManager_fnc_GetZone;
diag_log ("Zone is " + (str _zone));
private _zoneCenter = [_zone] call Zone_get_Position;
diag_log ("Zone center is " + str(_zoneCenter));
private _size = [_zone] call Zone_get_Size;
private _side = [_zone] call Zone_get_Owner;
private _nbIDs = [_zone] call Zone_get_Neighbours;
//get all neighbours with same side
private _nbs = _nbIDs apply {[call ZonesManager_GetInstance,_x] call ZonesManager_fnc_GetZone};
_nbs = _nbs select { ([_x] call Zone_get_Owner) == _side};
diag_log ("Avaiable neighbours are : " + (str _nbs));
private _cooldown = [_object] call ZoneState_fnc_GetReinforceCooldown;
private _last = [_object] call ZoneState_get_LastReinforcement;

//only reinforce if there are friendly nb zones and the cooldown is over
if((count _nbs) > 0 && ((_last + _cooldown) > serverTime) )then{
	private _startingZone = selectRandom _nbs; // todo select zone that matches best, not random one
	private _startingZoneCenter = [_startingZone] call Zone_get_Position;
	diag_log (format ["Starting from zone %1 at position %2",_startingZone,_startingZoneCenter]);
	[_startingZoneCenter,120,"ColorOrange"] call smm_fnc_createDebugMarker;
	
	//collect infantry and vehicles from adjacent zones
	private _infantry = [];
	private _vehicles = [];
	{
		private _nbZoneState = [_statesManager,_zoneID] call ZoneStatesManager_fnc_GetZoneState;
		private _nbInfantry = [_nbZoneState] call ZoneState_fnc_GetSpawnInfantry;
		private _nbVehicles = [_nbZoneState] call ZoneState_fnc_GetSpawnVehicles;
		_infantry append _nbInfantry;
		_vehicles append _nbVehicles;
		
	} forEach  _nbs;
	_infantry = _infantry call BIS_fnc_arrayShuffle;
	_vehicles = _vehicles call BIS_fnc_arrayShuffle;

	//only select first n items, where n = count(items) /fn(numnbs), to get growing average number of infantry and vehicles
	_infantry = _infantry select [0,(count _infantry) / (sqrt (count _nbs))];//check if sqrt does the job
	_vehicles = _vehicles select [0,(count _vehicles) / (sqrt (count _vehicles))];
	
	private _group = 0;
	private _units = [];
	{
		if((_forEachIndex mod smm_spawner_units_per_group) == 0)then{
			_group = createGroup[_side,true];
			
		};
		private _classname = [_x] call SpawnableInfantry_get_ClassName;
		diag_log (format["Spawning reinforcment %1 at %2 for side %3 in zone %4",_classname,_startingZoneCenter,_side,_zoneID]);
		private _unit = _group createUnit [_classname,_startingZoneCenter,[],100,"NONE"];
		[_object,_unit] call ZoneState_fnc_InitUnit;
		_units pushBack _unit;

	}forEach _infantry;

	diag_log (format ["Reinforcing with %1 infantry",count _infantry]);
};

MUTEX_UNLOCK(SPAWN_UNITS)