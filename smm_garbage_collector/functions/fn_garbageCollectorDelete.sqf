private _vehicle = _this;
if(_this call smm_fnc_garbageCollectorHasTimeout)then{
	private _timeout = _vehicle getVariable sav_timeout;
	if(_timeout < time)then{
		deleteVehicle _vehicle;
	};
};