_zoneNo = _this select 0;
_wasCounterAttack = _this select 1;
_targetZone = _zoneNo call getZone;
diag_log ("group has been wiped in zone " + str(_zoneNo) );
_nb = [_zoneNo, _zoneNo call smm_fnc_getSide] call smm_fnc_getNeighbour;
diag_log ("Zone " + str(_zoneNo) + " conquered, because it hadn't any NBs");
_zoneNo call smm_fnc_removeVehicle;
[_zoneNo,civilian] call smm_fnc_changeOwner;
 