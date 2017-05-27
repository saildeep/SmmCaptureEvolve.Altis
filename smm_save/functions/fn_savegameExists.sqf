 private["_data","_return","_key"];
 _key = worldName + sav_server_id + sav_tickets;
 _data = profileNameSpace getVariable (_key);
 _return = (!(isNil "_data"));
  diag_log ("Checking savegame for key " + _key + " which is " + (str _return));
 _return