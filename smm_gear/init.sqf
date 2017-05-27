
if(isServer && smm_load)then{
    smm_money_all_uid = (sav_uid call smm_fnc_get);
    {
        _gear = (_x call smm_fnc_getGearString) call smm_fnc_get;
        [_gear,_x] call smm_fnc_setGearServer;
    }forEach smm_money_all_uid;
};
[] spawn{
    waitUntil{! (isNil "interaction_points")};
    {
        _x addAction [str_open_virtual_arsenal,smm_fnc_openArsenal,_forEachIndex];
    //  _x addAction [str_research,smm_gear_research_client,_forEachIndex];
    }forEach interaction_points;
};

