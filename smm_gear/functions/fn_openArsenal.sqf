
#define DISPLAY (uinamespace getVariable "RscDisplayArsenal")
#define CTRL (_this select 0)
#define IDC_LB_LEFT [960,961,962,963,964,965,966,967,968,969,970,971,972,973,974]
#define IDC_LB_ITEM [978,979,980,985]
#define IDC_LB_MAG [981,982,983,984,986]
#define IDC_LB_ALL (IDC_LB_LEFT + IDC_LB_ITEM + IDC_LB_MAG)

assert canSuspend;

private _zone = [call ZonesManager_GetInstance, _this select 3] call ZonesManager_fnc_GetZone;
diag_log ("ArsenalShop: opening zone arsenal with " + (str _zone));

if (([_zone] call Zone_get_Owner) == playerSide) then {
	
	// get the inventory of the player when he opened arsenal
	private _invOnOpen = [player, true] call smm_fnc_listInventory;
	player setVariable ["invOnOpen", _invOnOpen];
	private _invOnOpenUnsorted = [player, false] call smm_fnc_listInventory;
	player setVariable ["invOnOpenUnsorted", _invOnOpenUnsorted];

	// calculate the cost of that inventory
	private _invCostOnOpen = [[player, false] call smm_fnc_listInventory, false] call smm_fnc_calcLoadoutCost;
	player setVariable ["invCostOnOpen", _invCostOnOpen];
	diag_log format ["ArsenalShop: inv cost on open is %1", _invCostOnOpen];

	// reset arsenal stuff
	missionNamespace setVariable ["bis_addVirtualWeaponCargo_cargo",[ [], [], [], [] ]];
	private _items = call smm_fnc_purchasableGear;
	{
		private _type = [_x] call PurchasableItem_fnc_ArsenalType;
		private _classname = [_x] call PurchasableItem_get_ClassName; 
		[missionNamespace,_classname,false,false,1,_type]call BIS_fnc_addVirtualItemCargo;
	}forEach _items;
	["Open",false] spawn BIS_fnc_arsenal;
	
	waitUntil {!(displayNull isEqualTo (uinamespace getVariable ["RscDisplayArsenal",displayNull]))};
	DISPLAY displayAddEventHandler["unload", {[] spawn smm_fnc_onCloseArsenal}];
	
	// make sure the cost label always shows the correct loadout cost
	/*
	[_invCostOnOpen] call smm_fnc_updateCostLabel;
	{
		(DISPLAY displayCtrl _x) ctrlAddEventHandler ["lbselchanged", "[] spawn {
			sleep 0.5;
			[[[player, false] call smm_fnc_listInventory, false] call smm_fnc_calcLoadoutCost] call smm_fnc_updateCostLabel;
		}"];
	} forEach IDC_LB_ALL;
	*/
	
	[] spawn {
		while {DISPLAY != displayNull} do {
			[[[player, false] call smm_fnc_listInventory, false] call smm_fnc_calcLoadoutCost] call smm_fnc_updateCostLabel;
			sleep 0.05;
		};
	};
	
	// add pricetags to the left listboxes
	_addPricetagsToListBox = {
		// wait for the lb to get all items from BI Arsenal
		private _last = 0;
		waitUntil{(lbSize CTRL) > 0};
		while {(lbSize CTRL) != _last} do {
			_last = (lbSize CTRL);
			sleep 0.1;
		};
		
		for "_i" from 0 to ((lbSize CTRL) - 1) do {
			// skip "EMPTY" listbox entry
			if (_i != 0) then {
				// retrieve price
				private _price = [CTRL lbData _i] call smm_fnc_getItemCost;
				
				// add pricetag
				/*
				if (ctrlType CTRL == 102) then {
					CTRL lnbSetText [[_i, 2], (format ["    %1 $ | %2", _price, CTRL lnbText [_i, 2]])];
				};
				*/
				
				if (ctrlType CTRL == 5) then {
					if (_price == -1) then {
						CTRL lbSetTextRight [_i, "unavailable"]; //TODO move to config
					} else {
						CTRL lbSetTextRight [_i, (format ["    %1 $", _price])];
					};
					
					if (CTRL lbPictureRight _i == "") then {
						CTRL lbsetPictureRight [_i , "A3\ui_f\data\map\markers\system\empty_ca.paa"];
					};
				};
			};
		};
	};
	
	{
		[(DISPLAY displayCtrl _x)] spawn _addPricetagsToListBox;
	} forEach IDC_LB_LEFT;
	
	/*
	_updateRightLB = {
		sleep 0.2;
		{
			[((uinamespace getVariable "RscDisplayArsenal") displayCtrl _x)] spawn _addPricetagsToListBox;
		} forEach (IDC_LB_ITEM + IDC_LB_MAG);
	};
	DISPLAY displayAddEventHandler ["keydown", "[] spawn _updateRightLB"];
	DISPLAY displayAddEventHandler ["mousebuttondown", "[] spawn _updateRightLB"];
	*/
	
} else {
	hint (str_no_permission);
};
    