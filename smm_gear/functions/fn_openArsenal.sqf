_zone = [call ZonesManager_GetInstance, _this select 3] call ZonesManager_fnc_GetZone;
diag_log ("Opening zone arsenal with " + (str _zone));

    if(([_zone] call Zone_get_Owner) == playerSide)then{
        //reset arsenal stuff
        missionNamespace setVariable ["bis_addVirtualWeaponCargo_cargo",[ [], [], [], [] ]];
        private _items = call smm_fnc_purchasableGear;
        {
            private _type = [_x] call PurchasableItem_fnc_ArsenalType;
            private _classname = [_x] call PurchasableItem_get_ClassName; 
            [missionNamespace,_classname,false,false,1,_type]call BIS_fnc_addVirtualItemCargo;
        }forEach _items;
        [] spawn BIS_fnc_arsenal;
    }else{
        hint (str_no_permission);
    };
    