params["_unit","_prefix"];
diag_log "Calling debugTrack with:";
diag_log _this;
private _numMarker = 30;
sleep (random 30);

private _mymarkers = [];
for [{private _i = 0}, {_i < _numMarker}, {_i = _i + 1}] do {
	private _mname = _prefix + "_tracker_" + (str _i);
	_m = createMarker[_mname,getPos _unit];
	_m setMarkerShape "ICON";
	_m setMarkerType "hd_dot";
	
	if((side _unit)==east)then{
		_m setMarkerColor "colorOPFOR";
	};
	if((side _unit)==west)then{
		_m setMarkerColor "colorBLUFOR";
	};
	if((side _unit)==independent)then{
		_m setMarkerColor "colorIndependent";
	};

	_mymarkers pushBack _m;
}; 


private _ci = 0;
while{alive _unit}do{
	_ci = (_ci + 1) % _numMarker;
	private _currentPos = getPos _unit;
	private _marker = (_mymarkers select _ci);
	private _stance = stance _unit;
	private _icon = switch (_stance) do {
						case "STAND": {"hd_dot" };
						case "CROUCH": { "mil_triangle"};
						case "PRONE": { "mil_box" };
						case "UNDEFINED": { "mil_unknown"};
						default {"mil_warning" };
					};
	_marker setMarkerType _icon;
	_marker setMarkerPos _currentPos;
	sleep (random [0.7,0.8,0.9]);
};

{
	deleteMarker _x;
}forEach _mymarkers;