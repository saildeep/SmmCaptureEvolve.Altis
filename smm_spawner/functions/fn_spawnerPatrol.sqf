private _zone = _this select 0;
private _grp = _this select 1;
private _units = units _grp;
while{(_grp getVariable ["urban",false]) && !(isNull _grp)}do{
	private _building = (selectRandom (zoneNoToBuildings select _zone)) select 0;
	private _wp = _grp addWaypoint[getPos _building,10];
	_wp setWaypointType "HOLD";
	_wp waypointAttachObject _building;
	_wp setWaypointHousePosition 1;
	_grp setCurrentWaypoint _wp;
	sleep (random [60,200,300]);
};
if!(isNull _grp)then{
	private _defWP = _grp addWaypoint[_zone call smm_fnc_getPosition,10];
	_defWP setWaypointType "HOLD";
	_grp setCurrentWaypoint _defWP;
};