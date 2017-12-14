
private _inv = _this select 0;
private _validate = _this select 1;

private _cost = 0;
private _invalidItems = [];
{
	if (!(_x isEqualTo "")) then {
		private _itemCost = [_x] call smm_fnc_getItemCost;
		if (_itemCost == -1 && !(_x in (player getVariable "invOnOpen"))) then {
			_invalidItems append [_x];
		} else {
			_cost = _cost + _itemCost;
		};
	};
} forEach _inv;

if (_validate && count _invalidItems > 0) then {
	_invalidItems
} else {
	_cost
};
