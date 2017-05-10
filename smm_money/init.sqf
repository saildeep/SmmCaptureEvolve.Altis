
if(hasInterface)then{
    (getPlayerUID player) remoteExec ["smm_register_uid",2,false];
};
if(isServer && smm_load)then{
        smm_money_all_uid = (sav_uid call smm_get);
        {
            _money = (sav_money + _x) call smm_get;
            [_money,_x] call smm_set_balance_server;
        }forEach smm_money_all_uid;
};
[] spawn{
    waitUntil{! (isNil "interaction_points")};
    {
        _x addAction [str_balance,smm_show_balance,_this];
    }forEach interaction_points;

    sleep 20;
	//removed due to testing with the revive system
    while{false}do
    {
        {
        _user = _x;
            if(!(local _user) && alive _user)then{
               removeAllActions _user;
                _t = _user addAction [str_transfer_100,smm_money_transfer_100];
                
            
            };
        }forEach (allPlayers - entities "HeadlessClient_F");
        removeAllActions player;
        player addAction [str_balance,smm_show_balance,nil,0];
        sleep 30;
    };
};