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
private _zm = call ZonesManager_GetInstance;
{
    private _c = _x;
    
    //[_forEachIndex,[_x] call Zone_get_Side] call smm_fnc_changeOwner;
    private _zoneNumber = [_x] call Zone_get_ID;
    
    private _center = [_c] call Zone_get_Position;
    private _size =[_c] call Zone_get_Size;
    //draw connections to neighbour
    private _cZoneNumber = _zoneNumber;
    private _neighbours = [_x] call Zone_get_Neighbours;
    private _pos = [_x] call Zone_get_Position;
    private _carrierList = [_x] call Zone_get_CarrierSpots;
    diag_log ("Zone on HC:" + (str _x));
    {
        //only draw connections from lower to higher
        if(_x < _cZoneNumber) then {
        
            private _nb = [_zm,_x] call ZonesManager_fnc_GetZone;
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
            _mark setMarkerAlpha 1;
        
        };
    }forEach _neighbours;

    //spawn interaction points
    private _interaction_point_position = ([_c] call Zone_get_Position) findEmptyPosition [0,[_c] call Zone_get_Size,smm_spawner_interaction_object];
    private _interaction_point = smm_spawner_interaction_object createVehicle _interaction_point_position;
    _interaction_point setVariable ["ace_medical_isMedicalFacility",true,true];
    _interaction_point allowDamage false;

    private _seizeTriggers = [west,east,independent] apply{
        private _trg = createTrigger ["EmptyDetector",[_c] call Zone_get_Position,false];
        private _sideID = smm_spawner_all_factions find _x;
        private _activationCode = format["[%1,%2] call smm_fnc_seizeZone",_cZoneNumber,_sideID];
        _trg setTriggerActivation[(str _x) + " SEIZED","PRESENT",true];
        _trg setTriggerArea[_size/2,_size/2,0,false];
        _trg setTriggerTimeout [40,50, 60, true];
        _trg setTriggerStatements["this",_activationCode,""];
        _trg

    };
    private _triggerCollection = _seizeTriggers call TriggerCollection_create;
    private _carrierInteractionPoints = [];
    
   
   {
        diag_log ("Using carrier pos "+ str(_x));
        private _carrierPos = [_x] call Position3D_fnc_ToArray;
        [_carrierPos] remoteExec ["smm_fnc_spawnCarrierServer",2,false];
        
        _spawnedCarriers pushBack _carrier;

        private _carrierInteractionPos = [_carrierPos,"interaction"] call smm_fnc_getSpawnPositionRelativeToCarrier;
        diag_log ("Spawning carrier tent at " + str(_carrierInteractionPos));
        private _carrierInteractionPoint = smm_spawner_interaction_object createVehicle _carrierInteractionPos;
        _carrierInteractionPoint setPosASL _carrierInteractionPos;
        _carrierInteractionPoint setVariable ["ace_medical_isMedicalFacility",true,true];
        _carrierInteractionPoint allowDamage false;
        _carrierInteractionPoints pushBack  _carrierInteractionPoint;

    } forEach _carrierList;


    _zoneStates pushBack ([_cZoneNumber,[],[],[_interaction_point] +_carrierInteractionPoints,_triggerCollection,0,[]] call ZoneState_create);
}forEach ([_zm] call ZonesManager_get_Zones );// does blocking wait unitl zones finished generating

private _initialTargets = [[],[],[]] call TargetCollection_create;

[[_zoneStates,_initialTargets] call ZoneStatesManager_create,true] call ZoneStatesManager_SetInstance;

//call get building and tree density once the have good min/max 5 zones should represent this fairly well
{
    [_x] call ZoneState_fnc_GetNormalizedBuildingDensity;
    [_x] call ZoneState_fnc_GetNormalizedTreeDensity;
}forEach [selectRandom _zoneStates,selectRandom _zoneStates,selectRandom _zoneStates,selectRandom _zoneStates,selectRandom _zoneStates];

diag_log (_prefix + "Finished building zone states");

spawner_init_finished = 100;
publicVariable "spawner_init_finished";
[call ZoneStatesManager_GetInstance] call ZoneStatesManager_fnc_UpdateTargets;

//add event for updating zones. Should make sure, that update targets is only called if the zones are up-to date.
[{
    [call ZoneStatesManager_GetInstance] call ZoneStatesManager_fnc_UpdateTargets;
}] call ZonesManager_AddUpdateListener;
//TODO reimplement money giving over time stuff