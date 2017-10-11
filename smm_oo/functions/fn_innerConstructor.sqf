#include "values.hpp"
/*
	An object is an array build like the following:
	["Objectname",[var1, var2, var3,...],num_variables,clientOwner]
*/
params["_objectTypeName","_varchecklist","_varsetter","_vardata"];
//diag_log ("Calling constructor for " + _objectTypeName + " with " + (str _vardata) );
private _objName = _objectTypeName;
assert ((count _varchecklist) == (count _vardata));
private _obj = [_objName, + _vardata,count _varchecklist,clientOwner];
{
	private _setter = _varsetter select _forEachIndex;
	[_obj,_x] call _setter;
	
} forEach _vardata;
[_obj] call (OO_NAMESPACE getVariable TYPE_HOOK_INIT(_objectTypeName));
_obj
