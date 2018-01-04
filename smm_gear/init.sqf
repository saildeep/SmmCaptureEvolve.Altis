
allItemsClassNameToIndexLookup = [(count allItems) * 3 / 2] call smm_fnc_hashmapCreate;
{
    [allItemsClassNameToIndexLookup,[_x] call PurchasableItem_get_ClassName,_forEachIndex] call smm_fnc_hashmapPut;
}forEach allItems;

[] spawn{
    {
        private _ip = [_x] call ZoneState_get_InteractionPoint;
        _ip addAction [str_open_virtual_arsenal,smm_fnc_openArsenal,[_x] call ZoneState_get_ZoneID];
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};

