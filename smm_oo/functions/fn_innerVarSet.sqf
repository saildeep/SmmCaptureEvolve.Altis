params["_object","_objecttypecheck","_index","_vartype","_vartypecheck","_value"];
assert ([_object] call _objecttypecheck);
assert (typeName _value == _vartype);
assert (_value call _vartypecheck);
(_object select 1) set [_index,_value];
_value