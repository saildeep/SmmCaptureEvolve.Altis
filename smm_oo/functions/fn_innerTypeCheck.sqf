params ["_object","_typename","_varchecks"];
assert ((_object select 0)== _typename);
assert ((count (_object select 1) ) == (_object select 2) );
{
	private _varCheck = _varchecks select _forEachIndex;
	[_x] call _varCheck;
	
} forEach (_object select 1);