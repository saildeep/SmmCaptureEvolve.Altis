params["_vehicle",["_onlyace",false]];
private _doRemove = true;
if(_onlyace && {!smm_ace})then{
	_doRemove = false;
};
if(_doRemove)then{
	_vehicle setVehicleAmmo 0;
};