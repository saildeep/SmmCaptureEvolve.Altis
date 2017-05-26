sav_timeout = "timeout";
/*
smm_garbage_collector_reset = {
	private _object = _this;

	_object setVariable [sav_timeout,time + (smm_garbage_collector_weapon_holder_timeout * timeMultiplier),false];
	_object
};

smm_garbage_collector_has_timeout = {
	private _object = _this;
	private _v = _object getVariable [sav_timeout,-1];
	private _result = false;
	if(_v == -1)then{
		_result = false;
	}else{
		_result = true;
	};
	_result
};

smm_garbage_collector_observe_vehicle_server = {
	private _vehicle = _this;
	_vehicle call smm_garbage_collector_reset_vehicle;
	_vehicle addEventHandler ["GetIn","_this call smm_garbage_collector_reset_vehicle"];
	_vehicle addEventHandler ["Getout","_this call smm_garbage_collector_reset_vehicle"];
};

smm_garbage_collector_observe_vehicle_client = {
	_this remoteExec ["smm_garbage_collector_observe_vehicle_server",2,false];
	_this
};

smm_garbage_collector_reset_vehicle = {
	private _vehicle = _this;
	if((typeName _this) == "ARRAY")then{
		_vehicle = _this select 0;
	};
	_vehicle setVariable [sav_timeout,time + (smm_garbage_collector_vehicle_timeout * timeMultiplier),false];
};

smm_garbage_collector_delete = {
	private _vehicle = _this;
	if(_this call smm_garbage_collector_has_timeout)then{
		private _timeout = _vehicle getVariable sav_timeout;
		if(_timeout < time)then{
			deleteVehicle _vehicle;
		};
	};

};
*/