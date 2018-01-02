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
    while{hasInterface}do{
        sleep 5;
        {
            sleep 3;
            if(!(isNull _x))then{
                if(_x != player)then{
                    private _actionid = _x getVariable[ACTION_ID_NAME,-1];
                    if(_actionid > -1)then{
                        if(! (_actionid in (actionIDs _x)))then{

                            _actionid = _x addAction [str_transfer_fixed_amount,{[1000,(_this select 0)] call smm_fnc_moneyTransfer;},nil,5,false];
                            _x setVariable [ACTION_ID_NAME,_actionid,false];
                        };
                      
                        
                    }else{
                        _actionid = _x addAction [str_transfer_fixed_amount,{[1000,(_this select 0)] call smm_fnc_moneyTransfer;},nil,5,false];
                        _x setVariable [ACTION_ID_NAME,_actionid,false];
                    };
                };
            };

        }forEach allPlayers;
    };
};