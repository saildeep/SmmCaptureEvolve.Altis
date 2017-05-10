_out = [];
_in1 = _this select 0;
_in2 = _this select 1;
{
	_outV = (_x + (_in2 select _forEachIndex))/2;
	_out append [_outV];
}forEach _in1;
_out