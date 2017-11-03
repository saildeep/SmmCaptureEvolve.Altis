params["_zoneid","_sides"];

if(hasInterface)then{
	if(playerSide in _sides)then{
		diag_log "Received creating task for params:";
		diag_log _this;
		private _zone = [call ZonesManager_GetInstance,_zoneid] call ZonesManager_fnc_GetZone;
		private _t = player createSimpleTask [format [str_task_title,[_zone] call Zone_get_DisplayName]];
		_t setSimpleTaskDestination ([_zone] call Zone_get_Position);
		_t setsimpletaskType "attack";
		_t setTaskState "Assigned";
		private _tm = call TasksManager_GetInstance;
		[_tm,_zoneid,_t] call TasksManager_fnc_AddTask;
	};
};