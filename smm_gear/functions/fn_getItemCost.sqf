
private _name = _this select 0;

private _cost = -1;
private _matches = [allItemsClassNameToIndexLookup,_name] call smm_fnc_hashmapGet;
{
	private _item = allItems select _x;
	_cost = [_item] call PurchasableItem_get_Price;

} forEach _matches;

_cost
