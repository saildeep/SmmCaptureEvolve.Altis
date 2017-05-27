private _side = _this;
private _sideNo = _side call smm_fnc_macrosToConfigSide;
private _candidates =  "(_x call smm_fnc_macrosIsGood) and (_x call smm_fnc_macrosIsUnit) and ([_x," + (str _sideNo)+ "] call smm_fnc_macrosIsSide)" configClasses (configFile >> "CfgVehicles");
private _out = [];
{
private _classname = configName _x;
private _start =  [_classname, 0, 3] call BIS_fnc_trimString;
	if(_start == "CUP_")then{
		private _cost = 10 + (_forEachIndex % 20 );
		_out append [[_classname,_cost]];
	};


}forEach _candidates;
_out