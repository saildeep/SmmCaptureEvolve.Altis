#include "constants.hpp"
params["_group","_allZoneGroups","_zoneid"];

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
diag_log( format["Group : %1 start setup Defending",_group]) ;
waitUntil{ [_group,_group getVariable KEY_ZONECENTER] call smm_fnc_taskDefend_v1_3a; };
diag_log( format["Group : %1 done setup Defending",_group]) ;
}else{
diag_log( format["Group : %1 start setup Partoling",_group]) ;
waitUntil{[_group,_group getVariable KEY_ZONECENTER,(_group getVariable KEY_ZONERADIUS)*0.9,0]call smm_fnc_taskPatrol_v1_4;};
diag_log( format["Group : %1 done setup Patroling",_group]) ;
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
	private _allZoneUnits = [[call ZoneStatesManager_GetInstance,_zoneid] call ZoneStatesManager_fnc_GetZoneState] call ZoneState_get_Units;
	{
		private _unit = _x;
		{
			private _entity = _x;		
			if( (_entity select 3)>0 && (_unit knowsAbout (_entity select 4) )>0.5)then{
				{
					_x reveal [(_entity select 4), 1.6];
					//diag_log(format["Unit %1 - %2 reveal %3 to %4",name _unit,_unit,_entity select 4 ,_x]);
				}forEach (_allZoneUnits);
			};
		} forEach (_unit nearTargets 500);
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
				waitUntil{ ((getPos _x) distance _nearTentPos )<=5 || ! (alive _x) ;};
				doStop _x;		
			}forEach(units _group);
		};
	};
	sleep 30;
};