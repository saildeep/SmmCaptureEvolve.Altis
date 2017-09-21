_type = _this select 1;
_classname = _this select 0;
_uid = _this select 2;
_typeNumber = _type call smm_fnc_getArsenalIndex;
_gear = _uid call smm_fnc_getGearServer;
diag_log (format ["Adding %1 with type %2 and typeno %3 for uuid %4",_classname,_type,_typeNumber,_uid]);
if !(_classname in (_gear select _typeNumber))then{
    (_gear select _typeNumber) pushBack _classname;
    [_gear,_uid] call smm_fnc_setGearServer; //obsolete
};