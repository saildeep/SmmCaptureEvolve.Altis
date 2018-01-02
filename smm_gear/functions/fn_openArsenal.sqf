
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
	
	
	// reset arsenal stuff
	missionNamespace setVariable ["bis_addVirtualWeaponCargo_cargo",[ [], [], [], [] ]];
	private _items = call smm_fnc_purchasableGear;
	{
		private _type = [_x] call PurchasableItem_fnc_ArsenalType;
		private _classname = [_x] call PurchasableItem_get_ClassName; 
		[missionNamespace,_classname,false,false,1,_type]call BIS_fnc_addVirtualItemCargo;
	}forEach _items;
	["Open", false] spawn smm_fnc_virtualshop;
	
	
} else {
	hint (str_no_permission);
};
    