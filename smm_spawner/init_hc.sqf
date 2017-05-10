//create HQ's
createCenter west;
createCenter east;
createCenter independent;
createCenter civilian;
waitUntil {!(isNil "spawnLocs")};
_markerNumerator = 0;
zoneNoToUnits = [];
zoneNoToVehicle = [];
zoneActive = [];
spawnTriggers = [];
zoneNoToBuildings = []; //format ...[object,[position]]...
_buildingType = ["House", "Building"];
{
zoneActive append [false];
zoneNoToUnits pushBack [];
_c = _x;
_marker = createMarker [_c select 1 ,_c select 0];
 _marker setMarkerColor ((_c select 3)call getColor);
 _marker setMarkerSize [(_c select 2),( _c select 2)];
 _marker setMarkerShape "ELLIPSE";
 _marker setMarkerAlpha 0;
 
 [_forEachIndex,_c select 3] call smm_change_owner;
 _zoneNumber = _forEachIndex;
 
 //get buildings with positions;
 _currentBuildings = [];
 _center = _c select 0;
 _size = _c select 2;
 _allBuildingObjects = nearestObjects [_center,_buildingType,_size];
 {
    _buildingPos = _x buildingPos -1;
    if((count _buildingPos)>=smm_spawner_units_per_group )then{
        _currentBuildings pushBack [_x,_buildingPos];
    }
 }forEach _allBuildingObjects;
 zoneNoToBuildings pushBack (_currentBuildings call BIS_fnc_arrayShuffle);
 
 //Create Triggers for enter zone
 _allEnterTriggers = [];
{
    _triggersize = (_c call getSize) + smm_spawner_spawn_range;
    //create activation triggers 
    _entertrg = createTrigger ["EmptyDetector",_c select 0,false];
    _entertrg setTriggerArea [_triggersize,_triggersize,0,false];
    _entertrg setTriggerActivation [str _x,"PRESENT",true];
    diag_log (format ["[ %1 , %2 ] call onZoneEnter",_zoneNumber, _x call macros_to_config_side]);
    _entertrg setTriggerStatements["this",format ["[ %1 , %2 ] call onZoneEnter",_zoneNumber, _x call macros_to_config_side],""];
    
    _allEnterTriggers append [_entertrg];
}forEach smm_spawner_player_factions; 
spawnTriggers append [_allEnterTriggers];
//create Trigger for leaving zone
_exittrg = createTrigger ["EmptyDetector",_c select 0,false];
_exittrg setTriggerArea [100,100,100,false];
_exittrg setTriggerActivation ["ANY","PRESENT",true];
_exittrg setTriggerTimeout [60 * 30,60 * 45,60 *60,true];
_exittrg setTriggerStatements [format ["({(triggerActivated _x)} count (spawnTriggers select %1))==0",_forEachIndex], str(_forEachIndex) +" call onZoneLeave",""];

zoneNoToVehicle append [[]];
//draw connections
_c = _x;
_cId = _forEachIndex;
_neighbours = _c select 4;
_pos = _c select 0;
    {
    if(_x < _cId) then {
    
         _nb = _x call getZone;
         _nbPos = _nb select 0;
         _meanPos = [_pos,_nbPos] call getMean;
         _markerSize = (_pos distance _meanPos)*0.9;
         _angle = [_pos,_meanPos] call BIS_fnc_dirTo;
         _markerName = (_x call getHash) + "_" + (_cId call getHash);
         _mark = createMarker [_markerName,_meanPos];
         _mark setMarkerShape "RECTANGLE";
         _mark setMarkerSize [10,_markerSize];
         _mark setMarkerColor "ColorBlack";
         _mark setMarkerDir _angle;
         _mark setMarkerPos _meanPos;
         _mark setMarkerAlpha 0;
     //TODO continue
     };
    }forEach _neighbours;


}forEach spawnLocs;
_d = [];
{       _position = (_x call getPosition) findEmptyPosition [0,_x call getSize,smm_spawner_interaction_object];
        _flag = smm_spawner_interaction_object createVehicle _position;
        _d append [_flag];
        _flag allowDamage false;
        _flag setVariable ["ace_medical_isMedicalFacility",true,true];
        
}forEach spawnLocs;
interaction_points = _d;
publicVariable "interaction_points";
_directionOfFirstStartZone = random 360;
_directionOfStartZones     = [_directionOfFirstStartZone,_directionOfFirstStartZone +180];
{
    _currentFaction = _x;
    //determine startZone
    _numPlayerZones = 0;
    {
        if((_x select 3) == _currentFaction)then{
        _numPlayerZones = _numPlayerZones + 1;
        };

    }forEach spawnLocs;
    if(_numPlayerZones == 0)then{
        _direction = _directionOfStartZones select _forEachIndex;
        
        diag_log (format ["Determining start zone for %1 at %2 °",_currentFaction,_direction]);
        _selectedZone     = 0;
        _minDistance      = 100000000; 
        _factor           = 10000000; 
        _meassurePosition = [_factor * (sin _direction),_factor * (cos _direction),0];
        
        {
            
            _distance = (_x select 0) distance _meassurePosition;
            
            if(_distance < _minDistance)then{
                _selectedZone = _forEachIndex;
                _minDistance  = _distance;
            };
        }forEach spawnLocs;
        _startZone = _selectedZone;
        while{((spawnLocs select _startZone) select 3) != smm_spawner_default_owner}do{
            floor (random (count spawnLocs));
        };
        
        [_startZone,_currentFaction]  call smm_change_owner;
        
    };
}forEach smm_spawner_player_factions;

spawner_init_finished = 100;
publicVariable "spawner_init_finished";
[]call smm_spawner_update_targets;
while{true}do{
    sleep 300;
    _currentDivider = random [20,40,100];
    //infinite loop for money generation
    {
        _currentFaction = _x;
        _overallMoney = 0;
        {
            if(_currentFaction == (_x call getSide))then{
                _overallMoney = _overallMoney + (_x call getSize);
            };
        }forEach spawnLocs;
        _addMoney = floor (_overallMoney / _currentDivider);
        [_addMoney,_currentFaction] call smm_add_money_side;
    
    }forEach smm_spawner_all_factions ;

};



