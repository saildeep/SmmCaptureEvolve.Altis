
#include "values.hpp"

params["_typename","_functionConfig","_index"];

private _fnName = configName _functionConfig;
diag_log (_fnName + " for " +  _typename + " is being generated" );
assert(isText (_functionConfig>>"code"));
assert(isText (_functionConfig>>"file"));
private _fnCode = getText (_functionConfig >> "code");
//if code is not specified, load file instead
if(_fnCode == "")then{
	_fnCode = preprocessFileLineNumbers (getText (_functionConfig >> "file"));
};

private _functionCompiled = compile _fnCode;

private _fnCall = format ["[_this select 0,'%1' ,_this select [1,(count _this) -1],%2 ] call smm_fnc_innerFunctionCall",_typename,_functionCompiled];


OO_NAMESPACE setVariable [TYPE_FUNCTION_NAME(_typename,_fnName),compile _fnCall];
_fnCall