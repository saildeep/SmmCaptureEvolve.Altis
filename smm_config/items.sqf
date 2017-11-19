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
		["CfgWeapons","SMG_02_F","PDW",189,false] call PurchasableItem_create
	];
};

//magazines
allItems append [
	// AR
	["CfgMagazines","30Rnd_556x45_Stanag","BASE",15,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_556x45_Stanag_Tracer_Red","BASE",17,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_556x45_Stanag_Tracer_Green","BASE",17,true] call PurchasableItem_create,
	["CfgMagazines","20Rnd_556x45_UW_mag","BASE",20,true] call PurchasableItem_create,
	
	
	["CfgMagazines","30Rnd_65x39_caseless_mag","BASE",15,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_65x39_caseless_mag_Tracer","BASE",17,true] call PurchasableItem_create,
	
	["CfgMagazines","30Rnd_580x42_Mag_F","BASE",15,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_580x42_Mag_Tracer_F","BASE",17,true] call PurchasableItem_create,

	["CfgMagazines","30Rnd_545x39_Mag_F","BASE",15,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_545x39_Mag_Green_F"","BASE",17,true] call PurchasableItem_create,

	//underbarrel cal.50
	["CfgMagazines","10Rnd_50BW_Mag_F","BASE",40,true] call PurchasableItem_create,


	//DMR
	["CfgMagazines","20Rnd_762x51_Mag","BASE",20,true] call PurchasableItem_create,
	["CfgMagazines","10Rnd_762x51_Mag","BASE",10,true] call PurchasableItem_create,

	["CfgMagazines","10Rnd_762x54_Mag","BASE",10,true] call PurchasableItem_create,

	["CfgMagazines","10Rnd_338_Mag","BASE",15,true] call PurchasableItem_create,

	["CfgMagazines","10Rnd_127x54_Mag","BASE",20,true] call PurchasableItem_create,

	["CfgMagazines","10Rnd_93x64_DMR_05_Mag","BASE",15,true] call PurchasableItem_create,

	["CfgMagazines","20Rnd_650x39_Cased_Mag_F","BASE",30,true] call PurchasableItem_create,

	["CfgMagazines","30Rnd_762x39_Mag_F","BASE",30,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_762x39_Mag_Green_F","BASE",35,true] call PurchasableItem_create,


	//Sniper
	["CfgMagazines","7Rnd_408_Mag","BASE",35,true] call PurchasableItem_create,
	["CfgMagazines","5Rnd_127x108_Mag","BASE",25,true] call PurchasableItem_create,
	["CfgMagazines","5Rnd_127x108_APDS_Mag","BASE",25,true] call PurchasableItem_create,

	//LMG
	["CfgMagazines","100Rnd_65x39_caseless_mag","BASE",50,true] call PurchasableItem_create,
	["CfgMagazines","100Rnd_65x39_caseless_mag_Tracer","BASE",60,true] call PurchasableItem_create,
	["CfgMagazines","200Rnd_65x39_cased_Box","BASE",100,true] call PurchasableItem_create,
	["CfgMagazines","200Rnd_65x39_cased_Box_Tracer","BASE",120,true] call PurchasableItem_create,

	["CfgMagazines","150Rnd_762x51_Box","BASE",100,true] call PurchasableItem_create,
	["CfgMagazines","150Rnd_762x51_Box_Tracer","BASE",120,true] call PurchasableItem_create,

	["CfgMagazines","150Rnd_762x54_Box","BASE",100,true] call PurchasableItem_create,
	["CfgMagazines","150Rnd_762x54_Box_Tracer","BASE",120,true] call PurchasableItem_create,

	["CfgMagazines","130Rnd_338_Mag","BASE",195,true] call PurchasableItem_create,

	["CfgMagazines","150Rnd_93x64_Mag","BASE",225,true] call PurchasableItem_create,

	["CfgMagazines","100Rnd_580x42_Mag_F","BASE",50,true] call PurchasableItem_create,
	["CfgMagazines","100Rnd_580x42_Mag_Tracer_F","BASE",60,true] call PurchasableItem_create,

	["CfgMagazines","150Rnd_556x45_Drum_Mag_F","BASE",75,true] call PurchasableItem_create,
	["CfgMagazines","150Rnd_556x45_Drum_Mag_Tracer_F","BASE",85,true] call PurchasableItem_create,

	["CfgMagazines","200Rnd_556x45_Box_F","BASE",100,true] call PurchasableItem_create,
	["CfgMagazines","200Rnd_556x45_Box_Tracer_F","BASE",120,true] call PurchasableItem_create,

	//Pistol/PDW
	["CfgMagazines","30Rnd_9x21_Mag","BASE",8,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_9x21_Red_Mag","BASE",10,true] call PurchasableItem_create,
	["CfgMagazines","16Rnd_9x21_Mag","BASE",4,true] call PurchasableItem_create,
	["CfgMagazines","16Rnd_9x21_red_Mag","BASE",5,true] call PurchasableItem_create,
	["CfgMagazines","10Rnd_9x21_Mag","BASE",3,true] call PurchasableItem_create,

	["CfgMagazines","30Rnd_9x21_Mag_SMG_02","BASE",8,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_9x21_Mag_SMG_02_Tracer_Red","BASE",10,true] call PurchasableItem_create,

	
	["CfgMagazines","30Rnd_45ACP_Mag_SMG_01","BASE",8,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_45ACP_Mag_SMG_01_Tracer_Red","BASE",10,true] call PurchasableItem_create,
	
	["CfgMagazines","9Rnd_45ACP_Mag","BASE",3,true] call PurchasableItem_create,
	["CfgMagazines","11Rnd_45ACP_Mag","BASE",4,true] call PurchasableItem_create,

	["CfgMagazines","6Rnd_45ACP_Cylinder","BASE",2,true] call PurchasableItem_create,


	//Rockets
	["CfgMagazines","Titan_AA","BASE",200,true] call PurchasableItem_create,
	["CfgMagazines","Titan_AP","BASE",200,true] call PurchasableItem_create,
	["CfgMagazines","Titan_AT","BASE",200,true] call PurchasableItem_create,

	["CfgMagazines","RPG32_F","BASE",70,true] call PurchasableItem_create,
	["CfgMagazines","RPG32_HE_F","BASE",90,true] call PurchasableItem_create,
	["CfgMagazines","NLAW_F","BASE",150,true] call PurchasableItem_create,
	["CfgMagazines","RPG7_F","BASE",30,true] call PurchasableItem_create,


	//UGL
	["CfgMagazines","1Rnd_HE_Grenade_shell","UGL",5,true] call PurchasableItem_create,
	["CfgMagazines","1Rnd_Smoke_Grenade_shell","UGL",2,true] call PurchasableItem_create,
	["CfgMagazines","UGL_FlareWhite_F","UGL",2,true] call PurchasableItem_create,


	["CfgMagazines""3Rnd_HE_Grenade_shell","UGL",15,true] call PurchasableItem_create,
	["CfgMagazines","3Rnd_Smoke_Grenade_shell","UGL",6,true] call PurchasableItem_create,
	["CfgMagazines","3Rnd_UGL_FlareWhite_F","UGL",6,true] call PurchasableItem_create,


	//misc
	["CfgMagazines","Laserbatteries","BASE",20,true] call PurchasableItem_create,

	//mines
	["CfgMagazines","ATMine_Range_Mag","MINES",25,true] call PurchasableItem_create,
	["CfgMagazines","APERSMine_Range_Mag","MINES",20,true] call PurchasableItem_create,
	["CfgMagazines","APERSBoundingMine_Range_Mag","MINES",20,true] call PurchasableItem_create,
	["CfgMagazines","SLAMDirectionalMine_Wire_Mag","MINES",22,true] call PurchasableItem_create,
	["CfgMagazines","APERSTripMine_Wire_Mag","MINES",20,true] call PurchasableItem_create,
	["CfgMagazines","ClaymoreDirectionalMine_Remote_Mag","MINES",20,true] call PurchasableItem_create,
	["CfgMagazines","SatchelCharge_Remote_Mag","MINES",35,true] call PurchasableItem_create,
	["CfgMagazines","DemoCharge_Remote_Mag","MINES",31,true] call PurchasableItem_create,


	
	//grenades 
	["CfgMagazines","HandGrenade","RIFLEMAN",20,true] call PurchasableItem_create,
	["CfgMagazines","MiniGrenade","RIFLEMAN",14,true] call PurchasableItem_create,
	["CfgMagazines","SmokeShell","RIFLEMAN",6,true] call PurchasableItem_create

];