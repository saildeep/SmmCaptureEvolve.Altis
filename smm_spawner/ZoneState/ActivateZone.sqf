
#define VAR_NAME_ZONE "owner_zone"

params["_object"];
diag_log ("called ActivateZone.sqf with params " + (str _this) );

private _zoneID = [_object] call ZoneState_get_ZoneID;
diag_log ("Zone id is " + (str _zoneID));
private _zone = [call ZonesManager_GetInstance,_zoneID] call ZonesManager_fnc_GetZone;
diag_log ("Zone is " + (str _zone));
private _zoneCenter = [_zone] call Zone_get_Position;
diag_log ("Zone center is " + str(_zoneCenter));
private _size = [_zone] call Zone_get_Size;
private _side = [_zone] call Zone_get_Owner;
private _buildingType = ["House", "Building"];
private _buildings = (nearestObjects [_zoneCenter,_buildingType,_size]) select {(count (_x buildingPos -1)) >= smm_spawner_units_per_group};

private _em = call EventManager_GetInstance;

private _spawnVehicles = [_object] call ZoneState_fnc_GetSpawnVehicles;
private _spawnInfantry = [_object] call ZoneState_fnc_GetSpawnInfantry;

private _spawnedVehicles = [];
private _spawnedVehicleCrew = [];
private _spawnedInfantry = [];




//spawn infantry
{

	private _group = createGroup[_side,true];
	_group setVariable [VAR_NAME_ZONE,_zoneID];
	_group setVariable ["acex_headless_blacklist", true];
	_group enableDynamicSimulation true;
	private _unittypes = _x;
	private _spawnpositions = [];

	//if there are enough buildings, spawn group in one of these
	if((count _buildings) > 3 )then{
		_spawnpositions append  ((selectRandom _buildings) buildingPos -1);
	};

	{
		_spawnpositions pushBack ([_zoneCenter,_size] call smm_fnc_getSpawnPosNear);
	}forEach _unittypes;
	
	assert((count _spawnpositions) >= 1);
	//now spawn each single unit
	{
		private _cn = [_x] call SpawnableInfantry_get_ClassName;
		private _pn = [_x] call SpawnableInfantry_get_PostSpawnFunction;
		private _u = _group createUnit [_cn, (_spawnpositions select (_forEachIndex  % (count _spawnpositions) ) ), [], 0, "CAN_COLLIDE"];
		 
		_u call _pn;
		_spawnedInfantry pushBack  _u;

		//set certain settings for ActivateZone
		_u setVariable ["zoneid",_zoneID,true];
		_u allowFleeing 0;

		{
			_u setSkill [_x,smm_skill];
		}forEach ["aimingAccuracy","aimingShake","aimingSpeed","endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];

		if(smm_ai_disable_nvg)then{
			_u removePrimaryWeaponItem "acc_pointer_IR";
			//try to add russian acc_flashlight first
			if(isClass(configfile >> "CfgPatches" >> "rhs_weapons"))then{
				_u addPrimaryWeaponItem "rhs_acc_2dpZenit";
			};
        	_u addPrimaryWeaponItem "acc_flashlight";
    		_u enableGunLights "forceon";
			{_u removeWeapon _x} forEach  ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP"];
		};


	}forEach _unittypes;


} forEach ([_spawnInfantry,smm_spawner_units_per_group] call smm_fnc_subdivide);
([_object] call ZoneState_get_Units) append _spawnedInfantry;
[_em,"OnInfantrySpawned",[_spawnedInfantry,_zoneID] ] call EventManager_fnc_Trigger;

//spawn vehicles
{
	private _group = createGroup[_side,true];
	_group setVariable [VAR_NAME_ZONE,_zoneID];
	_group setVariable ["acex_headless_blacklist", true];
	_group enableDynamicSimulation true;
	private _vehicletypes = _x;
	private _spawnpositions = _vehicletypes apply {[_zoneCenter,_size] call smm_fnc_getSpawnPosNear};

	{
		private _cn = [_x] call SpawnableVehicle_get_ClassName;
		private _pn = [_x] call SpawnableVehicle_get_PostSpawnFunction;
		private _v = _cn createVehicle (_spawnpositions select _forEachIndex);
		createVehicleCrew _v;
		_spawnedVehicles pushBack _v;
		_v call _pn;
		_spawnedVehicleCrew append (crew _v);
	}forEach _vehicletypes;


}forEach ([_spawnVehicles,smm_spawner_vehicles_per_group] call smm_fnc_subdivide);
([_object] call ZoneState_get_Units) append _spawnedVehicleCrew;
{
	_x addEventHandler ["killed",{
		

		private _killermaybevehicle = (_this select 1);
		private _killedunit = (_this select 0);
		//workaround for ace
		if(smm_ace)then{
			_killermaybevehicle = (_this select 0) getVariable ["ace_medical_lastDamageSource",_this select 1];
		};
		diag_log "Calling killed EH";
		diag_log _killedunit;
		diag_log "Killed by";
		diag_log _killermaybevehicle;
		
		//do not reward TK
		if( (side _killermaybevehicle) != (side _killedunit) )then{
			[floor (random smm_spawner_per_kill_bounty),side _killermaybevehicle] call smm_fnc_addMoneySide;
		};

	}];
}forEach ([_object] call ZoneState_get_Units);
([_object] call ZoneState_get_Vehicles) append _spawnedVehicles;
[_em,"OnVehiclesSpawned",[_spawnedVehicles,_spawnedVehicleCrew,_zoneID]] call EventManager_fnc_Trigger;
[_em,"OnZoneActivated",_zoneID] call EventManager_fnc_Trigger;