#include "values.hpp"
params["_var","_typeName","_typeCheckFn","_isArray","_isNative"];
//wrap single variable also in array to make check easier
private _wrappedVar = if(_isArray)then{_var}else{[_var]};
assert((typeName _wrappedVar) == "ARRAY");
{
	
	if(_isNative)then{
		assert( (typeName _x )== _typeName);
	}else{
		//handle custom type
		[_x] call (OO_NAMESPACE getVariable TYPE_CHECK_NAME(_typeName));
	};
	assert(_x call _typeCheckFn);
	
} forEach _wrappedVar;
