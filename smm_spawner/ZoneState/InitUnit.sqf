params["_object","_u"];
private _zoneID = [_object] call ZoneState_get_ZoneID;

_u setVariable ["zoneid",_zoneID,true];

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

_u addEventHandler ["killed",{
		

		private _killermaybevehicle = (_this select 1);
		private _killedunit = (_this select 0);
		private _zoneID = _killedunit getVariable["zoneid",-1];
		if(_zoneID<0)then{
			diag_log (format ["Zone id not set on killed unit %1",_killedunit]);
		}else{
			//randomly order reinforcement
			if((random 1) < 0.2)then{
				[_zoneID,_killedunit] spawn{
					params["_zoneID","_killedunit"];
					private _zm = call ZoneStatesManager_GetInstance;
					private _zs = [_zm,_zoneID] call ZoneStatesManager_fnc_GetZoneState;
					diag_log (format ["Ordering reinforcement for killed unit %1 at zone %2 at time %3 with state %4",_killedunit,_zoneID,serverTime,_zs]);
					[_zs] call ZoneState_fnc_ReinforceZone;
				};
			};
		};
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





([_object] call ZoneState_get_Units) pushBackUnique _u;