
assert canSuspend;

private _zone = [call ZonesManager_GetInstance, _this select 3] call ZonesManager_fnc_GetZone;
diag_log ("ArsenalShop: opening zone arsenal with " + (str _zone));

if (([_zone] call Zone_get_Owner) == playerSide) then {
	
	
	// reset arsenal stuff
	//missionNamespace setVariable ["bis_addVirtualWeaponCargo_cargo",[ [], [], [], [] ]];
	private _items = call smm_fnc_purchasableGear;
	private _virtualCargo = [ [], [], [], [] ];
	{
		private _type = [_x] call PurchasableItem_fnc_ArsenalType;
		private _classname = [_x] call PurchasableItem_get_ClassName; 
		//[missionNamespace,_classname,false,false,1,_type]call BIS_fnc_addVirtualItemCargo;
		(_virtualCargo select _type) set [count (_virtualCargo select _type), _classname];
		
	}forEach _items;
	missionNamespace setVariable ["bis_addVirtualWeaponCargo_cargo",_virtualCargo];
	["Open", false] spawn smm_fnc_virtualshop;
	
	
} else {
	hint (str_no_permission);
};
    