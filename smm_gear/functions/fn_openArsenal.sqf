
#define DISPLAY (uinamespace getVariable "RscDisplayArsenal")
#define CTRL (_this select 0)


assert canSuspend;

private _zone = [call ZonesManager_GetInstance, _this select 3] call ZonesManager_fnc_GetZone;
diag_log ("ArsenalShop: opening zone arsenal with " + (str _zone));

if(([_zone] call Zone_get_Owner) == playerSide)then{
	
	// get the sorted inventory of the player when he opened arsenal
	private _invOnOpen = [player, true] call smm_fnc_listInventory;
	player setVariable ["invOnOpen", _invOnOpen];

	// calculate the cost of that inventory
	private _invCostOnOpen = [[player, false] call smm_fnc_listInventory] call smm_fnc_calcLoadoutCost;
	player setVariable ["invCostOnOpen", _invCostOnOpen];
	diag_log format ["ArsenalShop: inv cost on open is %1", _invCostOnOpen];

	//reset arsenal stuff
	missionNamespace setVariable ["bis_addVirtualWeaponCargo_cargo",[ [], [], [], [] ]];
	private _items = call smm_fnc_purchasableGear;
	{
		private _type = [_x] call PurchasableItem_fnc_ArsenalType;
		private _classname = [_x] call PurchasableItem_get_ClassName; 
		[missionNamespace,_classname,false,false,1,_type]call BIS_fnc_addVirtualItemCargo;
	}forEach _items;
	[] spawn BIS_fnc_arsenal;
	
	waitUntil {!(displayNull isEqualTo (uinamespace getVariable ["RscDisplayArsenal",displayNull]))};
	DISPLAY displayAddEventHandler["unload", {[] spawn smm_fnc_onCloseArsenal}];

	_addPricetagsToListBox = {
		waitUntil{(lbSize CTRL) > 0};
		for "_i" from 0 to ((lbSize CTRL) - 1) do {
			// skip "EMPTY" listbox entry
			if (_i != 0) then {
				// retrieve price
				private _price = [CTRL lbData _i] call smm_fnc_getItemCost;
				
				// add pricetag
				CTRL lbSetTextRight [_i, format ["    %1 $", _price]];
				if (CTRL lbPictureRight _i == "") then {
					CTRL lbsetPictureRight [_i , "A3\ui_f\data\map\markers\system\empty_ca.paa"];
				};
			};
		};
	};

	[_invCostOnOpen] call smm_fnc_updateCostLabel;

	//lb idc 960 to 974  left side without face, voice, etc
	for "_i" from 960 to 974 do {
		[(DISPLAY displayCtrl _i)] spawn _addPricetagsToListBox;
	};

	//lb idc 960 to 986  all listboxes 
	for "_i" from 960 to 986 do {
		// set cost label text to the cost of the current inv
		// sleep is necessary because execution order of the EventHandler is wrong
		(DISPLAY displayCtrl _i) ctrlAddEventHandler ["lbselchanged", "[] spawn {
			sleep 0.2; 
			[[[player, false] call smm_fnc_listInventory] call smm_fnc_calcLoadoutCost] call smm_fnc_updateCostLabel;
		}"];
	};
	
}else{
	hint (str_no_permission);
};
    