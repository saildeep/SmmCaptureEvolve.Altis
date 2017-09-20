#include "values.hpp"

params ["_object"];
diag_log ("Parsing type " + (configName _object));
private _vars = "inheritsFrom _x == (missionConfigFile >> 'OOVar')" configClasses _object;
private _typecheck =compile  (format ["assert ((_this select 0) == '%1')",configName _object]);
private _varChecks = [];
private _varSets = [];
{
	private _varData = [_object,_x,_forEachIndex,_typecheck] call smm_fnc_parseVar;
	private _varName = _varData select 0;
	private _varCheck = _varData select 1;
	private _varGet = _varData select 2;
	private _varSet = _varData select 3;

	_varChecks pushBack _varCheck;
	_varSets pushBack _varSet;

} forEach _vars;

private _constructor = compile (format ["['%1',%2,%3,_this] call smm_fnc_innerConstructor",configName _object,_varChecks,_varSets]);
OO_NAMESPACE setVariable [(configName _object) + "_create",_constructor];