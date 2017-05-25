private _fromPlayer = _this select 0;
private _toPlayer = _this select 1;
private _amount = _this select 2;
if([_amount,_fromPlayer] call smm_fnc_buyServer)then{
	[_amount,_toPlayer] call smm_fnc_addMoneyServer;
};