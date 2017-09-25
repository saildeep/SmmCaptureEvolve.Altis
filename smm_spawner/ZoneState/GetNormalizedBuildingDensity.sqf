params["_object"];
private _zoneID = [_object] call ZoneState_get_ZoneID;
private _zone = [call ZonesManager_GetInstance,_zoneID] call ZonesManager_fnc_GetZone;
private _buildings = count [_object] call ZoneState_get_Buildings;
private _zoneRadius = [_zone]call Zone_fnc_get_Size;

if (isNil "topBuildingDensity") then {topBuildingDensity = (_buildings/(_zoneRadius*_zoneRadius))};
if (isNil "bottomBuildingDensity") then {bottomBuildingDensity = (_buildings/(_zoneRadius*_zoneRadius))};

if((_buildings/(_zoneRadius*_zoneRadius))>topBuildingDensity)then{
	topBuildingDensity = (_buildings/(_zoneRadius*_zoneRadius));
};

if((_buildings/(_zoneRadius*_zoneRadius))<bottomBuildingDensity)then{
	bottomBuildingDensity = (_buildings/(_zoneRadius*_zoneRadius));
}

private _out = ((_buildings/(_zoneRadius*_zoneRadius)) - bottomBuildingDensity)/(topBuildingDensity-bottomBuildingDensity+1);
_out