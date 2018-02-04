#include "constants.hpp"
params["_group"];

private _isInCombat = false;
private _forceToGoToTent =false;
private _startGroupSize = count units _group;
private _currentGroupSize =_startGroupSize;
 // as long as group exist. loop exist
while{ ({alive _x} count units _group) > 0 } do {
	// get group status
	_currentGroupSize = ({alive _x} count units _group);

	// get status of each group member
	{
		if (behaviour _x isEqualTo "COMBAT") then {
			_isInCombat = true;
		};

		if(behaviour _x isEqualTo "SAFE" && ( (position _x) distance ( (_group getVariable KEY_ZONECENTER)) ) < 10 ) then{
			_x setBehaviour "AWARE";
			_x setCombatMode "RED";
		};
		
	} forEach (units _group );

	if(_isInCombat && ( ((leader _group) distance (_group getVariable KEY_ZONECENTER)) ) > ((_group getVariable KEY_ZONERADIUS)/4))  then{

		if ( (_currentGroupSize / _startGroupSize) <=0.5 ) then {
			
			//diag_log(format["Group %1 fallback to tent", _group]);
			
			{_x setUnitPos "UP"; _x disableAi "autoCombat";  _x disableAi "autoTarget"} foreach units _group;
			_forceToGoToTent = true;
			_group allowfleeing 0;
			_group setBehaviour "SAFE";
			_group setCombatMode "BLUE";
			_group setSpeedMode "FULL"; 

			private _waypointBackToTent = _group addWaypoint [_group getVariable KEY_ZONECENTER,5];
			_waypointBackToTent setWaypointCombatMode "YELLOW";
			_waypointBackToTent setWaypointSpeed "FULL";
			_group setCurrentWaypoint _waypointBackToTent;
			_waypointBackToTent setWaypointType "MOVE";

			_isInCombat = false;
		}
	};

	if(_forceToGoToTent && ( ((leader _group) distance (_group getVariable KEY_ZONECENTER)) ) < ((_group getVariable KEY_ZONERADIUS)/4) ) then {
		
		//diag_log(format["Group %1 at tent, engage again", _group]);
		{_x setUnitPos "AUTO"; _x enableAI  "autoCombat";  _x enableAI  "autoTarget"} foreach units _group;

		_forceToGoToTent =false;
	};

};
"run"