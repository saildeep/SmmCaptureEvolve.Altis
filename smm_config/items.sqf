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
		//weapons 
	allItems append[
	
		//DMR
		["CfgWeapons","srifle_DMR_01_F","MARKSMAN",800,false] call PurchasableItem_create,
		["CfgWeapons","srifle_EBR_F","MARKSMAN",750,false] call PurchasableItem_create,
		["CfgWeapons","srifle_DMR_02_F","MARKSMAN",1150,false] call PurchasableItem_create,
		["CfgWeapons","srifle_DMR_03_F","MARKSMAN",950,false] call PurchasableItem_create,
		["CfgWeapons","srifle_DMR_04_F","MARKSMAN",1200,false] call PurchasableItem_create,
		["CfgWeapons","srifle_DMR_05_tan_f","MARKSMAN",1101,false] call PurchasableItem_create,
		["CfgWeapons","srifle_DMR_06_camo_F","MARKSMAN",899,false] call PurchasableItem_create,
		["CfgWeapons","srifle_DMR_07_blk_F","MARKSMAN",929,false] call PurchasableItem_create,


		//Sniper
		["CfgWeapons","srifle_GM6_F","SNIPER",1750,false] call PurchasableItem_create,
		["CfgWeapons","srifle_LRR_F","SNIPER",1850,false] call PurchasableItem_create,

		//lmg
		["CfgWeapons","LMG_Mk200_F","LMG",890,false] call PurchasableItem_create,
		["CfgWeapons","LMG_Zafir_F","LMG",860,false] call PurchasableItem_create,
		["CfgWeapons","arifle_MX_SW_F","LMG",700,false] call PurchasableItem_create,
		["CfgWeapons","MMG_01_hex_F","LMG",1499,false] call PurchasableItem_create,
		["CfgWeapons","MMG_02_camo_F","LMG",1600,false] call PurchasableItem_create,
		["CfgWeapons","LMG_03_F","LMG",850,false] call PurchasableItem_create,

		//pistols
		["CfgWeapons","hgun_ACPC2_F","PDW",70,false] call PurchasableItem_create,
		["CfgWeapons","hgun_P07_F","PDW",40,true] call PurchasableItem_create,
		["CfgWeapons","hgun_Pistol_heavy_01_F","PDW",100,false] call PurchasableItem_create,
		["CfgWeapons","hgun_Rook40_F","PDW",30,false] call PurchasableItem_create,
		["CfgWeapons","hgun_Pistol_01_F","PDW",60,false] call PurchasableItem_create,

		//assault rifles/UGL
		["CfgWeapons","arifle_Katiba_F","RIFLEMAN",450,false] call PurchasableItem_create,
		["CfgWeapons","arifle_Katiba_C_F","RIFLEMAN",390,false] call PurchasableItem_create,
		["CfgWeapons","arifle_Katiba_GL_F","UGL",540,false] call PurchasableItem_create,

		["CfgWeapons","arifle_Mk20_F","RIFLEMAN",490,false] call PurchasableItem_create,
		["CfgWeapons","arifle_Mk20C_F","RIFLEMAN",410,false] call PurchasableItem_create,
		["CfgWeapons","arifle_Mk20_GL_F","UGL",580,false] call PurchasableItem_create,

		["CfgWeapons","arifle_MX_F","RIFLEMAN",420,false] call PurchasableItem_create,
		["CfgWeapons","arifle_MXC_F","RIFLEMAN",399,false] call PurchasableItem_create,
		["CfgWeapons","arifle_MX_GL_F","UGL",587,false] call PurchasableItem_create,
		["CfgWeapons","arifle_MXM_F","RIFLEMAN",505,false] call PurchasableItem_create,

		["CfgWeapons","arifle_SDAR_F","RIFLEMAN",300,false] call PurchasableItem_create,

		["CfgWeapons","arifle_TRG21_F","RIFLEMAN",330,false] call PurchasableItem_create,
		["CfgWeapons","arifle_TRG20_F","RIFLEMAN",300,false] call PurchasableItem_create,
		["CfgWeapons","arifle_TRG21_GL_F","UGL",380,false] call PurchasableItem_create,

		["CfgWeapons","arifle_AK12_F","RIFLEMAN",320,false] call PurchasableItem_create,
		["CfgWeapons","arifle_AK12_GL_F","UGL",360,false] call PurchasableItem_create,

		["CfgWeapons","arifle_AKM_F","RIFLEMAN",280,false] call PurchasableItem_create,

		["CfgWeapons","arifle_ARX_blk_F","RIFLEMAN",500,false] call PurchasableItem_create,
		["CfgWeapons","arifle_SPAR_01_khk_F","RIFLEMAN",510,false] call PurchasableItem_create,
		["CfgWeapons","arifle_SPAR_01_GL_blk_F","UGL",510,false] call PurchasableItem_create,

		["CfgWeapons","arifle_CTAR_blk_F","RIFLEMAN",450,false] call PurchasableItem_create,
		["CfgWeapons","arifle_CTAR_GL_blk_F","UGL",600,false] call PurchasableItem_create,

		//PDW
		["CfgWeapons","hgun_PDW2000_F","PDW",210,false] call PurchasableItem_create,
		["CfgWeapons","SMG_01_F","PDW",199,false] call PurchasableItem_create,
		["CfgWeapons","SMG_02_F","PDW",189,false] call PurchasableItem_create,
	];
};
