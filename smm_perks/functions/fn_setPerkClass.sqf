/*
add

[this, (CLASSNAME)] call smm_fnc_setPerkClass;

to Unit Init


_BLUFOR
_OPFOR
_INDEPENDENT

possible classes

Radio Operator

Medic

Anit-Tank/AIR  aka ROCKETMAN

Sniper

Spotter

Machiene gunner

Soldier 

Crewman

Grenadier

Drone Operator

Engineer


	
*/

#include "constants.hpp"
params["_unit","_class"];

_perkClass = switch(_class) do{
	case "RADIO_OPERATOR" 				: { private _classEquipment = ["BASE","PDW","RIFLEMAN"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR",		"RADIO_LARGE_BLUFOR","RADIO_SMALL_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR",			"RADIO_LARGE_OPFOR","RADIO_SMALL_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT",	"RADIO_LARGE_INDEPENDENT","RADIO_SMALL_INDEPENDENT"] };
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "MEDIC"						: { private _classEquipment = ["BASE","PDW","RIFLEMAN","MEDIC","BACKPACK"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "ANTI_TANK_AIR"				: { private _classEquipment = ["BASE","PDW","ANTI_AIR","ANTI_TANK","BACKPACK"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "SNIPER"						: { private _classEquipment = ["BASE","MARKSMAN","SNIPER","SCOPE_LR"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "SPOTTER"						: { private _classEquipment = ["BASE","PDW","SPOTTER_EQUIPMENT","SCOPE_LR"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "MACHINE_GUNNER"				: { private _classEquipment = ["BASE","LMG","BACKPACK"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "SOLDIER"						: { private _classEquipment = ["BASE","RIFLEMAN","BACKPACK"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "CREWMAN"						: { private _classEquipment = ["BASE","PDW","CREWMAN","DISMANTLED_WEAPON_BACKPACK","MINES"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "GRENADIER"					: { private _classEquipment = ["BASE","RIFLEMAN","UGL","BACKPACK","MINES"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "DRONE_OPERATOR"				: { private _classEquipment = ["BASE","PDW"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR",		"UAV_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR",			"UAV_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT",	"UAV_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "ENGINEER"						: { private _classEquipment = ["BASE","PDW","BACKPACK","MINES","REPAIR_SIMPLE","REPAIR_ADVANCED"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_BLUFOR"]};
												case EAST	:{["UNIFORM_OPFOR"]};
												case independent	:{["UNIFORM_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	default { throw " invalid PerkClassName" };
};

[_unit,_perkClass] call smm_fnc_addPerk;
_perkClass