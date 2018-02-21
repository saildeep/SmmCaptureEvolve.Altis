

[] spawn{
    {
        private _ip = [_x] call ZoneState_get_InteractionPoint;
        _ip addAction [str_save,smm_save_do_client];
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};
[] spawn {
    if(isServer)then{
        while (true) do {
            sleep smm_save_interval;
            [] spawn smm_save_do_server;
        };
    };
};