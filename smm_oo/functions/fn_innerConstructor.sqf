/*
	An object is an array build like the following:
	["Objectname",[var1, var2, var3,...],num_variables]
*/
params["_objectTypeConfig","_varchecklist","_varsetter","_vardata"];
private _objName = configName _objectTypeConfig;
assert ((count _varchecklist) == (count _vardata));
private _obj = [_objName, + _vardata,count _varchecklist];
{
	private _setter = _varsetter select _forEachIndex;
	[_obj,_x] call _setter;
	
} forEach _vardata;
_obj
