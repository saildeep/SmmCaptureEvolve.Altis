/*
add
[this, (CLASSNAME)] call smm_fnc_setPerkClass;

Set perks to a unit class.
*/

#include "constants.hpp"
params["_unit","_class"];

private _radio_and_uniform = switch(side _unit)do{
	case west:{["EQUIPMENT_BLUFOR","UNIFORM_BLUFOR","RADIO_SMALL_BLUFOR"]};
	case east:{["EQUIPMENT_OPFOR","UNIFORM_OPFOR","RADIO_SMALL_OPFOR"]};
	case independent:{["EQUIPMENT_INDEPENDENT","UNIFORM_INDEPENDENT","RADIO_SMALL_INDEPENDENT"]};
	default { throw " invalid side" };
};

private _perkClass = switch(_class) do{
	case "LEADER"							: { private _classEquipment = ["BASE","PDW"];
											_classEquipment
										  };
	case "MEDIC"							: { private _classEquipment = ["BASE","PDW","RIFLEMAN","MEDIC","BACKPACK"];
											_classEquipment
										  };
	case "ANTI_TANK_AIR"			: { private _classEquipment = ["BASE","PDW","RIFLEMAN","ANTI_AIR","ANTI_TANK","BACKPACK"];
											_classEquipment
										  };
	case "SNIPER"							: { private _classEquipment = ["BASE","PDW","MARKSMAN","SNIPER","SCOPE_LR"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 				:{["UNIFORM_SNIPER_BLUFOR"]};
												case EAST					:{["UNIFORM_SNIPER_OPFOR"]};
												case independent	:{["UNIFORM_SNIPER_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "SCOUT"							: { private _classEquipment = ["BASE","PDW","RIFLEMAN","SPOTTER_EQUIPMENT","SCOPE_LR"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 				:{["UAV_BLUFOR","RADIO_LARGE_BLUFOR","DESIGNATOR_BLUFOR"]};
												case EAST					:{["UAV_OPFOR","RADIO_LARGE_OPFOR","DESIGNATOR_OPFOR"]};
												case independent	:{["UAV_INDEPENDENT","RADIO_LARGE_INDEPENDENT","DESIGNATOR_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;		
											_classEquipment
										  };
	case "HEAVY_GUNNER"				: { private _classEquipment = ["BASE","PDW","LMG","RIFLEMAN","MARKSMAN","BACKPACK"];
											_classEquipment
										  };
	case "SOLDIER"						: { private _classEquipment = ["BASE","PDW","RIFLEMAN","BACKPACK","UGL","MINES"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 				:{["TRIPOD_BACKPACK_BLUFOR","DISMANTLED_WEAPON_BACKPACK_BLUFOR","RADIO_LARGE_BLUFOR"]};
												case EAST					:{["TRIPOD_BACKPACK_OPFOR","DISMANTLED_WEAPON_BACKPACK_OPFOR","RADIO_LARGE_OPFOR"]};
												case independent	:{["TRIPOD_BACKPACK_INDEPENDENT","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT""RADIO_LARGE_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "CREWMAN"						: { private _classEquipment = ["BASE","PDW","CREWMAN","TOOLKIT","VEHICLE_AMMO"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 				:{["TRIPOD_BACKPACK_BLUFOR","UNIFORM_CREWMAN_BLUFOR","LOGISTIC_BLUFOR"]};
												case EAST					:{["TRIPOD_BACKPACK_OPFOR","UNIFORM_CREWMAN_OPFOR","LOGISTIC_OPFOR"]};
												case independent	:{["TRIPOD_BACKPACK_INDEPENDENT","UNIFORM_CREWMAN_INDEPENDENT","LOGISTIC_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "LOGISTIC_ENGINEER"	: { private _classEquipment = ["BASE","PDW","RIFLEMAN","BACKPACK","MINES","TOOLKIT","REPAIR","VEHICLE_AMMO"];											
											private _sideEquipment = switch(side _unit) do{
												case WEST 				:{["UAV_BLUFOR","LOGISTIC_BLUFOR"]};
												case EAST					:{["UAV_OPFOR","LOGISTIC_OPFOR"]};
												case independent	:{["UAV_INDEPENDENT","LOGISTIC_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
											};
	default { throw " invalid PerkClassName" };
};

[_unit,_perkClass + _radio_and_uniform] call smm_fnc_addPerk;
_perkClass