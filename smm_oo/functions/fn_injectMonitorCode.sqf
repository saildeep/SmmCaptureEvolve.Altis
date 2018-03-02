/**

	Author:Jonas Körner

	Params:
	0: function name (string)
	1: function namespace(namespace)

	Injects the code from smm_oo\functions\fn_injectedMonitorCode.sqf around this function if it does not contain the string
	DONOTINJECT

	Returns:
	true if the function was injected, false otherwise

*/
#define CURLY_OPEN_CODE ((toArray '{') select 0)
#define CURLY_CLOSE_CODE ((toArray '}') select 0)

params["_functionName","_namespace"];
private _allowInjection = getNumber (getMissionConfig "allowFunctionsRecompile");
if(_allowInjection < 1)then{
	diag_log "Aborting function injection as allowFunctionsRecompile is set to 0 in Description.ext";
};
private _function = _namespace getVariable _functionName;
private _avoidInjection =  (str _function) find "DONOTINJECT";
if((_allowInjection > 0) and  (_avoidInjection <0) ) then{
	private _functionCode = str _function;
	private _functionUnicode = toArray _functionCode;

	//assert first character is open curly brace
	assert ((_functionUnicode select 0) == CURLY_OPEN_CODE);
	//assert last character is closed curly brace
	assert ((_functionUnicode select ((count _functionCode) -1) ) == CURLY_CLOSE_CODE);

	_functionCode = _functionCode select [1,(count _functionUnicode) -2 ];

	//now remove sourounding curly braces
	private _injectedCode = (format [preprocessFileLineNumbers "smm_oo\functions\fn_injectedMonitorCode.sqf",_functionName,_functionCode]);
	_namespace setVariable [_functionName,compile _injectedCode,false];
	true
}else{
	false
}

