params ["_veh","_side","_price","_classname","_purchaserUID"];
_veh setVariable [str_refund_owner,_purchaserUID];
_veh setVariable [str_refund_price,_price];

_log = format ["Bought %1 for %2 $ for side %3",_classname,_price,_side];
diag_log _log;
//handle case this is a respawn vehicle
_out = false;
if(_classname in respawnVehicles) then{
	_out = true;
	//check if index for mobile respawn markers exist, otherwise create it
	if(isNil {mobileRespawnIndex})then{
		mobileRespawnIndex = 0;
	}else{
		mobileRespawnIndex = mobileRespawnIndex + 1;
	};
	
	_markerName = "respawn_" + _side + "Mobile" + (str mobileRespawnIndex);
	_log = format["Creating mobile respawn marker %1",_markerName];
	diag_log _log;
	_markerName = createMarker [_markerName, getPos _veh];
	_markerName setMarkerAlpha 0;
	//update marker position as long as vehicle is alive
	[_veh,_markerName] spawn {
		params ["_v","_m"];
		while {alive _v && smm_respawn_on_vehicle} do {
			_m setMarkerPos (getPos _v);
			sleep 10;
		};
		deleteMarker _m;
	};
	
};
_out 
