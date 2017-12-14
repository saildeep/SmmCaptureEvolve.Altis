removeAllWeapons player;
removeAllItems player;
removeBackpack player;
removeVest player;
removeUniform player;
removeHeadgear player;
{
	player removeWeapon _x;
	
} forEach ["NVGoggles","NVGoggles_OPFOR","NVGoggles_INDEP","ItemCompass","ItemGPS","ItemWatch","ItemRadio"];
_this spawn smm_fnc_medicHandleLocalRespawn;
_this spawn smm_fnc_repairHandleLocalRespawn;