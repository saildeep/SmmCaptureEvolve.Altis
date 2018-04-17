[] spawn{
    {
        private _ip = [_x] call ZoneState_get_InteractionPoint;
        _ip addAction [str_shop,smm_shop_open,[_x] call ZoneState_get_ZoneID];
        _ip addAction [str_ammo_type,smm_fnc_printVehicleAmmoTypes,[_x] call ZoneState_get_ZoneID,4,true,false,"","(vehicle player) != player"];
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};
