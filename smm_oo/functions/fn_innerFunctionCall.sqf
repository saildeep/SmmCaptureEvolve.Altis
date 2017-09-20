#include "values.hpp"
params["_object","_objecttypename","_params","_function"];
private _checkFn = OO_NAMESPACE getVariable TYPE_CHECK_NAME(_objecttypename);
[_object] call _checkFn;
([_object] + _params) call _function;