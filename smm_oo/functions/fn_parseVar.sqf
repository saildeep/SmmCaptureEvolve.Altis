#include "values.hpp"
params ["_object","_config","_index","_typeCheck"];
// do type checking
private _typeNameConfig = _config >> "typeName";
assert(isText _typeNameConfig);
assert( (getText _typeNameConfig) in ["ARRAY","BOOL","LOCATION","SCALAR","SCRIPT","SIDE","STRING","TEXT"]);
private _typeName = getText _typeNameConfig;


private _getConfig = _config >> "get";
private _setConfig = _config >> "set";
private _varTypeCheckConfig = _config >> "typeCheck";
assert(isText _getConfig);
assert(isText _setConfig);
assert(isText _varTypeCheckConfig);

private _varTypeCheck = getText _varTypeCheckConfig;

private _check = format ["[_this select 0,'%1',%2] call smm_fnc_innerVarCheck",_typeName,compile _varTypeCheck];
private _get = format["[_this select 0,%1,%2] call smm_fnc_innerVarGet",_typeCheck,_index];
private _set = format ["[_this select 0,%1,%2,'%3',%4,_this select 1]",_typeCheck,_index,_typeName,compile _varTypeCheck];

diag_log _check;

OO_NAMESPACE setVariable [(configName _object)+"_check_"+(configName _config),compile _check];
OO_NAMESPACE setVariable [(configName _object)+"_get_"+(configName _config),compile _get];
OO_NAMESPACE setVariable [(configName _object)+"_set_"+(configName _config),compile _set];