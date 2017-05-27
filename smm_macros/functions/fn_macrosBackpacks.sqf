private _candidates = "(_x call smm_fnc_macrosIsGood) and (_x call smm_fnc_macrosIsBackpack)" configClasses (configFile >> "CfgVehicles");
private _out = [];
{
	private _classname = configName _x;
	private _start =  [_classname, 0, 2] call BIS_fnc_trimString;
	_out append [_classname];

}forEach _candidates;
_out