params["_position"];
assert ((count _position) in [2,3]);
private _zonesManager = call ZonesManager_GetInstance;
private _found = false;
{
	private _zonePos = [_x] call Zone_get_Position;
	private _zoneRange = [_x] call Zone_get_Size;
	private _zoneOwner = [_x] call Zone_get_Owner; 
	
	if(_zoneOwner == playerSide and (_position distance2D _zonePos)< _zoneRange)then{
		_found = true;
	};

}forEach([_zonesManager] call ZonesManager_get_Zones);
_found