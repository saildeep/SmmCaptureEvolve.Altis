private _amount = _this select 0;
private _toPlayer= _this select 1;
if(isPlayer _toPlayer)then{
if(_amount > (call smm_fnc_getBalance))then{
	hint str_insufficient;
}else{
	[getPlayerUID player,getPlayerUID _toPlayer,_amount] remoteExec ["smm_fnc_moneyTransferServer",2,false];
};
}else{
	hint str_no_permission;
};