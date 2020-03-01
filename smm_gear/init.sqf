
allItemsClassNameToIndexLookup = [(count allItems) * 3 / 2] call smm_fnc_hashmapCreate;
{
    [allItemsClassNameToIndexLookup,[_x] call PurchasableItem_get_ClassName,_forEachIndex] call smm_fnc_hashmapPut;
}forEach allItems;

[] spawn{
    {
        private _zoneState = _x;
        private _ips = [_x] call ZoneState_get_InteractionPoints;
        {
             _x addAction [str_open_virtual_arsenal,smm_fnc_openArsenal,[_zoneState] call ZoneState_get_ZoneID];
            
        } forEach _ips;
       
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};

