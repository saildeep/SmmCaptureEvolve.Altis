
_curatorCameraCeiling = 50; // Todo: move to the other config variables

curatorByZoneID = []; // key: zoneID, value: curator

[] spawn{
    {
		_object = [_x] call ZoneState_get_InteractionPoint;
		_zoneID = [_x] call ZoneState_get_ZoneID;
		_zm = call ZonesManager_GetInstance;
		_zone = [_zm, _zoneID] call ZonesManager_GetZone;
		_radius = [_zone] call Zone_get_Size;
		_curator = [_object, position _object, _radius, _curatorCameraCeiling] call smm_fnc_createCurator;
		curatorByZoneID set [_zoneID, _curator];
		
	} forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};

private _em = call EventManager_GetInstance;
[_em, "OnInfantrySpawned", {_this call smm_fnc_registerUnits}] call EventManager_fnc_AddListener;
[_em, "OnVehiclesSpawend", {[_this select 0, _this select 2] call smm_fnc_registerUnits}] call EventManager_fnc_AddListener;
