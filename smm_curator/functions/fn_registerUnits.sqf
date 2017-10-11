systemchat "fnc started";
_units = _this select 0;
_zoneID = _this select 1;

waitUntil{!isNil "curatorByZoneID"};
_curator = curatorByZoneID select _zoneID;
_curator addCuratorEditableObjects [_units, true];
systemchat "fnc exited";
