#include "values.hpp"

params ["_object","_othertypes"];
private _typeName = configName _object;
diag_log ("# Parsing type " + _typeName);
private _typecheck =compile  (format ["assert ((_this select 0) == '%1')",configName _object]);
private _varChecks = [];
private _varSets = [];
private _vars = "inheritsFrom _x == (missionConfigFile >> 'OOVar')" configClasses _object;
{
	private _varData = [_object,_x,_forEachIndex,_typecheck,_othertypes] call smm_fnc_parseVar;
	private _varName = _varData select 0;
	private _varCheck = _varData select 1;
	private _varGet = _varData select 2;
	private _varSet = _varData select 3;

	_varChecks pushBack _varCheck;
	_varSets pushBack _varSet;

} forEach _vars;

private _functions = "inheritsFrom _x == (missionConfigFile >> 'OOFunction')" configClasses _object;
{
	private _fnData = [_typeName,_x,_forEachIndex] call smm_fnc_parseFunction;
}forEach _functions;

private _constructor = compile (format ["['%1',%2,%3,_this] call smm_fnc_innerConstructor",configName _object,_varChecks,_varSets]);
private _publicTypeCheck = compile(format ["[_this select 0,'%1',%2] call smm_fnc_innerTypeCheck",configName _object,_varChecks]);
OO_NAMESPACE setVariable [TYPE_CONSTRUCTOR_NAME(_typeName),_constructor];
OO_NAMESPACE setVariable [TYPE_CHECK_NAME(_typeName),_publicTypeCheck];