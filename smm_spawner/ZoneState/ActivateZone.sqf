params["_object"];
#define VAR_NAME_ZONE "owner_zone"


private _zoneID = [_object] call ZoneState_get_ZoneID;
diag_log ("Activating zone " + (str _zoneID));
private _zone = [call ZonesManager_GetInstance,_zoneID] call ZonesManager_fnc_GetZone;
private _zoneCenter = [_zone] call Zone_get_Position;
private _size = [_zone] call Zone_get_Size;
private _side = [_zone] call Zone_get_Owner;
private _buildings = [_object] call ZoneState_get_Buildings;

private _spawnVehicles = [_object] call ZoneState_fnc_GetSpawnVehicles;
private _spawnInfantry = [_object] call ZoneState_fnc_GetSpawnInfantry;

private _spawnedVehicles = [];
private _spawnedInfantry = [];




//spawn infantry
{

	private _group = createGroup[_side,true];
	_group setVariable [VAR_NAME_ZONE,_zoneID];
	_group setVariable ["acex_headless_blacklist", true];
	private _unittypes = _x;
	private _spawnpositions = [];

	//if there are enough buildings, spawn group in one of these
	if((count _buildings) > 3 )then{
		_spawnpositions = (selectRandom _buildings) buildingPos -1;
	}else{
		_spawnpositions = _unittypes apply {[_zoneCenter,_size] call smm_fnc_getSpawnPosNear};
	};
	assert((count _spawnpositions) >= (count _unittypes));
	//no spawn each single unit
	{
		private _cn = [_x] call SpawnableInfantry_get_ClassName;
		private _u = _group createUnit [_cn, _spawnpositions select _forEachIndex, [], 0, "NONE"];
		private _pn = [_x] call SpawnableInfantry_get_PostSpawnFunction;
		_u call _pn;
		_spawnedInfantry pushBack  _u;
	}forEach _unittypes;


} forEach ([_spawnInfantry,smm_spawner_units_per_group] call smm_fnc_subdivide);

