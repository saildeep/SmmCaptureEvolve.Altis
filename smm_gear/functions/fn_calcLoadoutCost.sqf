
_inv = _this select 0;

_cost = 0;
{
	if (!(_x isEqualTo "")) then {
		_cost = _cost + 1; //TODO get item cost
	}
} forEach _inv;

_cost
