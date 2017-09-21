private _prefix = "[INITHC] ";
diag_log (_prefix + "Creating centers");
createCenter west;
createCenter east;
createCenter independent;
createCenter civilian;

diag_log (_prefix + "Creating target arrays");

private _zoneStates = [];
private _buildingType = ["House", "Building"];
diag_log (_prefix + "Building zoneStates");
{
    private _c = _x;
    private _marker = createMarker [[_x] call Zone_get_Hash,[_x] call Zone_get_Position];
    _marker setMarkerSize [([_x] call Zone_get_Size),([_x] call Zone_get_Size)];
    _marker setMarkerShape "ELLIPSE";
    _marker setMarkerAlpha 0;
    
    //[_forEachIndex,[_x] call Zone_get_Side] call smm_fnc_changeOwner;
    private _zoneNumber = [_x] call Zone_get_ID;
    
    //get buildings with positions;
    private _currentBuildings = [];
    private _center = [_c] call Zone_get_Position;
    private _size =[_c] call Zone_get_Size;
    private _allBuildingObjects = nearestObjects [_center,_buildingType,_size];
    {
        private _buildingPos = _x buildingPos -1;
        if((count _buildingPos)>=smm_spawner_units_per_group )then{
            _currentBuildings pushBack [_x,_buildingPos];
        }
    }forEach _allBuildingObjects;
    
    
    //draw connections to neighbour
    private _cZoneNumber = _zoneNumber;
    private _neighbours = [_x] call Zone_get_Neighbours;
    private _pos = [_x] call Zone_get_Position;
    {
        //only draw connections from lower to higher
        if(_x < _cZoneNumber) then {
        
            private _nb = [call ZonesManager_GetInstance,_x] call ZonesManager_fnc_GetZone;
            private _nbPos = [_nb] call Zone_get_Position;
            private _meanPos = [_pos,_nbPos] call getMean;
            private _markerSize = (_pos distance _meanPos)*0.9;
            private _angle = [_pos,_meanPos] call BIS_fnc_dirTo;
            private _markerName = ([_c] call Zone_get_Hash) + "_" + ([_nb] call Zone_get_Hash);
            private _mark = createMarker [_markerName,_meanPos];
            _mark setMarkerShape "RECTANGLE";
            _mark setMarkerSize [10,_markerSize];
            _mark setMarkerColor "ColorBlack";
            _mark setMarkerDir _angle;
            _mark setMarkerPos _meanPos;
            _mark setMarkerAlpha 0;
        
        };
    }forEach _neighbours;

    //spawn interaction points
    private _interaction_point_position = ([_c] call Zone_get_Position) findEmptyPosition [0,[_c] call Zone_get_Size,smm_spawner_interaction_object];
    private _interaction_point = smm_spawner_interaction_object createVehicle _interaction_point_position;
    _interaction_point setVariable ["ace_medical_isMedicalFacility",true,true];

    private _seizeTriggers = [west,east,independent] apply{
        private _trg = createTrigger ["EmptyDetector",[_c] call Zone_get_Position,false];
        private _sideID = smm_spawner_all_factions find _x;
        private _activationCode = format["[%1,%2] call smm_fnc_seizeZone",_cZoneNumber,_sideID];
        _trg setTriggerActivation[(str _x) + " SEIZED","PRESENT",true];
        _trg setTriggerArea[10,10,0,false];
        _trg setTriggerTimeout [40,50, 60, true];
        _trg setTriggerStatements["this",_activationCode,""];
        _trg

    };
    private _triggerCollection = _seizeTriggers call TriggerCollection_create;

    _zoneStates pushBack ([_cZoneNumber,[],[],_allBuildingObjects,_marker,_interaction_point,_triggerCollection] call ZoneState_create);
}forEach ([call ZonesManager_GetInstance] call ZonesManager_get_Zones );// does blocking wait unitl zones finished generating
private _initialTargets = [[],[],[]] call TargetCollection_create;
[[_zoneStates,_initialTargets] call ZoneStatesManager_create,true] call ZoneStatesManager_SetInstance;

diag_log (_prefix + "Finished building zone states");

spawner_init_finished = 100;
publicVariable "spawner_init_finished";
[]call smm_fnc_spawnerUpdateTargets;

//TODO reimplement money giving over time stuff