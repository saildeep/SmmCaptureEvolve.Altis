_zone = _this select 3;
diag_log ("Opening zone arsenal with " + (str _zone));
if(_zone < 0)then{
    call smm_fnc_updateGear;
    ["Preload"] call BIS_fnc_arsenal; 
    [] spawn BIS_fnc_arsenal;
}else{
    if(((_zone call getZone)select 3) == (playerSide))then{
        call smm_fnc_updateGear;
        ["Preload"] call BIS_fnc_arsenal; 
        [] spawn BIS_fnc_arsenal;
    }else{
        hint (str_no_permission);
    };
    
};