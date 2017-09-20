params["_object","_objecttypecheck","_index","_varcheck","_value"];
assert (_object call _objecttypecheck);
[_value] call _varcheck;
(_object select 1) set [_index,_value];
_value