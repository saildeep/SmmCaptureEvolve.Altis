/*smm_buy = {
	private ["_price","_out"];
	_price = _this;
	_out = false;
	private _uid = getPlayerUID player;
	if(_price <= (call smm_get_balance)) then {
		_out = true;
		[_price,_uid] remoteExec ["smm_buy_server",2,false]; 
	};
	_out
};

smm_buy_server = {
	private ["_price","_uid"];
	_price = _this select 0;
	_uid = _this select 1;
	private _curBal = _uid call smm_get_balance_server;
	private _out = false;
	if(_curBal>= _price)then{
	private _newmoney = round(0 max (_curBal - _price));
	[_newmoney,_uid] call smm_set_balance_server;
	_out = true;
	};
	_out
};

smm_add_money = {
	private ["_amount","_uid"];
	
	if((typeName _this) == "ARRAY")then{
		_amount = _this select 0;
		_uid = _this select 1;
	}else{
		_amount = _this;
		_uid = getPlayerUID player;
	};
	[_amount,_uid] remoteExec ["smm_add_money_server",2,false];
};

smm_add_money_server = {
	private ["_amount","_uid"];
	_uid = _this select 1;
	_amount = _this select 0;
	[(_uid call smm_get_balance_server) + _amount,_uid ] call smm_set_balance_server;
	
};
smm_add_money_side = {
	if(isServer)then{
		
		private _amount = _this select 0;
		private _side = _this select 1;
		private _players = allPlayers - entities "HeadlessClient_F";
		{
			if((side _x) == _side)then{
				[_amount,getPlayerUID _x] call smm_add_money;
			};
		}forEach _players;
	}else{
		_this remoteExec ["smm_add_money_side",2,false];
	};
};

smm_show_balance = {
	hint ("You have " + str(call smm_get_balance) + "$");
};
smm_set_balance_server = {
	private _uid = _this select 1;
	private _newmoney = _this select 0;
	
	missionNamespace setVariable ["smm_money_" + _uid,_newmoney,true];
};
smm_get_balance = {
	private _uid = getPlayerUID player;
	_varname = "smm_money_" + _uid;
	//diag_log ("Getting money for varname  "+ _varname);
	missionNamespace getVariable [_varname,smm_money_start]
};
smm_get_balance_server = {
	private _uid = _this;
	_varname = "smm_money_" + _uid;
	//diag_log ("Getting money for varname  "+ _varname);
	missionNamespace getVariable [_varname,smm_money_start]
};

smm_register_uid = {
	private _uid = _this;
	if!(_uid in smm_money_all_uid)then{
		smm_money_all_uid append [_uid];
	};
};
smm_money_transfer_server = {
	private _fromPlayer = _this select 0;
	private _toPlayer = _this select 1;
	private _amount = _this select 2;
	if([_amount,_fromPlayer] call smm_buy_server)then{
		[_amount,_toPlayer] call smm_add_money_server;
	};

};

smm_money_transfer = {
	private _amount = _this select 0;
	private _toPlayer= _this select 1;
	if(isPlayer _toPlayer)then{
	if(_amount > (call smm_get_balance))then{
		hint str_insufficient;
	}else{
		[getPlayerUID player,getPlayerUID _toPlayer,_amount] remoteExec ["smm_money_transfer_server",2,false];
	};
	}else{
		hint str_no_permission;
	};

};

smm_money_transfer_100 = {
	[100,_this select 0] call smm_money_transfer;
};

smm_money_transfer_all = {
	[call smm_get_balance,_this select 0] call smm_money_transfer;
};
*/
