
params["_object"];
private _markerName = [_object] call Zone_fnc_GetMarkerName;

private _size = ([_object] call Zone_get_Size);
private _owner = ([_object] call Zone_get_Owner);
private _position = [_object] call Zone_get_Position;
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
//check respawn markers
{
	private _respawnMarkerName = [_object,_x] call Zone_fnc_GetRespawnMarkerName;
	if(_owner == _x)then{
		
		
		//if respawnmarker for current does not exist, create one
		if((getMarkerColor _respawnMarkerName) == "" )then{
			createMarker [_respawnMarkerName,_position];
		};
	}else{
		//delete all other respawn markers
		if( (getMarkerColor _respawnMarkerName) != "" )then{
			deleteMarker _respawnMarkerName;
		};
	};
	
} forEach smm_spawner_player_factions;