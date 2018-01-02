
#include "defines.hpp"

private _fncName = "calcLoadoutCost"; LOGFNCCALL

private _unsortedInv = _this select 0;
private _cost = 0;
{
	_cost = _cost + ([_x] call smm_fnc_virtualshop_getItemPrice);
} forEach _unsortedInv;
_cost
