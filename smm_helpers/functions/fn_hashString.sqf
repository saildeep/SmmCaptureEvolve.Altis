params["_string"];
private _array = toArray _string;
private _out = 23;
{
	_out = ( (_x * _forEachIndex) + _out ) mod 65537;
}forEach _array;
_out
