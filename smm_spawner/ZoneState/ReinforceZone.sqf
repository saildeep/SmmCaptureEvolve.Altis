params["_object"];
#include "..\..\mutex.hpp"
MUTEX_LOCK(SPAWN_UNITS)

private _zoneID = [_object] call ZoneState_get_ZoneID;
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

//only reinforce if there are friendly nb zones and the cooldown is over
if((count _nbs) > 0 && ((_last + _cooldown) > serverTime) )then{
	private _startingZone = _nbs select 0; // todo select zone that matches best, not random one
	[[_startingZone] call Zone_get_Position,"ColorOrange",120] call smm_fnc_createDebugMarker;


};

MUTEX_UNLOCK(SPAWN_UNITS)