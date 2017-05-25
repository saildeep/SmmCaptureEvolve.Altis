private _uid = getPlayerUID player;
private _varname = "smm_money_" + _uid;
//diag_log ("Getting money for varname  "+ _varname);
missionNamespace getVariable [_varname,smm_money_start]