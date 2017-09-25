
_curator = _this select 0;
_waypoint = [_this select 1, _this select 2];

_waypointPos = waypointPosition _waypoint;
_position = _curator getVariable "position";
_distance = _waypointPos distance2D _position;
_radius = _curator getVariable "radius";

if (_distance > _radius) then {
	_d = _radius / _distance;
	_vX = (_waypointPos select 0) - (_position select 0);
	_vY = (_waypointPos select 1) - (_position select 1);
	_pos = [_vX * _d + (_position select 0), _vY * _d + (_position select 1)];
	_waypoint setWaypointPosition [_pos, 0];
};
