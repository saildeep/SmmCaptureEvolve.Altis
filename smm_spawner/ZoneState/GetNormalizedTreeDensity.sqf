params["_object"];
private _zoneID = [_object] call ZoneState_get_ZoneID;
private _zone = [call ZonesManager_GetInstance,_zoneID] call ZonesManager_fnc_GetZone;
private _treeCount = [_object] call ZoneState_get_TreeCount;
private _zoneRadius = [_zone] call Zone_get_Size;
private _density = _treeCount/(_zoneRadius * _zoneRadius);

if (isNil "topTreeDensity") then {topTreeDensity = _density};
if (isNil "bottomTreeDensity") then {bottomTreeDensity = _density};


if( _density > topTreeDensity )then{
	topTreeDensity = _density;
};

if( _density < bottomTreeDensity ) then{
	bottomTreeDensity = _density;
};

private _out = (_density - bottomTreeDensity)/( (topTreeDensity-bottomTreeDensity)+0.0000000001);
_out