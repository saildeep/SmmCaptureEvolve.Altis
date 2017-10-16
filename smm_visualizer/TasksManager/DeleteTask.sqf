params["_object","_zoneid"];
private _tasks = [_object] call TasksManager_get_Tasks;
if((count _tasks)>_zoneid )then{
	if(!isNil {_tasks select _zoneid})then{
		private _t = _tasks select _zoneid;
		player removeSimpleTask _t;
		_tasks set [_zoneid,nil];
	};
};