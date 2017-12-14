
smm_save_next = diag_frameNo + smm_save_interval;
smm_save_with_check={
    if(smm_save_next > diag_frameNo)then{
        [] spawn smm_save_do_server;
        smm_save_next = diag_frameNo + smm_save_interval;
    }
};



[] spawn{
    {
        private _ip = [_x] call ZoneState_get_InteractionPoint;
        _ip addAction [str_save,smm_save_do_client];
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};

