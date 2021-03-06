
smm_fnc_virtualshop_debug = true;
smm_fnc_virtualshop_pricetag = " %1 $";
smm_fnc_virtualshop_creditDisplay = "BUY     %2 $   |   %1 $ ";
smm_fnc_virtualshop_msgInvalidItems = "Your loadout contains items that cannot be purchased here: %1";
smm_fnc_virtualshop_msgNotEnoughCredits = "You do not have enough credits to purchase this loadout";

smm_fnc_virtualshop_getItemPrice = {
	//_item is either string with the cfgname or (in case _item is a magazine) array with [cfgname, bulletCount]
	params [["_item","",[[],""]]];
	
	private _itemName = "";
	private _bulletCount = 0;
	private _fullCount = 0;
	private _isMag = false;
	private _price = 0;
	
	if (_item isEqualType "") then {
		_itemName = _item;
	} else {
		if (_item isEqualType []) then {
			_itemName = _item select 0;
			_bulletCount = _item select 1;
			_fullCount = getNumber (configfile >> "CfgMagazines" >> _itemName >> "count");
			_isMag = true;
		};
	};
	
	if !(_itemName isEqualTo "") then {
		private _matches = with missionnamespace do {[allItemsClassNameToIndexLookup,_itemName] call smm_fnc_hashmapGet};
		{
			private _purchasableItem = (missionnamespace getVariable ["allItems", []]) select _x;
			_price = with missionnamespace do {[_purchasableItem] call PurchasableItem_get_Price};
		} forEach _matches;
	};
	
	if (isNil "_price") then {
		_price = 0;
		diag_log format ["Error: could not retrieve price for %1. Current namespace is %2 ", _itemName, currentNamespace];
	};
	
	if (_isMag && _fullCount > 0) then {
		if (_bulletCount > 0) then {
			_price = ceil (_price * (_bulletCount / _fullCount));
		} else {
			_price = 0;
		};
	};
	
	if !(_itemName in ([] call (uinamespace getVariable "smm_fnc_virtualshop_getPurchasableItems"))) then {
		_price = floor (_price / 10);
	};
	
	_price
};

smm_fnc_virtualshop_getCredit = {
	with missionnamespace do {
		[] call smm_fnc_getBalance
	};
};

smm_fnc_virtualshop_subtractCredit = {
	with missionnamespace do {
		_this call smm_fnc_buy
	};
};

smm_fnc_virtualshop_getPurchasableItems = {
	private _virtualCargo = missionnamespace getVariable ["bis_addVirtualWeaponCargo_cargo",[ [], [], [], [] ]];
	((_virtualCargo select 0) + (_virtualCargo select 1) + (_virtualCargo select 2) + (_virtualCargo select 3))
};
