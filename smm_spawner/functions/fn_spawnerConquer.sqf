private _zone = _this select 3;
private _zoneSide = _zone call smm_fnc_getSide;
if!([_zone,playerSide] call smm_fnc_isTarget)exitWith{hint str_no_permission};
if(_zoneSide == (playerSide))then{
	hint str_own_zone;
}else{
	if(_zoneSide == civilian)then{
		[_zone,playerSide] remoteExec ["smm_fnc_changeOwner",2,false];
		private _money =  (_zone call smm_fnc_getSize)*4;
		[_money,playerSide] call smm_fnc_addMoneySide;
	}else{
		hint str_no_permission;
	};
};