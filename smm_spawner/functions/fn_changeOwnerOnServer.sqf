//ONLY CALLED OVER NETWORK
params["_zoneid","_newowner"];
assert(isServer);
private _manager = call ZonesManager_GetInstance;
private _zone = [_manager,_zoneid] call ZonesManager_fnc_GetZone;
private _size = [_zone] call Zone_get_Size;
[_size,_newowner] call smm_fnc_addMoneySide;
[_zone,_newowner] call Zone_set_Owner;
[_zone] call Zone_fnc_UpdateMarkers;
call ZonesManager_BroadcastInstance;
[] remoteExec ["smm_fnc_updateTargetsOnHC",[call ZoneStatesManager_GetInstance] call ZoneStatesManager_owner,false];