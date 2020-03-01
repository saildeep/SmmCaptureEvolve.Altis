/**
	Author: Jonas Körner

	Params:
	- Carrier
	- Designated position
 */
 params["_carrier","_carrierPos"];
 diag_log ("Updating carrier position of " + str(_carrier) + " to " + str(_carrierPos));
 waitUntil {! (isNil "_carrier")};
 sleep 5;
_carrier setPosASL _carrierPos;
_carrier setVectorDirAndUp [[0,1,0],[0,0,1]];
[_carrier] call BIS_fnc_Carrier01PosUpdate;

diag_log ("Updating carrier position of " + str(_carrier) + " to " + str(_carrierPos) + " finished");