_zone = [call ZonesManager_GetInstance, _this select 3] call ZonesManager_fnc_GetZone;
diag_log ("Opening zone arsenal with " + (str _zone));
disableSerialization;

if(([_zone] call Zone_get_Owner) == playerSide)then{
	
	// get the sorted inventory of the player when he opened arsenal
	_invOnOpen = [player, true] call smm_fnc_listInventory;
	player setVariable ["invOnOpen", _invOnOpen];

	// calculate the cost of that inventory
	_invCostOnOpen = [[player, false] call smm_fnc_listInventory] call smm_fnc_calcLoadoutCost;
	player setVariable ["invCostOnOpen", _invCostOnOpen];
	diag_log format ["ArsenalShop: inv cost on open is %1", _invCostOnOpen];

	/*
	//reset arsenal stuff
	missionNamespace setVariable ["bis_addVirtualWeaponCargo_cargo",[ [], [], [], [] ]];
	private _items = call smm_fnc_purchasableGear;
	{
		private _type = [_x] call PurchasableItem_fnc_ArsenalType;
		private _classname = [_x] call PurchasableItem_get_ClassName; 
		[missionNamespace,_classname,false,false,1,_type]call BIS_fnc_addVirtualItemCargo;
	}forEach _items;
	*/
	["Open", true] spawn BIS_fnc_arsenal;

	waitUntil {!isNil {uinamespace getVariable "RscDisplayArsenal"}};
	_display = uinamespace getVariable "RscDisplayArsenal";
	_display displayAddEventHandler["unload", {[] spawn smm_fnc_onCloseArsenal}];

	_addPricetagsToListBox = {
		disableSerialization;
		_ctrl = _this select 0;
		waitUntil{(lbSize _ctrl) > 0};
		
		for "_i" from 0 to ((lbSize _ctrl) - 1) do {
			// skip "EMPTY" listbox entry
			if (_i != 0) then {
				// retrieve price
				_price = floor random [0,500,100000];
				
				// add pricetag
				_ctrl lbSetTextRight [_i, "        " + str(_price) + " $"];
				if (_ctrl lbPictureRight _i == "") then {
					_ctrl lbsetPictureRight [_i , "A3\ui_f\data\map\markers\system\empty_ca.paa"];
				};
			};
		};
	};

	[_invCostOnOpen] call smm_fnc_updateCostLabel;

	//lb idc 960 to 974  left side without face, voice, etc
	for "_i" from 960 to 974 do {
		_x = _display displayCtrl _i;
		[_x] spawn _addPricetagsToListBox;
	};

	//lb idc 960 to 986  all listboxes 
	for "_i" from 960 to 986 do {
		_x = _display displayCtrl _i;
		// set cost label text to the cost of the current inv
		_x ctrlAddEventHandler ["lbselchanged", "[] spawn {
			sleep 0.2; 
			[[[player, false] call smm_fnc_listInventory] call smm_fnc_calcLoadoutCost] call smm_fnc_updateCostLabel;
		}"];
	};
	
}else{
	hint (str_no_permission);
};
    