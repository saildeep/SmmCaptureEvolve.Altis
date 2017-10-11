params["_object","_zoneid","_sideid"];


private _seizingSide = smm_spawner_all_factions select _sideid;

private _targets = [[_object] call ZoneStatesManager_get_Targets,_seizingSide] call TargetCollection_fnc_GetTargetsForSide;
if(_zoneid in _targets)then{
	_targets deleteAt (_targets find _zoneid);
	diag_log "Capturing zone";
	diag_log _zoneid;
	diag_log "by";
	diag_log _sideid;
	diag_log _seizingSide;
	diag_log "Finished Capturing on HC";
	private _zs = [_object,_zoneid] call ZoneStatesManager_fnc_GetZoneState;
	[_zs] spawn ZoneState_fnc_DeactivateZone;
	private _handle = [_zoneid,_seizingSide] remoteExec ["smm_fnc_changeOwnerOnServer",2,false];
};