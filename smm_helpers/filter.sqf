_array = _this select 0;
assert (typeName _array == "ARRAY");
_function = _this select 1;
assert (typeName _function == "CODE");
_output = [];
{
	_element = _x;
	if(_x call _function)then{
		_output pushBack _element;
	};
}forEach _array;
_output