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


private _radio_and_uniform = switch(side _unit)do{
	case west:{["UNIFORM_BLUFOR","RADIO_SMALL_BLUFOR"]};
	case east:{["UNIFORM_OPFOR","RADIO_SMALL_OPFOR"]};
	case independent:{["UNIFORM_INDEPENDENT","RADIO_SMALL_INDEPENDENT"] };
	default { throw " invalid side" };
};

private _perkClass = switch(_class) do{
	case "RADIO_OPERATOR" 				: { private _classEquipment = ["BASE","PDW","RIFLEMAN"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["RADIO_LARGE_BLUFOR"]};
												case EAST	:{["RADIO_LARGE_OPFOR"]};
												case independent	:{["RADIO_LARGE_INDEPENDENT"] };
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "MEDIC"						: { private _classEquipment = ["BASE","PDW","RIFLEMAN","MEDIC","BACKPACK"];
											_classEquipment
										  };
	case "ANTI_TANK_AIR"				: { private _classEquipment = ["BASE","PDW","RIFLEMAN","ANTI_AIR","ANTI_TANK","BACKPACK"];
											_classEquipment
										  };
	case "SNIPER"						: { private _classEquipment = ["BASE","PDW","MARKSMAN","SNIPER","SCOPE_LR"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_SNIPER_BLUFOR"]};
												case EAST	:{["UNIFORM_SNIPER_OPFOR"]};
												case independent	:{["UNIFORM_SNIPER_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	//todo merge with spotter
	case "SPOTTER"						: { private _classEquipment = ["BASE","PDW","RIFLEMAN","SPOTTER_EQUIPMENT","SCOPE_LR"];		
											_classEquipment
										  };
	case "MACHINE_GUNNER"				: { private _classEquipment = ["BASE","PDW","LMG","RIFLEMAN","BACKPACK"];
											_classEquipment
										  };
	case "SOLDIER"						: { private _classEquipment = ["BASE","PDW","RIFLEMAN","BACKPACK"];
											
											_classEquipment
										  };
	case "CREWMAN"						: { private _classEquipment = ["BASE","PDW","CREWMAN","DISMANTLED_WEAPON_BACKPACK","MINES"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UNIFORM_CREWMAN_BLUFOR"]};
												case EAST	:{["UNIFORM_CREWMAN_OPFOR"]};
												case independent	:{["UNIFORM_CREWMAN_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "GRENADIER"					: { private _classEquipment = ["BASE","RIFLEMAN","UGL","PDW","BACKPACK","MINES"];
											_classEquipment
										  };
	//todo merge to spotter									  
	case "DRONE_OPERATOR"				: { private _classEquipment = ["BASE","PDW","RIFLEMAN"];
											private _sideEquipment = switch(side _unit) do{
												case WEST 	:{["UAV_BLUFOR"]};
												case EAST	:{["UAV_OPFOR"]};
												case independent	:{["UAV_INDEPENDENT"]};
												default {[]};
											};
											_classEquipment append _sideEquipment;
											_classEquipment
										  };
	case "ENGINEER"						: { private _classEquipment = ["BASE","PDW","RIFLEMAN","BACKPACK","MINES","REPAIR_SIMPLE","REPAIR_ADVANCED"];
											
											_classEquipment
										  };
	default { throw " invalid PerkClassName" };
};

[_unit,_perkClass + _radio_and_uniform] call smm_fnc_addPerk;
_perkClass