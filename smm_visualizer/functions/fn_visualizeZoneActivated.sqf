params["_zoneid"];
private _attackingSides = [];
private _zsm = call ZoneStatesManager_GetInstance;
private _tc = [_zsm] call ZoneStatesManager_get_Targets;
if(_zoneid in ([_tc] call TargetCollection_get_TargetsBLUFOR))then{
	_attackingSides pushBack west;
};
if(_zoneid in ([_tc] call TargetCollection_get_TargetsOPFOR))then{
	_attackingSides pushBack east;
};
if(_zoneid in ([_tc] call TargetCollection_get_TargetsINDEPENDENT))then{
	_attackingSides pushBack independent;
};
[_zoneid,_attackingSides] remoteExec ["smm_fnc_visualizeZoneActivatedLocal",0,true];