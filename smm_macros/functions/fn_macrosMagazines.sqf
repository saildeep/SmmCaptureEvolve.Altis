private _candidates = "(_x call smm_fnc_macrosIsGood) and (_x call smm_fnc_macrosIsMagazine)" configClasses (configFile >> "CfgMagazines");
private _out = [];
{
	private _classname = configName _x;
	private _start =  [_classname, 0, 3] call BIS_fnc_trimString;
	_out append [_classname];
	
}forEach _candidates;
_out