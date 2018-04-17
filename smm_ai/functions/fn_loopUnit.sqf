#include "constants.hpp"
params["_unit"];

private _unitIsInCombat = false;


while{alive _unit}do{

	if(behaviour _unit isEqualTo "COMBAT")then{
		_unitIsInCombat=true;
	}else{
		_unitIsInCombat=false;
	};

	if(((getpos _unit) distance (_unit getVariable KEY_ZONECENTER)) > (_unit getVariable KEY_ZONERADIUS) )then{
		diag_log(format["Stupid soldier %1 leaving zone",(name _unit) ]);
		private _distance = (getpos _unit) distance (_unit getVariable KEY_ZONECENTER);
		private _centerToUnit = (_unit getVariable KEY_ZONECENTER) getDir (getPos _unit);
		//move to point betwwen center and unit, which is in range of the zone
		private _targetPos = (_unit getVariable KEY_ZONECENTER) getPos [0.5 * (_unit getVariable KEY_ZONERADIUS),_centerToUnit];

		//only order back if not in vehicle
		if((vehicle _unit) == _unit )then{
			//select behaviour based on distance to increase walking speed of units far away
			private _behaviour = if(_distance > (50+ (_unit getVariable KEY_ZONERADIUS)) )then{"SAFE"}else{"STEALTH"};
			_unit setBehaviour _behaviour;
			_unit doMove _targetPos;
			_unit forceSpeed (_unit getSpeed "FAST");
			diag_log(format["Stupid soldier: %1 go back to zone", name _unit ]);
		}else{
			//make unit return
		};
		waitUntil{ ( ((getPos _unit) distance (_unit getVariable KEY_ZONECENTER) )<= (_unit getVariable KEY_ZONERADIUS)) || ! (alive _unit) || (behaviour _unit isEqualTo "COMBAT");};
	};

	sleep 30;
};