#include "values.hpp"
params["_var","_typeName","_typeCheckFn","_isArray","_isNative","_varname","_classname"];
//wrap single variable also in array to make check easier
private _wrappedVar = if(_isArray)then{_var}else{[_var]};
if((typeName _wrappedVar) != "ARRAY")then{
	["Expected %1 in Class %2 and Variable %3 to be off type ARRAY",_var,_typeName,_varname] call BIS_fnc_error;
};

{	
	/*
	if(isNil{_x})then{
		["Expected %1 in Class %2 and Variable %3 with value %4 to not nil",_x,_typeName,_varname,_wrappedVar] call BIS_fnc_error;
	};*/
	
	
	if(_isNative)then{
		if((typeName _x )!= _typeName)then{
			["Expected %1 with type %2 in Class %3 and Variable %4 to be off type %5",_var,typeName _x,_classname,_varname,_typeName] call BIS_fnc_error;
		};
	}else{
		//handle custom type
		[_x] call (OO_NAMESPACE getVariable TYPE_CHECK_NAME(_typeName));
	};
	if(!(_x call _typeCheckFn))then{
		["Expected %1  in Class %2 and Variable %3 to be fullfill %4",_var,_classname,_varname,_typeCheckFn] call BIS_fnc_error;
	};
	
} forEach _wrappedVar;
