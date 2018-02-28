private _em = call EventManager_GetInstance;
[_em,"OnZoneActivated",smm_fnc_visualizeZoneActivated] call EventManager_fnc_AddListener;
[_em,"OnZoneDeactivated",smm_fnc_visualizeZoneDeactivated] call EventManager_fnc_AddListener;

[] spawn{
    {
        private _ip = [_x] call ZoneState_get_InteractionPoint;
        _ip addAction [str_vote_target_action,smm_fnc_voteOpenDialog,[_x] call ZoneState_get_ZoneID];
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};