
/*
	An object is an array build like the following:
	["Objectname",[var1, var2, var3,...]]
*/

private _typeClasses = ("inheritsFrom _x == (missionConfigFile >> 'OOType')" configClasses (missionConfigFile >> "OOTypes"));
{
	[_x] call smm_fnc_parseType;	
} forEach _typeClasses;