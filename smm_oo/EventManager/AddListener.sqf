params["_object","_eventname","_function",["_spawn",false]];
//first search for event in collection
private _events = [_object] call EventManager_get_Events;
private _foundIndex = (_events apply {[_x] call EventDistributor_get_Name}) find _eventname;
private _ev = if(_foundIndex > -1)then{_events select _foundIndex}else{_t = [_eventname,[],[]] call EventDistributor_create;_events pushBack _t;_t};


if(_spawn)then{
	[_ev,_function] call EventDistributor_fnc_AddEventListenerSpawn;
}else{
	[_ev,_function] call EventDistributor_fnc_AddEventListenerCall;
};