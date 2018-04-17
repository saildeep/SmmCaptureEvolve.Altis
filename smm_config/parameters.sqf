
autodetectHeadless  = (2 == ("headlessClient" call BIS_fnc_getParamValue));
useHeadless         = (1 == ("headlessClient" call BIS_fnc_getParamValue)); //false if autodetect

smm_ace_medic       = (("aceMedic" call BIS_fnc_getParamValue) == 1);
smm_time_multiplier = ("timeMultiplier" call BIS_fnc_getParamValue);
smm_start_time      = ("startTime" call BIS_fnc_getParamValue);
smm_respawn_on_vehicle = (("respawnVehicles" call BIS_fnc_getParamValue) == 1);
smm_allow_thermal = ("allowThermal" call BIS_fnc_getParamValue) == 1;
//Map settings

_smm_load                                = "load" call BIS_fnc_getParamValue;
smm_debug                                = ("debug" call BIS_fnc_getParamValue)>0;
smm_debug_ai							 = ("debug" call BIS_fnc_getParamValue)>1;
smm_load                                 = (_smm_load == 1 && (call smm_fnc_savegameExists));
smm_spawner_max_zone_size                = "maxZoneSize" call BIS_fnc_getParamValue;
smm_spawner_min_zone_size                = "minZoneSize" call BIS_fnc_getParamValue;
smm_spawner_neighbour_range              = "maxZoneDistance" call BIS_fnc_getParamValue;
smm_spawner_connection_cleaner_use_angle = ("maxZoneAngle" call BIS_fnc_getParamValue)>0;
smm_spawner_connection_cleaner_max_angle = "maxZoneAngle" call BIS_fnc_getParamValue;
smm_spawner_use_roads                    = (1<("zoneGenerator" call BIS_fnc_getParamValue));
smm_spawner_use_cities                   = (0 == ("zoneGenerator" call BIS_fnc_getParamValue));
smm_spawner_use_advanced				 = (1 == ("zoneGenerator" call BIS_fnc_getParamValue));
smm_spawner_k                            = "zoneGenerator" call BIS_fnc_getParamValue;
smm_spawner_max_targets        			 = ["targetsBLUFOR" call BIS_fnc_getParamValue,"targetsOPFOR" call  BIS_fnc_getParamValue,"targetsINDEPENDENT" call BIS_fnc_getParamValue];
smm_ai_disable_nvg 				 		 = ("aiDisableNVG" call BIS_fnc_getParamValue) == 1;
smm_start_tickets 						 = [100,100,100,100];
smm_spawner_default_owner      			 = [west,east,independent] select ("defaultZoneOwner" call BIS_fnc_getParamValue);



//price for amount tickets
smm_ticket_amount = 10;
smm_ticket_price = 300;

//AI settings
smm_skill           			= ("aiDifficulty" call BIS_fnc_getParamValue)/10;
smm_aiSubSkill_aimingAccuracy 	= if(("aiSubSkillAimingAccuracy" call BIS_fnc_getParamValue)>=2) then {("aiSubSkillAimingAccuracy" call BIS_fnc_getParamValue)/10} else{smm_skill};
smm_aiSubSkill_aimingShake 		= if(("aiSubSkillAimingShake" call BIS_fnc_getParamValue)>=2) then {("aiSubSkillAimingShake" call BIS_fnc_getParamValue)/10} else{smm_skill};
smm_aiSubSkill_aimingSpeed 		= if(("aiSubSkillAimingSpeed" call BIS_fnc_getParamValue)>=2) then {("aiSubSkillAimingSpeed" call BIS_fnc_getParamValue)/10} else{smm_skill};
//endurance // disabled in ARMA 3
smm_aiSubSkill_spotDistance 	= if(("aiSubSkillSpotDistance " call BIS_fnc_getParamValue)>=2) then {("aiSubSkillSpotDistance" call BIS_fnc_getParamValue)/10} else{smm_skill};
smm_aiSubSkill_spotTime 		= if(("aiSubSkillSpotTime" call BIS_fnc_getParamValue)>=2) then {("aiSubSkillSpotTime" call BIS_fnc_getParamValue)/10} else{smm_skill};
//courage //meaningless no fleeing allowed
smm_aiSubSkill_reloadSpeed 		= if(("aiSubSkillReloadSpeed" call BIS_fnc_getParamValue)>=2) then {("aiSubSkillreloadSpeed" call BIS_fnc_getParamValue)/10} else{smm_skill};
smm_aiSubSkill_commanding 		= if(("aiSubSkillCommanding" call BIS_fnc_getParamValue)>=2) then {("aiSubSkillcommanding" call BIS_fnc_getParamValue)/10} else{smm_skill};
smm_aiSubSkill_general 			= if(("aiSubSkillGeneral" call BIS_fnc_getParamValue)>=2) then {("aiSubSkillgeneral" call BIS_fnc_getParamValue)/10} else{smm_skill};