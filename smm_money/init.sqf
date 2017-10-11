
if(hasInterface)then{
    (getPlayerUID player) remoteExec ["smm_fnc_registerUid",2,false];
};
if(isServer && smm_load)then{
        smm_money_all_uid = (sav_uid call smm_fnc_get);
        {
            _money = (sav_money + _x) call smm_fnc_get;
            [_money,_x] call smm_fnc_setBalanceServer;
        }forEach smm_money_all_uid;
};




[] spawn{
    
    {
        private _interaction_point = [_x] call ZoneState_get_InteractionPoint;
        _interaction_point addAction [str_balance,smm_fnc_showBalance,_this];
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);

};