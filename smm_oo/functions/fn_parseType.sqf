params ["_object"];
diag_log ("Parsing type " + (configName _object));
private _vars = "inheritsFrom _x == (missionConfigFile >> 'OOVar')" configClasses _object;
private _typecheck =compile  (format ["assert ((_this select 0) == '%1')",configName _object]);

{
	[_object,_x,_forEachIndex,_typecheck] call smm_fnc_parseVar;

} forEach _vars;