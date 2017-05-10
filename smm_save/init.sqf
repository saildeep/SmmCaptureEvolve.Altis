
smm_save_next = diag_frameNo + smm_save_interval;
smm_save_with_check={
    if(smm_save_next > diag_frameNo)then{
        [] spawn smm_save_do_server;
        smm_save_next = diag_frameNo + smm_save_interval;
    }
};

if(isServer)then{
    addMissionEventHandler ["onEachFrame",smm_save_with_check];
    
};
[] spawn {
    waitUntil{!isNil "interaction_points"};
    {
        _x addAction [str_save,smm_save_do_client];
    }forEach interaction_points;
};
