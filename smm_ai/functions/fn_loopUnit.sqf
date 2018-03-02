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
	_unit setBehaviour "STEALTH";
	_unit moveTo (_unit getVariable KEY_ZONECENTER);
	_unit forceSpeed (_unit getSpeed "FAST");
	diag_log(format["Stupid soldier: %1 go back to zone", name _unit ]);
	waitUntil{ ( ((getPos _unit) distance (_unit getVariable KEY_ZONECENTER) )<= (_unit getVariable KEY_ZONERADIUS)) || ! (alive _unit) || (behaviour _unit isEqualTo "COMBAT");};
};

sleep 30;
};