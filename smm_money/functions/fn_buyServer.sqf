private ["_price","_uid"];
private _price = _this select 0;
private _uid = _this select 1;
private _curBal = _uid call smm_fnc_getBalanceServer;
private _out = false;
if(_curBal>= _price)then{
private _newmoney = round(0 max (_curBal - _price));
[_newmoney,_uid] call smm_fnc_setBalanceServer;
_out = true;
};
_out