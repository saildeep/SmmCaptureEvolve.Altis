private _vehicle = _this;
if((typeName _this) == "ARRAY")then{
	_vehicle = _this select 0;
};
_vehicle setVariable [sav_timeout,time + (smm_garbage_collector_vehicle_timeout * timeMultiplier),false];
