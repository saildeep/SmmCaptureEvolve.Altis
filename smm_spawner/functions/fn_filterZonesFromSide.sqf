private _side = _this select 0;
private _zones = _this select 1;
assert (typeName _side == "SIDE");
private _out = [];
{
    if((_x call smm_fnc_getSide) == _side)then{
        _out pushBack _x;
    };
}forEach _zones;
_out