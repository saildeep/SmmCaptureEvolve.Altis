//divides an array of type [a,b,c,d,e,f] in groups like [[a,b],[c,d],..]
params["_array",["_count",1]];
assert(_count > 0);
private _out = [];
private _c = [];
{
	if((count _c)  <  (_count) )then{
		_c pushBack _x;
	}else{
		_out pushBack _c;
		_c = [_x];
		
	};
	
} forEach _array;
if((count _c) > 0)then{
	_out pushBack _c;
};
_out