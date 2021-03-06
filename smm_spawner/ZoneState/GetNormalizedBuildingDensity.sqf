params["_object"];
private _zoneID = [_object] call ZoneState_get_ZoneID;
private _zone = [call ZonesManager_GetInstance,_zoneID] call ZonesManager_fnc_GetZone;
private _zoneCenter = [_zone] call Zone_get_Position;
private _zoneRadius = [_zone] call Zone_get_Size;
private _buildings = count (nearestObjects [_zoneCenter, ["House", "Building"], _zoneRadius]);
private _density = _buildings/(_zoneRadius * _zoneRadius);

if (isNil "topBuildingDensity") then {topBuildingDensity = _density};
if (isNil "bottomBuildingDensity") then {bottomBuildingDensity = _density};


if( _density > topBuildingDensity )then{
	topBuildingDensity = _density;
};

if( _density < bottomBuildingDensity ) then{
	bottomBuildingDensity = _density;
};

private _out = (_density - bottomBuildingDensity)/( (topBuildingDensity-bottomBuildingDensity)+0.0000000001);
_out