params["_object","_zoneid","_task"];
private _tasks = [_object] call TasksManager_get_Tasks;
if( (count _tasks) < _zoneid )then{
	_tasks resize _zoneid;
};

if(!isNil {_tasks select _zoneid})then{
	player removeSimpleTask (_tasks select _zoneid);
};
_tasks set [_zoneid,_task];
_zoneid
