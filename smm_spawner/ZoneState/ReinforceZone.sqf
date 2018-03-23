/**
	Author:Jonas Körner

	Checks if reinforcments can be spawned, and spawns them in an adjacent zone if neccessary
*/

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

//only reinforce if there are friendly nb zones and the cooldown is over and the zone does not already have enough units
private _numUnits = count( ([_object] call ZoneState_get_Units) select {alive _x});
private _maxUnits = 60; //TODO make player dependent
diag_log (format["Checking if zone needs reinforcment with _numUnits=%1 and time=%2/%3 and count _nbs = %4",_numUnits,_cooldown + _last,serverTime,count _nbs]);
if( ((count _nbs) > 0) and ((_last + _cooldown) < serverTime) and (_numUnits < _maxUnits) )then{
	private _startingZone = selectRandom _nbs; // todo select zone that matches best, not random one
	private _startingZoneCenter = [_startingZone] call Zone_get_Position;
	private _startingZonePads = [_startingZone] call Zone_get_LandingSpots;
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
	_infantry = _infantry select [0,0.3 * (count _infantry) / (sqrt (count _nbs))];// todo check if sqrt does the job
	_vehicles = _vehicles select [0,0.3 * (count _vehicles) / (sqrt (count _vehicles))];//not used ATM
	
	private _group = 0;
	private _units = [];
	private _groups = [];
	//spawn infantry units on ground at reinforcing zone
	{
		if((_forEachIndex mod smm_spawner_units_per_group) == 0)then{
			_group = createGroup[_side,true];
			_groups pushBack _group;
		};
		private _classname = [_x] call SpawnableInfantry_get_ClassName;
		diag_log (format["Spawning reinforcment %1 at %2 for side %3 in zone %4",_classname,_startingZoneCenter,_side,_zoneID]);
		private _unit = _group createUnit [_classname,_startingZoneCenter,[],100,"NONE"];
		[_object,_unit] call ZoneState_fnc_InitUnit;
		_units pushBack _unit;

	}forEach _infantry;

	diag_log (format ["Reinforcing with %1 infantry",count _infantry]);


	//move them into transport vehicles
	private _pool = []; //todo move this to seperate method
	private _pilotPool = [];
	if(_side == east) then {
		_pool = ai_transport_vehicles select 0;
		_pilotPool = ai_transport_pilots select 0;
	};
	if(_side == west) then {
		_pool = ai_transport_vehicles select 1;
		_pilotPool = ai_transport_pilots select 1;
	};
	if (_side == independent) then {
		_pool = ai_transport_vehicles select 2;
		_pilotPool = ai_transport_pilots select 2;
	};
	private _vehicleFound = false;
	private _transportVehicleType = [];
	private _targetLandingSpots = ([_zone] call Zone_get_LandingSpots) apply {[_x] call Position_fnc_ToArray};
	private _numSearches = 0;
	private _numVehicles = 0;
	private _groupPerVehicle = 0;
	while {!_vehicleFound} do {
		_transportVehicleType = selectRandom _pool; // todo better selection algorithm
		private _cargoSlots = [_transportVehicleType] call SpawnableVehicle_fnc_GetCargoSlots;
		assert (_cargoSlots > 0);
		assert (_cargoSlots >= smm_spawner_units_per_group);
		_groupPerVehicle = floor(_cargoSlots / smm_spawner_units_per_group);
		diag_log (format["Try Putting them into %1 with %2 cargo slots and %3 groups per vehicle",_transportVehicleType,_cargoSlots,_groupPerVehicle]);
		
		_numVehicles = ceil ((count _groups) / _groupPerVehicle);
		
		//TODO better selection
		if([_transportVehicleType] call SpawnableVehicle_fnc_IsHelicopter   )then{
			if( (count _targetLandingSpots)>= _numVehicles )then{
				_vehicleFound = true;
			};
		}else{
			if( (count _targetLandingSpots)< _numVehicles )then{
				_vehicleFound = true;
			}else{
				if((random 1)< 0.1 )then{
					_vehicleFound =true;
				};
			};
		};
		_numSearches = _numSearches + 1;
		if(_numSearches > 10)then{
			_vehicleFound = true;
		}
	};
	if((count _targetLandingSpots)== 0)then{
		_targetLandingSpots pushBack _zoneCenter;
	};
	_targetLandingSpots = [_targetLandingSpots,[_startingZoneCenter],{_x distance _input0}] call BIS_fnc_sortBy;
	private _currentGroupIndex = 0;

	for [{_i= 0},{_i < _numVehicles},{_i = _i + 1}] do {

		private _isAir = [_transportVehicleType] call SpawnableVehicle_fnc_IsHelicopter;
		private _vehPos = [(_startingZoneCenter select 0) +  (random [-300,0,300]),(_startingZoneCenter select 1) + (random [-300,0,300])];
		
		//spawn vehicle 
		private _veh = createVehicle [ ([_transportVehicleType] call SpawnableVehicle_get_ClassName),_vehPos,[],100,if(_isAir)then{"FLY"}else{"NONE"}];
		[_object,_veh] call ZoneState_fnc_InitVehicle;
		_veh setUnloadInCombat [true,false];

		//fill vehicle with crew

		private _vehGroup = createGroup _side;
		
		{
			private _pilotType = selectRandom _pilotPool;
			private _pilot = _vehGroup createUnit [[_pilotType] call SpawnableInfantry_get_ClassName,_startingZoneCenter,[],100,"NONE"];
			_pilot moveInAny _veh;
			[_object,_pilot] call ZoneState_fnc_InitUnit;
		}forEach ( (fullCrew [_veh,"driver",true]) + (fullCrew [_veh,"commander",true]) + (fullCrew [_veh,"gunner",true]) );
		

		//create drop of and return waypoints TODO set behaviour
		private _wpUnload = _vehGroup addWaypoint [_targetLandingSpots select (_i mod (count _targetLandingSpots) ),0];
		_wpUnload setWaypointType "TR UNLOAD";
		private _wpReturn = _vehGroup addWaypoint [getPos _veh,1];
		_wpReturn setWaypointType "MOVE";
		_wpReturn setWaypointStatements ["true","{deleteVehicle(vehicle _x);deleteVehicle _x;}forEach (units (group this) )"];

		private _cargoIndex = 0;

		//move infantry untis into cargo of vehicles
		for [{_g= 0},{(_g < _groupPerVehicle) and (_currentGroupIndex < (count _groups))},{_g = _g + 1}] do {
			private _currentGroup = _groups select _currentGroupIndex;
			private _groupUnits = units _currentGroup;
			{
				_x moveInCargo [_veh,_cargoIndex];
				diag_log (format ["Moved %1 into %2 for reinforcment transport",_x,_veh]);
				_cargoIndex = _cargoIndex + 1;
			}forEach _groupUnits;

			private _wpGetOut = _currentGroup addWaypoint [_targetLandingSpots select (_i mod (count _targetLandingSpots) ),0];
			_wpGetOut setWaypointType "GETOUT";
			_wpGetOut synchronizeWaypoint [_wpUnload];


			_currentGroupIndex = _currentGroupIndex + 1;
		};


		
	};  


	private _em = call EventManager_GetInstance;
	[_em,"OnInfantrySpawned",[_units,_zoneID] ] call EventManager_fnc_Trigger;
	[_object,serverTime] call ZoneState_set_LastReinforcement;
};

MUTEX_UNLOCK(SPAWN_UNITS)