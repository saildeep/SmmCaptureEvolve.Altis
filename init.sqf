//compile functions
isOfficer = compileFinal preprocessFileLineNumbers "smm_helpers\is_officer.sqf";
getColor = compileFinal preprocessFileLineNumbers "smm_helpers\get_color.sqf";
getPosNear = compileFinal preprocessFileLineNumbers "smm_helpers\get_pos_near.sqf";
getMean = compileFinal preprocessFileLineNumbers "smm_helpers\get_mean.sqf";
smm_notify = compileFinal preprocessFileLineNumbers "smm_helpers\notify.sqf";
smm_action = compileFinal preprocessFileLineNumbers "smm_helpers\add_action.sqf";
filter = compileFinal preprocessFileLineNumbers "smm_helpers\filter.sqf";

stringConfig = compileFinal preprocessFileLineNumbers "smm_config\strings.sqf";
unitConfig = compileFinal preprocessFileLineNumbers "smm_config\units.sqf";
itemConfig = compileFinal preprocessFileLineNumbers "smm_config\items.sqf";
constantConfig = compileFinal preprocessFileLineNumbers "smm_config\constants.sqf";
loadConfig = compileFinal preprocessFileLineNumbers "smm_config\load.sqf";
parameterConfig = compileFinal preprocessFileLineNumbers "smm_config\parameters.sqf";
macrosFunctions = compileFinal preprocessFileLineNumbers "smm_macros\compile.sqf";
gcFunctions = compileFinal preprocessFileLineNumbers "smm_garbage_collector\compile.sqf";

//compile OO files
call smm_fnc_parseTypes;

//exec config files
call compile preprocessFileLineNumbers "smm_config\mod_detector.sqf";
call compile preprocessFileLineNumbers "smm_thermal_blocker\compile.sqf";
call macrosFunctions;
call constantConfig;
call stringConfig;

call compile preprocessFileLineNumbers "smm_spawner\compile.sqf";
call compile preprocessFileLineNumbers "smm_save\compile.sqf";
call compile preprocessFileLineNumbers "smm_money\compile.sqf";
call compile preprocessFileLineNumbers "smm_medic\compile.sqf";
call compile preprocessFileLineNumbers "smm_shop\compile.sqf";

call parameterConfig;
call loadConfig;

call unitConfig;
call itemConfig;

call gcFunctions;

if(smm_debug)then{
	call smm_fnc_injectAll;
};


//init 
diag_log "----- Initializing gear";
[] call compile preprocessFileLineNumbers "smm_gear\init.sqf";

diag_log "----- Initializing save";
[] call compile preprocessFileLineNumbers "smm_save\init.sqf";

diag_log "----- Initializing shop";
[] call compile preprocessFileLineNumbers "smm_shop\init.sqf";
diag_log "----- Initializing money";
[] call compile preprocessFileLineNumbers "smm_money\init.sqf";
diag_log "----- Initializing Spawner";
[] call compile preprocessFileLineNumbers "smm_spawner\init.sqf";
diag_log "----- Initializing Medic";
[] call compile preprocessFileLineNumbers "smm_medic\init.sqf";
[] execVM "onPlayerRespawn.sqf";
diag_log "----- Initializing Garbage Collector";
[] call compile preprocessFileLineNumbers "smm_garbage_collector\init.sqf";
diag_log "----- Initializing Time";
[] call compile preprocessFileLineNumbers "smm_time\init.sqf";
diag_log "----- Initializing Thermal Blocker";
[] call compile preprocessFileLineNumbers "smm_thermal_blocker\init.sqf";
diag_log "----- Initializing Visualizer";
[] call compile preprocessFileLineNumbers "smm_visualizer\init.sqf";
diag_log "----- Initializing AI";
[] call compile preprocessFileLineNumbers "smm_ai\init.sqf";

[] execVM "smm_tickets\init.sqf";
[] execVM "smm_curator\init.sqf";
