[] spawn{
    {
        private _ip = [_x] call ZoneState_get_InteractionPoint;
        _ip addAction [str_shop,smm_shop_open,[_x] call ZoneState_get_ZoneID];
        _ip addAction [str_ammo_type,smm_fnc_printVehicleAmmoTypes,[_x] call ZoneState_get_ZoneID,4,true,false,"","(vehicle player) != player"];
        if(smm_ace)then{
            _ip addAction [str_ammo_box_shop,'createDialog "RscDisplayAmmobox"',[_x] call ZoneState_get_ZoneID,3,false,false,"","[player,'VEHICLE_AMMO'] call smm_fnc_hasPerk"];
        };
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};
