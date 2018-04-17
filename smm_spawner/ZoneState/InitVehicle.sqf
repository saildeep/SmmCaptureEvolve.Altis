params["_object","_v"];
private _zoneID = [_object] call ZoneState_get_ZoneID;

_v setVariable ["zoneid",_zoneID,true];
([_object] call ZoneState_get_Vehicles) pushBackUnique _v;