#include "values.hpp"
params ["_object","_config","_index","_typeCheck","_customTypes"];
private _tn = configName _object;
private _vn = configName _config;
diag_log (" -|>Var:"+_vn);
// do type checking
private _typeNameConfig = _config >> "typeName";
assert(isText _typeNameConfig);

//Build check for type
//Type can be either NATIVE, CUSTOM,[NATIVE],[CUSTOM]
private _nativeTypes = ["BOOL","LOCATION","SCALAR","SCRIPT","SIDE","STRING","TEXT","CODE","OBJECT"];
private _allSimpleTypes = _nativeTypes + _customTypes;
private _allArrayTypes = _allSimpleTypes apply {"[" + _x + "]"};
private _allTypes = _allSimpleTypes + _allArrayTypes;
assert( (getText _typeNameConfig) in _allTypes);
private _typeName = getText _typeNameConfig;
private _isArray = _typeName in _allArrayTypes;
private _simpleType = if(_isArray)then{_allSimpleTypes select (_allArrayTypes find _typeName)}else{_typeName};
private _isNativeType = _simpleType in _nativeTypes;

private _getConfig = _config >> "get";
private _setConfig = _config >> "set";
private _varTypeCheckConfig = _config >> "typeCheck";
assert(isText _getConfig);
assert(isText _setConfig);
assert(isText _varTypeCheckConfig);

private _varTypeCheck = getText _varTypeCheckConfig;

private _check = format ["[_this select 0,'%1',%2,%3,%4,'%5','%6'] call smm_fnc_innerVarCheck",_simpleType,compile _varTypeCheck,_isArray,_isNativeType,_vn,_tn];
diag_log ("  |->Var-Check:"+ _check);
private _get = format["[_this select 0,%1,%2] call smm_fnc_innerVarGet",_typeCheck,_index];
diag_log ("  |->Var-Get:"+ _get);
private _set = format ["[_this select 0,%1,%2,%3,_this select 1] call smm_fnc_innerVarSet",_typeCheck,_index,compile _check];
diag_log ("  |->Var-set:"+ _set);


OO_NAMESPACE setVariable [TYPE_VAR_CHECK_NAME(_tn,_vn),compile _check];
OO_NAMESPACE setVariable [TYPE_VAR_GETTER_NAME(_tn,_vn),compile _get];
OO_NAMESPACE setVariable [TYPE_VAR_SETTER_NAME(_tn,_vn),compile _set];

[configName _config,compile _check, compile _get, compile _set]