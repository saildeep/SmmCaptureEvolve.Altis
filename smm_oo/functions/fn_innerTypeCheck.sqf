params ["_object","_typename","_varchecks"];

if((typeName _object) != "ARRAY")then{
	throw (format ["You must supply %1 in square brackets []",_typename]);
};

if( (typeName (_object select 0)) != "STRING")then{
	throw (format ["You supplied too many square brackets for %1, so the inner type shows at %2",_typename,_object select 0]);
};

if((_object select 0) != _typename )then{
	throw (format["Called method for %1 on object of type %2",_typename,_object select 0]);
};
if( (count (_object select 1) ) != (_object select 2) )then{
	throw (format["Variable count for %1 corrupted",_typename]);
};
/*
{
	private _varCheck = _varchecks select _forEachIndex;
	[_x] call _varCheck;
	
} forEach (_object select 1);*/