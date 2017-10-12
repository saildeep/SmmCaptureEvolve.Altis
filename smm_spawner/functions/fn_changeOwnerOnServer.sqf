//ONLY CALLED OVER NETWORK
params["_zoneid","_newowner"];
assert(isServer);
private _manager = call ZonesManager_GetInstance;
private _zone = [_manager,_zoneid] call ZonesManager_fnc_GetZone;
private _reward = [_zone] call Zone_fnc_GetZoneReward;
[_reward,_newowner] call smm_fnc_addMoneySide;
[_zone,_newowner] call Zone_set_Owner;
[_zone] call Zone_fnc_UpdateMarkers;
call ZonesManager_BroadcastInstance;