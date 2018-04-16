/**
	Author: Jonas Körner

	Returns a number of seconds, after which new reinforcements can be spawned
*/
params["_object"];
private _relObjStrength = [_object] call ZoneState_fnc_ObjectiveStrength;
private _v = 60 * (60 - (_relObjStrength * 50) ) ; //time between 10 minutes (all towers still there) and 60 min (all towers destroyed)

_v