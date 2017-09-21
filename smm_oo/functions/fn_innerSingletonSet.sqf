#include "values.hpp"
params["_objectname","_v","_broadcast"];
private _objectTypeCheck = OO_NAMESPACE getVariable TYPE_CHECK_NAME(_objectname);
private _singletonVarName = TYPE_SINGLETON_NAME(_objectname);
[_v] call _objectTypeCheck;
OO_NAMESPACE setVariable[_singletonVarName,_v,_broadcast];
