
#include "values.hpp"

params["_typename","_functionConfig","_index"];
private _tn = _typename;
private _fnName = configName _functionConfig;
diag_log (" -|>Func:" + _fnName);
assert(isText (_functionConfig>>"code"));
assert(isText (_functionConfig>>"file"));
private _fnCode = getText (_functionConfig >> "code");
//if code is not specified, load file instead
private _logmsg = _fnCode;
if(_fnCode == "")then{
	_fnCode = preprocessFileLineNumbers (getText (_functionConfig >> "file"));
	_logmsg = getText (_functionConfig >> "file");
};

private _functionCompiled = compile _fnCode;

private _fnCall = format ["[_this select 0,'%1' ,_this select [1,(count _this) -1],%2 ] call smm_fnc_innerFunctionCall",_typename,_functionCompiled];
diag_log ("  |->call:"+_logmsg);

OO_NAMESPACE setVariable [TYPE_FUNCTION_NAME(_typename,_fnName),compile _fnCall];
_fnCall