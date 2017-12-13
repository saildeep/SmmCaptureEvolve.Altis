
private _inv = _this select 0;

private _cost = 0;
{
	if (!(_x isEqualTo "")) then {
		_cost = _cost + ([_x] call smm_fnc_getItemCost);
	}
} forEach _inv;

_cost
