params["_object"];
private _zoneID = [_object] call ZoneState_get_ZoneID;
private _zone = [_zoneID] call ZonesManager_fnc_GetZone;
private _zoneSize = [_zone] call Zone_get_Size;
//TODO make player dependent
_zoneSize