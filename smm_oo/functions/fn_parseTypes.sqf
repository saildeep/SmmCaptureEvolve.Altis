

private _typeClasses = ("inheritsFrom _x == (missionConfigFile >> 'OOType')" configClasses (missionConfigFile >> "OOTypes"));
{
	[_x,(_typeClasses apply {configName _x}) - [configName _x] ] call smm_fnc_parseType;	
} forEach _typeClasses;
missionNamespace setVariable["oo_init",true,false];