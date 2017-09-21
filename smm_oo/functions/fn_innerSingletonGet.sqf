#include "values.hpp"
params["_objectname",["_autoinitparams",""]];
private _singletonVarName = TYPE_SINGLETON_NAME(_objectname);
private _v = OO_NAMESPACE getVariable [_singletonVarName,0];
if(typeName _v != "ARRAY")then{
	if((typeName _autoinitparams) == "ARRAY")then{
		private _p =_autoinitparams;
		_o =  _p call (OO_NAMESPACE getVariable TYPE_CONSTRUCTOR_NAME(_objectname));
		[_o] call (OO_NAMESPACE getVariable TYPE_SINGLETON_SET_NAME(_objectname));
	}else{
		if(!canSuspend)then{
			["Cannot suspend for singleton wait for %1",_objectname] call BIS_fnc_error;
		};

		waitUntil { (typeName (OO_NAMESPACE getVariable [_singletonVarName,0])) == "ARRAY"  };
	};
};
OO_NAMESPACE getVariable _singletonVarName