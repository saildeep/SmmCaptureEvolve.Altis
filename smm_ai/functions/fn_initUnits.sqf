params["_units","_zoneid"];


{
	if(smm_debug_ai)then{
		[_x,(str _forEachIndex) + "_forzone_"+ (str _zoneid)] spawn smm_fnc_debugTrackUnit;
	};

	_x setBehaviour "RED";
}forEach _units;