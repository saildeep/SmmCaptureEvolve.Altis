params["_object"];
private _classname = [_object] call PurchasableItem_get_ClassName;
private _configfile = [_object] call PurchasableItem_get_ConfigFile;
_out = 0;
if(_configfile == "CfgMagazines")then{
	_out = 2;
};
if(_configfile == "CfgWeapons")then{
	private _itemtype = _classname call BIS_fnc_itemType;
	private _itemcategory = _itemtype select 0;
	if(_itemcategory in ["Weapon"])then{
		_out = 1;
	};
};
if(_configfile == "CfgVehicles")then{
	_out = 3;
};


_out