removeAllWeapons player;
removeHeadgear player;
{
	player removeWeapon _x;
	
} forEach ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP"];
_this spawn smm_fnc_medicHandleLocalRespawn;
_this spawn smm_fnc_repairHandleLocalRespawn;