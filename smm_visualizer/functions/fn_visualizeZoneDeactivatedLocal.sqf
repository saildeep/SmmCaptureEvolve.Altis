params["_zoneid"];
if(hasInterface)then{
	diag_log "Received deleting task for params:";
	diag_log _this;
	private _tm = call TasksManager_GetInstance;
	[_tm,_zoneid] call TasksManager_fnc_DeleteTask;
};