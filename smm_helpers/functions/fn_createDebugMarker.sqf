if(smm_debug)then{
	private _pos = _this select 0;
	private _timeout = _this select 1;
	private _color = _this select 2;
	if(isNil "debugMarkerCounter")then{
		debugMarkerCounter = 0;
	};
	debugMarkerCounter = debugMarkerCounter + 1;
	private _markerName = "smm_debugmarker" + (str debugMarkerCounter);
	_markerName = createMarker[_markerName,_pos];
	_markerName setMarkerShape "ICON";
	_markerName setMarkerType "hd_dot";
	_markerName setMarkerColor _color;
	[_markerName,_timeout] spawn {
		_marker = _this select 0;
		_timeout = _this select 1;
		sleep _timeout;
		deleteMarker _marker;
	};
};