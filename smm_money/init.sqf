#define ACTION_ID_NAME "transfer_money_action"
#define TRANSFER_AMOUNT_KEY "transfer_money_amount"
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

//TODO make faster using event handlers
[] spawn{
     sleep 10;
    while{true}do{
        {
            sleep 1;
            if(!(isNull _x))then{
                private _actionid = _x getVariable[ACTION_ID_NAME,-1];
                if(_actionid == -1)then{
                    _actionid = [_x,
                    str_transfer,
                    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
                    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
                    "_this distance _target < 3",                                                // Condition for the action to be shown
                    "_caller distance _target < 3",
                    {missionNamespace setVariable [TRANSFER_AMOUNT_KEY,0]},
                    {
                        missionNamespace setVariable [TRANSFER_AMOUNT_KEY,missionNamespace getVariable [TRANSFER_AMOUNT_KEY,0] + (call smm_fnc_getBalance) * (1/48)];
                        hint format[str_transfer_amount,round (missionNamespace getVariable [TRANSFER_AMOUNT_KEY])]
                    },
                    {missionNamespace setVariable [TRANSFER_AMOUNT_KEY,0]},
                    {
                        params["_target", "_caller", "_ID", "_arguments"];
                        [missionNamespace getVariable [TRANSFER_AMOUNT_KEY,0],_target] call smm_fnc_moneyTransfer
                    },
                    [],
                    12,
                    0,
                    false,false
                    ] call BIS_fnc_holdActionAdd;
                    _x setVariable [ACTION_ID_NAME,_actionid,false];
                };
            };

        }forEach allPlayers;
    };
};