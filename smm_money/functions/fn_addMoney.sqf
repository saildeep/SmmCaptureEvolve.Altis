private ["_amount","_uid"];
if((typeName _this) == "ARRAY")then{
	_amount = _this select 0;
	_uid = _this select 1;
}else{
	_amount = _this;
	_uid = getPlayerUID player;
};
[_amount,_uid] remoteExec ["smm_fnc_addMoneyServer",2,false];