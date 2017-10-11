
private _em = call EventManager_GetInstance;
[_em, "OnInfantrySpawned", {_this call smm_fnc_registerUnits}] call EventManager_fnc_AddListener;
[_em, "OnVehiclesSpawned", {[_this select 0, _this select 2] call smm_fnc_registerUnits}] call EventManager_fnc_AddListener;

_tempCuratorMap = [];
{
	_object = [_x] call ZoneState_get_InteractionPoint;
	_zoneID = [_x] call ZoneState_get_ZoneID;
	_zm = call ZonesManager_GetInstance;
	_zone = [_zm, _zoneID] call ZonesManager_fnc_GetZone;
	_radius = [_zone] call Zone_get_Size;
	_curator = [_object, position _object, _radius] call smm_fnc_createCurator;
	_tempCuratorMap set [_zoneID, _curator];
	
} forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
curatorByZoneID = _tempCuratorMap // key: zoneID, value: curator
