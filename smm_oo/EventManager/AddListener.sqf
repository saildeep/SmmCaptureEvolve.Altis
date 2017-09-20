params["_object","_eventname","_function",["_spawn",false]];
//first search for event in collection
private _events = [_object] call EventManager_get_Events;
private _foundIndex = (_events apply {[_x] call EventDistributor_get_Name}) find _eventname;
private _ev;
if(_foundIndex > -1)then{
	//case event already exists
	_ev = _events select _foundIndex;
}else{
	_ev = [_eventname,[],[]] call EventDistributor_create;
	_events pushBack _ev;
};


if(_spawn)then{
	[_ev] call EventDistributor_fnc_AddEventListenerSpawn;
}else{
	[_ev] call EventDistributor_fnc_AddEventListenerCall;
};