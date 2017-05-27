private _candidates = "(_x call smm_fnc_macrosIsGood) and (_x call smm_fnc_macrosIsBackpack)" configClasses (configFile >> "CfgVehicles");
private _out = [];
{
	private _classname = configName _x;
	private _start =  [_classname, 0, 2] call BIS_fnc_trimString;
	if(_start == "CUP" or _start == "ACE" or _start == "tf_")then{
		_out append [_classname];
	};
}forEach _candidates;
_out