smm_save_do_client = compileFinal preprocessFile "smm_save\do.sqf";
smm_save_do_server = compileFinal preprocessFile "smm_save\do_server.sqf";
smm_set = {
 private["_key","_value"];
 _key = worldName +sav_server_id + (_this select 0);
 _value = _this select 1;
 diag_log ("Setting Key-Value Pair:");
 diag_log ("Key:" + _key);
 diag_log ("Value:" + (str _value));
 profileNameSpace setVariable [ _key,_value];
};
smm_get = {
 private["_key","_value"];
 _key = _this;
 _key = worldName +  sav_server_id + _key;
 _value = profileNameSpace getVariable [_key,"notset"];
 _value
};
smm_savegame_exists = {
 private["_data","_return","_key"];
 _key = worldName + sav_server_id + sav_tickets;
 _data = profileNameSpace getVariable (_key);

 _return = (!(isNil "_data"));
  diag_log ("Checking savegame for key " + _key + " which is " + (str _return));
 _return
};
