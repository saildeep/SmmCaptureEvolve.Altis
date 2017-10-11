params["_object"];
private _zoneID = [_object] call ZoneState_get_ZoneID;
private _zone = [call ZonesManager_GetInstance,_zoneID] call ZonesManager_fnc_GetZone;
private _zoneSize = [_zone] call Zone_get_Size;
private _owner = [_zone] call Zone_get_Owner;
private _enemyPlayer = ({side _x != _owner})count (allPlayers - entities "HeadlessClient_F");
_enemyPlayer = sqrt _enemyPlayer;
_zoneSize = (_enemyPlayer * _zoneSize  / 2);
_zoneSize