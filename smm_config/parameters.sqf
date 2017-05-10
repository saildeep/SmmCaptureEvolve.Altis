
autodetectHeadless  = (2 == ("headlessClient" call BIS_fnc_getParamValue));
useHeadless         = (1 == ("headlessClient" call BIS_fnc_getParamValue)); //false if autodetect
smm_skill           = ("aiDifficulty" call BIS_fnc_getParamValue)/10;
smm_ace_medic       = (("aceMedic" call BIS_fnc_getParamValue) == 1);
smm_time_multiplier = ("timeMultiplier" call BIS_fnc_getParamValue);
smm_start_time      = ("startTime" call BIS_fnc_getParamValue);
smm_respawn_on_vehicle = (("respawnVehicles" call BIS_fnc_getParamValue) == 1);

//Map settings

_smm_load                                = "load" call BIS_fnc_getParamValue;
smm_debug                                = ("debug" call BIS_fnc_getParamValue)==1;
smm_load                                 = (_smm_load == 1 && (call smm_savegame_exists));
smm_spawner_max_zone_size                = "maxZoneSize" call BIS_fnc_getParamValue;
smm_spawner_min_zone_size                = "minZoneSize" call BIS_fnc_getParamValue;
smm_spawner_neighbour_range              = "maxZoneDistance" call BIS_fnc_getParamValue;
smm_spawner_connection_cleaner_use_angle = ("maxZoneAngle" call BIS_fnc_getParamValue)>0;
smm_spawner_connection_cleaner_max_angle = "maxZoneAngle" call BIS_fnc_getParamValue;
smm_spawner_use_roads                    = (0<("zoneGenerator" call BIS_fnc_getParamValue) );
smm_spawner_k                            = "zoneGenerator" call BIS_fnc_getParamValue;

smm_start_tickets = [100,100,100,100];

//price for amount tickets
smm_ticket_amount = 10;
smm_ticket_price = 300;