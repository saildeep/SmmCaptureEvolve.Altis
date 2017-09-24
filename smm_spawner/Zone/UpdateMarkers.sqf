
params["_object"];
private _markerName = [_object] call Zone_fnc_GetMarkerName;

private _size = ([_object] call Zone_get_Size);
_markerName setMarkerBrush "GRID";
_markerName setMarkerShape "ELLIPSE";
_markerName setMarkerSize [_size,_size];
private _owner = [_object] call Zone_get_Owner;
switch (_owner) do {
	case west: { _markerName setMarkerColor "ColorWEST" };
	case east: { _markerName setMarkerColor "ColorEAST" };
	case independent: { _markerName setMarkerColor "ColorGUER" };
	case civilian: {_markerName setMarkerColor "ColorCIV"};
	default { };
};