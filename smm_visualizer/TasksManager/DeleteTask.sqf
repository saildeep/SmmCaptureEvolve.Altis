params["_object","_zoneid"];
private _allTasks = simpleTasks player;
private _zone = [call ZonesManager_GetInstance,_zoneid] call ZonesManager_fnc_GetZone;
private _zonePosition = [_zone] call Zone_get_Position;
private _th = 30;
{
	if( ((taskDestination _x) distance _zonePosition) < _th )then{
		player removeSimpleTask _x;
	};
}forEach _allTasks;