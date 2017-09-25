_zone = [call ZonesManager_GetInstance, _this select 3] call ZonesManager_fnc_GetZone;
diag_log ("Opening zone arsenal with " + (str _zone));

    if(([_zone] call Zone_get_Owner) == playerSide)then{
        call smm_fnc_updateGear;
        ["Preload"] call BIS_fnc_arsenal; 
        [] spawn BIS_fnc_arsenal;
    }else{
        hint (str_no_permission);
    };
    