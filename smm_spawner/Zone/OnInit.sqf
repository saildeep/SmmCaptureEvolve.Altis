params["_object"];
private _position = [_object] call Zone_get_Position;
private _markerName = [_object] call Zone_fnc_GetMarkerName;
createMarker [_markerName,_position];
[_object] call Zone_fnc_UpdateMarkers;