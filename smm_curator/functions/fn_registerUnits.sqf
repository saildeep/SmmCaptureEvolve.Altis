
_units = _this select 0;
_zoneID = _this select 1;

_curator = curatorByZoneID select _zoneID;
_curator addCuratorEditableObjects [_units, true];
