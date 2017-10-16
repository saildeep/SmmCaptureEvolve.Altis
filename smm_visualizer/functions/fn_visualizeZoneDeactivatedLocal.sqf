params["_zoneid"];
if(hasInterface)then{
	private _tm = call TasksManager_GetInstance;
	[_tm,_zoneid] call TasksManager_fnc_DeleteTask;
};