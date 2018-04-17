/*
	Author: Jonas Körner

	Gets the relative strength of the zone with values between 0 and 1
*/
params["_object"];
private _v = 0;
private _objectives = [_object] call ZoneState_get_Objectives;
private _oc = count(_objectives);
private _ocAlive = count (_objectives select {alive _x});
if(_oc > 0)then{
	_v = _ocAlive / _oc;
};
_v