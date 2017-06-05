private _num = _this select 0;
assert (typeName _num == "SCALAR");
private _array = _this select 1;
assert (typeName _array == "ARRAY");
private _randItem = selectRandom _array;
private _out = [_randItem];
assert (typeName _out == "ARRAY");
if(_num > 1)then{
_newarray = _array - _out;
assert (typeName _newarray == "ARRAY");
_newnum = _num -1;
_newout = _out + ([_newnum,_newarray] call smm_fnc_getMultipleRandom);
_out= + _newout;
};
assert (typeName _out == "ARRAY");
_out