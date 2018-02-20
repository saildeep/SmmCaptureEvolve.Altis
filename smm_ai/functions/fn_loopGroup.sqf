#include "constants.hpp"
params["_group","_allZoneGroups"];

private _isInCombat = false;
private _forceToGoToTent =false;
private _startGroupSize = count units _group;
private _currentGroupSize =_startGroupSize;

// init unit special behaviour
{
	[_x] spawn smm_fnc_loopUnit;
}
foreach(units _group );

// As long as the group is alive the loop is alive.

// setup guard and patrol
if(((_allZoneGroups find _group) + 1 ) % 3 == 0 )then{
diag_log( format["Group : %1 start setup Partoling",_group]) ;
waitUntil{[_group,_group getVariable KEY_ZONECENTER,(_group getVariable KEY_ZONERADIUS)*0.8,0]call smm_fnc_taskPatrol_v1_4;};
diag_log( format["Group : %1 done setup Patroling",_group]) ;
}else{
diag_log( format["Group : %1 start setup Defending",_group]) ;
waitUntil{ [_group,_group getVariable KEY_ZONECENTER] call smm_fnc_taskDefend_v1_3a; };
diag_log( format["Group : %1 done setup Defending",_group]) ;
};

while{ ({alive _x} count units _group) > 0 } do {

	// get group status
	_currentGroupSize = ({alive _x} count units _group);

	// get status of each group member and react to them.
	{
		if (behaviour _x isEqualTo "COMBAT") then {
			_isInCombat = true;
		};
	} forEach (units _group );

	// share information about enemy 
	{
		_nearestEnemy  = _x findNearestEnemy _x;
		{
		_x reveal _nearestEnemy;
		}forEach (_allZoneGroups);
	} forEach (units _group );
	
	// Command: Back to Tent
	if(_isInCombat && ( ((leader _group) distance (_group getVariable KEY_ZONECENTER)) ) > ((_group getVariable KEY_ZONERADIUS)/4)) then {
		
		// if group size is decimated by 50% go back to tent.
		if ( (_currentGroupSize / _startGroupSize) <0.5 ) then {
			
			diag_log(format["Group %1 fallback to tent", _group]);
			{
				_x setBehaviour "STEALTH";
				_isInCombat = false;
				_nearTentPos = [_group getVariable KEY_ZONECENTER, 2, 20, 0, 0, 20, 0,[],_group getVariable KEY_ZONECENTER] call BIS_fnc_findSafePos;
				_x doMove _nearTentPos;
				_x forceSpeed (_x getSpeed "FAST");
				diag_log(format["Soldier: %1 go back to tent", name _x ]);
				waitUntil{ ((getPos _x) distance _nearTentPos )<=5 ;};
				doStop _x;		
			}forEach(units _group);
		};
	};
	sleep 30;
};
"run"