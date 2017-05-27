diag_log ((str _this)  + " is unconscious");
private _unit = _this select 0;
private _isUnc = _this select 1;

if((local _unit) && _isUnc)then{
	_unit setVariable ["ACE_medical_allowDamage", false, true];
	sleep 3;
	_unit setVariable ["ACE_medical_allowDamage", true, true];
};
if((!_isUnc) && (local _unit))then{
	_unit setVariable ["ACE_medical_allowDamage", true, true];
};