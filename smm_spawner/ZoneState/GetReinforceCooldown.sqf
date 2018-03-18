/**
	Author: Jonas Körner

	Returns a number of seconds, after which new reinforcements can be spawned
*/
params["_object"];
private _relObjStrength = [_object] call ZoneState_fnc_ObjectiveStrength;
private _v = 60 * (30 - (_relObjStrength * 25) ) ; //time between 5 minutes (all towers still there) and 30 min (all towers destroyed)

_v