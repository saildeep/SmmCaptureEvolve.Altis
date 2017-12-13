
private _name = _this select 0;

private _cost = 0;
{
	if (([_x] call PurchasableItem_get_ClassName) == _name) then {
		_cost = ([_x] call PurchasableItem_get_Price);
	};
} forEach allItems;

_cost
