params["_object","_zoneid","_sideid"];

private _seizingSide = smm_spawner_all_factions select _sideid;

diag_log ( (str _zoneid) + " seized by " + (str _seizingSide)  );
//list of indices, which targets are currently attackable
private _targets = [[_object] call ZoneStatesManager_get_Targets] call TargetCollection_fnc_GetAllTargetsFlat;
//only zones which are currently a target can be captured
if(_zoneid in _targets)then{
	private _zone = [call ZonesManager_GetInstance,_zoneid] call ZonesManager_fnc_GetZone
	private _ownerSide = [_zone] call Zones_get_Owner;
	//you can not capture your own zone
	if(_ownerSide != _seizingSide)then{
		//TODO capture
	};
};