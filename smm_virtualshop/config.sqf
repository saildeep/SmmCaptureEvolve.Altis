
smm_fnc_virtualshop_debug = true;
smm_fnc_virtualshop_pricetag = " %1 $";
smm_fnc_virtualshop_creditDisplay = "BUY     %2 $   |   %1 $ ";
smm_fnc_virtualshop_msgInvalidItems = "Your loadout contains items that cannot be purchased here: %1";
smm_fnc_virtualshop_msgNotEnoughCredits = "You do not have enough credits to purchase this loadout";

smm_fnc_virtualshop_getItemPrice = {
	with missionnamespace do {
		//_item is either string with the cfgname or (in case _item is a magazine) array with [cfgname, bulletCount]
		params [["_item","",[[],""]]];
		private _price = 0;
		if (_item isEqualType "") then {
			if !(_item isEqualTo "") then {
				private _matches = [allItemsClassNameToIndexLookup,_item] call smm_fnc_hashmapGet;
				{
					private _item = allItems select _x;
					_price = [_item] call PurchasableItem_get_Price;
				} forEach _matches;
				
				if (isNil "_price") then {
					_price = 0;
					diag_log format ["Error: could not retrieve price for %1", _item];
				};
				
				// dealing with unpurchasable items (items the player might have picked up on the battlefield)
				// the player can sell those items for the tenth of their price
				if !(_item in ([] call (uinamespace getVariable "smm_fnc_virtualshop_getPurchasableItems"))) then {
					_price = floor (_price / 10);
				};
			};
		} else {
			private _itemName = _item select 0;
			private _count = _item select 1;
			private _fullCount = getNumber (configfile >> "CfgMagazines" >> _itemName >> "count");
			if !(_fullCount == 0 && _count == 0) then {
				private _matches = [allItemsClassNameToIndexLookup,_itemName] call smm_fnc_hashmapGet;
				{
					private _item = allItems select _x;
					_price = [_item] call PurchasableItem_get_Price;
				} forEach _matches;
				
				if (isNil "_price") then {
					_price = 0;
					diag_log format ["Error: could not retrieve price for %1", _itemName];
				};
				
				_price = ceil (_price * (_count / _fullCount));
			};
			
			if !(_itemName in ([] call (uinamespace getVariable "smm_fnc_virtualshop_getPurchasableItems"))) then {
				_price = floor (_price / 10);
			};
		};
		_price
	};
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
