 private["_key","_value"];
 _key = worldName +sav_server_id + (_this select 0);
 _value = _this select 1;
 diag_log ("Setting Key-Value Pair:");
 diag_log ("Key:" + _key);
 diag_log ("Value:" + (str _value));
 profileNameSpace setVariable [ _key,_value];