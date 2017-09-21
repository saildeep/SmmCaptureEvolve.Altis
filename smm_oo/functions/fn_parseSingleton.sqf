#include "values.hpp"
params["_object"];
assert(isNumber (_object >> "isSingleton"));
private _tn = configName _object;
private _isSingleton = (getNumber (_object >> "isSingleton")) > 0;
if(_isSingleton)then{
	diag_log (" -|>Singleton");
	private _getSingleton = format ["['%1'] call smm_fnc_innerSingletonGet",_tn];
	private _setSingleton = format ["params['_obj',['_broadcast',false]];['%1',_obj, _broadcast] call smm_fnc_innerSingletonSet;",_tn];
	diag_log ("  |->Get:" + _getSingleton);
	diag_log ("  |->Set:" + _setSingleton);
	OO_NAMESPACE setVariable [TYPE_SINGLETON_GET_NAME(_tn),compile _getSingleton];
	OO_NAMESPACE setVariable [TYPE_SINGLETON_SET_NAME(_tn),compile _setSingleton];
};