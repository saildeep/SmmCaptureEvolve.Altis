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
params["_functionName","_namespace"];
private _allowInjection = getNumber (getMissionConfig "allowFunctionsRecompile");
if(_allowInjection> 0)then{
	diag_log "Aborting function injection as allowFunctionsRecompile is set to 0 in Description.ext";
};
private _function = _namespace getVariable _functionName;
private _avoidInjection =  (str _function) find "DONOTINJECT";
if((_allowInjection > 0) and  (_avoidInjection <0) ) then{
	private _injectedCode = (format [preprocessFileLineNumbers "smm_oo\functions\fn_injectedMonitorCode.sqf",_functionName,_function]);
	_namespace setVariable [_functionName,compile _injectedCode,false];
	true
}else{
	false
}

