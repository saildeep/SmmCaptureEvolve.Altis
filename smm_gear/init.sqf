
if(isServer && smm_load)then{
    smm_money_all_uid = (sav_uid call smm_fnc_get);
    {
        _gear = (_x call smm_fnc_getGearString) call smm_fnc_get;
        [_gear,_x] call smm_fnc_setGearServer;
    }forEach smm_money_all_uid;
};
[] spawn{
    {
        private _ip = [_x] call ZoneState_get_InteractionPoint;
        _ip addAction [str_open_virtual_arsenal,smm_fnc_openArsenal,[_x] call ZoneState_get_ZoneID];
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};

