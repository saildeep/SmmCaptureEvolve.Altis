

private _typeClasses = ("inheritsFrom _x == (missionConfigFile >> 'OOType')" configClasses (missionConfigFile >> "OOTypes"));
{
	[_x] call smm_fnc_parseType;	
} forEach _typeClasses;