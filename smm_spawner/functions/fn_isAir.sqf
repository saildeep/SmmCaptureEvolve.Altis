private _vehClassname = _this;
private _cfgEntry = configFile >> "CfgVehicles" >> _vehClassname;
private _result = false;
if((getText(_cfgEntry >> "vehicleClass"))=="Air")then{
	_result = true;
};
_result