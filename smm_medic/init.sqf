//also respawn options come here

if(smm_ace) then{
	//variable for prevent instant death
	if(smm_ace_medic)then{
		[] spawn{
			waitUntil{!isNil "medical_onUnconscious"};
			diag_log "Adding ACE onconscious event handler";
			["medical_onUnconscious",{_this spawn smm_on_unconscious;}] call  ace_common_fnc_addEventHandler;
		};
	};
};

[west,"WEST_MEDIC"] call BIS_fnc_addRespawnInventory;
[east,"EAST_MEDIC"] call BIS_fnc_addRespawnInventory;
[independent,"GUER_MEDIC"] call BIS_fnc_addRespawnInventory;
