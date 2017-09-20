params["_object","_eventname","_params"];

//first search for event in collection
private _events = [_object] call EventManager_get_Events;
private _foundIndex = (_events apply {[_x] call EventDistributor_get_Name}) find _eventname;
//only call if an event with this name was found
if(_foundIndex >= 0)then{
	private _event = _events select _foundIndex;
	[_event,_params] call EventDistributor_fnc_Trigger;
};