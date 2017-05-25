private ["_amount","_uid"];
private _uid = _this select 1;
private _amount = _this select 0;
[(_uid call smm_fnc_getBalanceServer) + _amount,_uid ] call smm_fnc_setBalanceServer;