
#include "values.hpp"

params["_typename","_functionConfig","_index"];

private _fnName = configName _functionConfig;
diag_log (_fnName + " for " +  _typename + " is being generated" );
assert(isText (_functionConfig>>"code"));
private _fnCode = getText (_functionConfig >> "code");
private _functionCompiled = compile _fnCode;

private _fnCall = format ["[_this select 0,'%1' ,_this select [1,(count _this) -1],%2 ]",_typename,_functionCompiled];


OO_NAMESPACE setVariable [TYPE_FUNCTION_NAME(_typename,_fnName),compile _fnCall];
_fnCall