 private["_key","_value"];
 _key = _this;
 _key = worldName +  sav_server_id + _key;
 _value = profileNameSpace getVariable [_key,"notset"];
 _value