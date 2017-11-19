allItems = [];

smm_tfar = false;
smm_ace = false;
smm_rhs = false;

//load rhs stuff
if(isClass(configfile >> "CfgPatches" >> "rhs_weapons"))then{
	call compile preprocessFileLineNumbers "smm_config\items_rhs.sqf";
	smm_rhs = true;
};

// load ace stuff
if(isClass(configfile >> "CfgPatches" >> "ace_medical"))then{
	call compile preprocessFileLineNumbers "smm_config\items_ace.sqf";
	smm_ace = true;
};

// load tfar stuff
if(isClass(configfile >> "CfgPatches" >>"task_force_radio" ))then{
	call compile preprocessFileLineNumbers "smm_config\items_tfar.sqf";
	smm_tfar = true;
};

if(!smm_rhs)then{
	allItems append[
		//weapons 
		["CfgWeapons","srifle_DMR_01_F","MARKSMAN",900,false] call PurchasableItem_create,
		["CfgWeapons","srifle_EBR_F","MARKSMAN",750,false] call PurchasableItem_create,
		["CfgWeapons","srifle_GM6_F","SNIPER",1750,false] call PurchasableItem_create,
		["CfgWeapons","srifle_LRR_F","SNIPER",1850,false] call PurchasableItem_create,
		["CfgWeapons","LMG_Mk200_F","LMG",890,false] call PurchasableItem_create,
		["CfgWeapons","LMG_Zafir_F","LMG",860,false] call PurchasableItem_create,
		["CfgWeapons","hgun_ACPC2_F","PDW",70,false] call PurchasableItem_create,
		["CfgWeapons","hgun_P07_F","PDW",40,true] call PurchasableItem_create,
		["CfgWeapons","hgun_Pistol_heavy_01_F","PDW",100,false] call PurchasableItem_create,
		["CfgWeapons","hgun_Rook40_F","PDW",30,false] call PurchasableItem_create,
		["CfgWeapons","arifle_Katiba_F","RIFLEMAN",450,false] call PurchasableItem_create,
	];
};
