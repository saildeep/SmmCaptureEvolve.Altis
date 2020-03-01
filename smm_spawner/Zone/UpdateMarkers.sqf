
params["_object"];
private _markerName = [_object] call Zone_fnc_GetMarkerName;
private _position = [_object] call Zone_get_Position;
if(isNil _markerName)then{
	createMarker [_markerName,_position];
};

private _size = ([_object] call Zone_get_Size);
private _owner = ([_object] call Zone_get_Owner);
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

private _markerTypesAndPosition = [["default",_position]];
private _carriers = ([_object] call Zone_get_CarrierSpots) apply {[_x] call Position3D_fnc_ToArray};
//diag_log ("Zone has carriers "+ str(_carriers));
{
	private _carrierMarkerSuffix =  "carrier_"+ (str _forEachIndex);
	private _carrierPosition = ASLToAGL([_x] call smm_fnc_getSpawnPositionRelativeToCarrier);
	diag_log ("Adding spawn position for carrier " + _carrierMarkerSuffix + " at " + (str _carrierPosition) + " of carrier pos " + (str _x));
	_markerTypesAndPosition pushBack [ _carrierMarkerSuffix,_carrierPosition ];
	
} forEach _carriers;
//check respawn markers
{
	private _markerSuffix = _x select 0;
	private _markerPos = _x select 1;
	{
	
		private _respawnMarkerName = ([_object,_x] call Zone_fnc_GetRespawnMarkerName) + "_" + _markerSuffix;
		if(_owner == _x)then{
			
			
			//if respawnmarker for current does not exist, create one
			if((getMarkerColor _respawnMarkerName) == "" )then{
				createMarker [_respawnMarkerName,_markerPos];
			};
		}else{
			//delete all other respawn markers
			if( (getMarkerColor _respawnMarkerName) != "" )then{
				deleteMarker _respawnMarkerName;
			};
		};
	
	} forEach smm_spawner_player_factions;
	
} forEach _markerTypesAndPosition;
