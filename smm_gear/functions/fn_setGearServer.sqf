private _gear = _this select 0;
private _uid = _this select 1;
missionNamespace setVariable [_uid call smm_fnc_getGearString,_gear,true];