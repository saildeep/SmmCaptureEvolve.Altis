private _candidates = "(_x call smm_fnc_macrosIsGood) and (_x call smm_fnc_macrosIsItem) and (_x call smm_is_not_thermal)" configClasses (configFile >> "CfgWeapons");
private _out = [];
{
	private _classname = configName _x;
	private _start =  [_classname, 0, 2] call BIS_fnc_trimString;
	_out append [_classname];
	
}forEach _candidates;
_out