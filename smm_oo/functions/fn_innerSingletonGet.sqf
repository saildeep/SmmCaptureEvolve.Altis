#include "values.hpp"
params["_objectname"];
private _singletonVarName = TYPE_SINGLETON_NAME(_objectname);
private _v = OO_NAMESPACE getVariable [_singletonVarName,0];
if(typeName _v != "ARRAY")then{
	waitUntil { (typeName (OO_NAMESPACE getVariable [_singletonVarName,0])) == "ARRAY"  };
};
OO_NAMESPACE getVariable _singletonVarName