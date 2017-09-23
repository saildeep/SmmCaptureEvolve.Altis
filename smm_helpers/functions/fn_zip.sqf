//Zips to arrays like commonly used in python
params["_a","_b"];
assert((typeName _a) == "ARRAY" );
assert((typeName _b) == "ARRAY");
assert((count _a) == (count _b));
private _out = [];
{
	private _y = _b select _forEachIndex;
	_out pushBack [_x,_y];
} forEach _a;
_out