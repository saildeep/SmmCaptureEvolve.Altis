//also respawn options come here

if(smm_ace) then{
	//variable for prevent instant death
	if(smm_ace_medic)then{
		[] spawn{
			diag_log "Adding ACE onconscious event handler";
			["ace_unconscious",{_this spawn smm_fnc_onUnconscious;}] call CBA_fnc_addEventHandler;
		};
	};
};

[west,"WEST_MEDIC"] call BIS_fnc_addRespawnInventory;
[east,"EAST_MEDIC"] call BIS_fnc_addRespawnInventory;
[independent,"GUER_MEDIC"] call BIS_fnc_addRespawnInventory;
