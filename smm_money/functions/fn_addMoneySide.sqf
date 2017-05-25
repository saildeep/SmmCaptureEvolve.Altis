if(isServer)then{
	private _amount = _this select 0;
	private _side = _this select 1;
	private _players = allPlayers - entities "HeadlessClient_F";
	{
		if((side _x) == _side)then{
			[_amount,getPlayerUID _x] call smm_fnc_addMoney;
		};
	}forEach _players;
}else{
	_this remoteExec ["smm_fnc_addMoneySide",2,false];
};