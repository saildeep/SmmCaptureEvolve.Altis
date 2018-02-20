/*
=======================================================================================================================
Script: BIN_taskPatrol.sqf v1.4
Author(s): Binesi
Partly based on original code by BIS

Description:
Creates a continually randomized patrol path which circles and intersects a given position.

Parameter(s):
_this select 0: the group to which to assign the waypoints (Group)
_this select 1: the position on which to base the patrol (Array)
_this select 2: the maximum distance between waypoints (Number)
_this select 3: (optional) debug markers on or off (Number)
_this select 4: (optional) blacklist of areas (Array)

Returns:
Boolean - success flag

Example(s):
null = [group this,(getPos this),250] execVM "BIN_taskPatrol.sqf"
null = [group this,(getPos this),250,1] execVM "BIN_taskPatrol.sqf" // Same with debug markers

-----------------------------------------------------------------------------------------------------------------------
Notes: Wolffy.au
If anyone is interested, I've made some additions to Binesi's BIN_taskPatrol script.
Random initial patrol direction - I noticed every patrol started off in the same direction, so I've randomised it.
Fixed the 2D position / findSafePos errors
Added building positions as possible patrol locations using Random Building Position Script v1.0 by Tophe of Ã–stgÃ¶ta Ops
Added check that BIS Functions has been initialised
Only perform the house patrols if the squad leader is a man

ArmaIIholic 
-- added part of JTD direction normalization function
-- changed numbers for waypoints to match previous waypoints
-- randomized initial direction -- Wolffy.au added only the offset which had to be reduced to 180 
          - however this script is making full circle from wherever it starts

=======================================================================================================================
*/

_grp = _this select 0;
_pos = _this select 1;
_max_dist = _this select 2;
_debug = if ((count _this) > 3) then {_this select 3} else {0};
_blacklist = if ((count _this) > 4) then {_blacklist = _this select 4} else {[]};

waitUntil {!isNil "bis_fnc_init"}; 
_mode = ["YELLOW", "RED"] call BIS_fnc_selectRandom;
_formation = ["STAG COLUMN", "WEDGE", "ECH LEFT", "ECH RIGHT", "VEE", "DIAMOND"] call BIS_fnc_selectRandom;

_grp setBehaviour "SAFE";
_grp setSpeedMode "LIMITED";
_grp setCombatMode _mode;
_grp setFormation _formation;

_center_x = (_pos) select 0;
_center_y = (_pos) select 1;
_center_z = (_pos) select 2;
if(isNil "_center_z")then{_center_z = 0;};

_wp_count = 4 + (floor random 3) + (floor (_max_dist / 100 ));
_angle = (360 / (_wp_count -1));

_new_angle = 0;
_wp_array = [];
_slack = _max_dist / 5.5;
if ( _slack < 20 ) then { _slack = 20 };

_setdir = round (random 1);

_angle_offset = random 180;
while {count _wp_array < _wp_count} do 
{
	private ["_x1","_y1","_wp_pos", "_prepos","_bldgpos","_bldgs"];

	_newangle = (count _wp_array * _angle) + _angle_offset;

	if ((_newangle > 360) || (_newangle < 0)) then
	{
		_newangle = abs (abs (_newangle) - 360);
	};

	if (_setdir == 1) then 
	{
		_newangle = -_newangle;

		if ((_newangle > 360) || (_newangle < 0)) then
		 {
			_newangle = abs (abs (_newangle) - 360);
		 };
	};

	_x1 = _center_x - (sin _newangle * _max_dist);
	_y1 = _center_y - (cos _newangle * _max_dist);

	_prepos = [_x1, _y1, _center_z];
	if ( isNil "_center_z" ) then {
		_prepos = [_x1, _y1];
	};

	_wp_pos = [_prepos, 0, _slack, 6, 0, 50 * (pi / 180), 0, _blacklist] call BIS_fnc_findSafePos;

if (leader _grp isKindOf "Man") then {		
	//////////////////////////////////////////////////////////////////
	// The following code is an extract from Random Building Position Script v1.0 by Tophe of Ã–stgÃ¶ta Ops
	//////////////////////////////////////////////////////////////////
	_bldgpos = [];
	_bldgs = nearestObjects [_wp_pos, ["Building"], 50];
	{
	  private["_i","_y"];
		_i = 0;
		_y = _x buildingPos _i;
		while {format["%1", _y] != "[0,0,0]"} do {
			_bldgpos = _bldgpos + [_y];
			_i = _i + 1;
			_y = _x buildingPos _i;
		};
	} forEach _bldgs;

	if(count _bldgpos != 0) then {_wp_pos = _bldgpos call BIS_fnc_selectRandom;};
	_wp_array = _wp_array + [_wp_pos];

	sleep 0.5;
};
};

sleep 1;

_j = count (waypoints _grp);

for "_i" from 1 to (_wp_count - 1) do
{
	private ["_wp","_cur_pos","_marker","_marker_name"];

	_cur_pos = (_wp_array select _i);

	// Create waypoints based on array of positions
	/* The index i is changed so it matches the FSM - j+i */

	_wp = _grp addWaypoint [_cur_pos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius (5 + _slack);
	[_grp,_j+_i] setWaypointTimeout [0, 2, 16];
	// When completing waypoint have 33% chance to choose a random next wp
	[_grp,_j+_i] setWaypointStatements ["true", "if ((random 3) > 2) then { group this setCurrentWaypoint [(group this), (floor (random (count (waypoints (group this)))))];};"];

	if (_debug > 0) then {
		_marker_name = str(_wp_array select _i);
		_marker = createMarker[_marker_name,[_cur_pos select 0,_cur_pos select 1]];
		_marker setMarkerShape "ICON";
		_marker_name setMarkerType "hd_dot";
	};

	sleep 0.5;
};

// End back near start point and then pick a new random point
_wp1 = _grp addWaypoint [_pos, 0];
_wp1 setWaypointType "SAD";
_wp1 setWaypointCompletionRadius (random (_max_dist));
[_grp,(count waypoints _grp)] setWaypointStatements ["true", "group this setCurrentWaypoint [(group this), (round (random 2) + 1)];"];

// Cycle in case we reach the end
_wp2 = _grp addWaypoint [_pos, 0];
_wp2 setWaypointType "CYCLE";
_wp2 setWaypointCompletionRadius 100;

true