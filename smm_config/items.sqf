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
		["CfgWeapons","arifle_TRG20_F","RIFLEMAN",300,true] call PurchasableItem_create,
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
		["CfgWeapons","SMG_01_F","PDW",199,true] call PurchasableItem_create,
		["CfgWeapons","SMG_02_F","PDW",189,false] call PurchasableItem_create,
		["CfgWeapons","SMG_05_F","PDW",300,false] call PurchasableItem_create,

		//missile launchers
		["CfgWeapons","launch_RPG7_F","ANTI_TANK",300,true] call PurchasableItem_create,
		["CfgWeapons","launch_NLAW_F","ANTI_TANK",550,false] call PurchasableItem_create,
		["CfgWeapons","launch_RPG32_F","ANTI_TANK",450,false] call PurchasableItem_create,
		["CfgWeapons","launch_B_Titan_short_F","ANTI_TANK",950,false] call PurchasableItem_create,
		["CfgWeapons","launch_B_Titan_F","ANTI_AIR",850,false] call PurchasableItem_create
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

	["CfgMagazines","30Rnd_65x39_caseless_green","BASE",15,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_65x39_caseless_green_mag_Tracer","BASE",17,true] call PurchasableItem_create,

	["CfgMagazines","30Rnd_580x42_Mag_F","BASE",15,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_580x42_Mag_Tracer_F","BASE",17,true] call PurchasableItem_create,

	["CfgMagazines","30Rnd_545x39_Mag_F","BASE",15,true] call PurchasableItem_create,
	["CfgMagazines","30Rnd_545x39_Mag_Green_F","BASE",17,true] call PurchasableItem_create,

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


	["CfgMagazines","3Rnd_HE_Grenade_shell","UGL",15,true] call PurchasableItem_create,
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

	// smoke grenades
	["CfgMagazines","SmokeShell","RIFLEMAN",12,true] call PurchasableItem_create,
	["CfgMagazines","SmokeShellBlue","RIFLEMAN",24,false] call PurchasableItem_create,
	["CfgMagazines","SmokeShellGreen","RIFLEMAN",24,false] call PurchasableItem_create,
	["CfgMagazines","SmokeShellOrange","RIFLEMAN",24,false] call PurchasableItem_create,
	["CfgMagazines","SmokeShellPurple","RIFLEMAN",24,false] call PurchasableItem_create,
	["CfgMagazines","SmokeShellRed","RIFLEMAN",24,false] call PurchasableItem_create,
	["CfgMagazines","SmokeShellYellow","RIFLEMAN",24,false] call PurchasableItem_create,
	
	// IR grenades
	["CfgMagazines","B_IR_Grenade","EQUIPMENT_BLUFOR",10,false] call PurchasableItem_create,
	["CfgMagazines","I_IR_Grenade","EQUIPMENT_INDEPENDENT",10,false] call PurchasableItem_create,
	["CfgMagazines","O_IR_Grenade","EQUIPMENT_OPFOR",10,false] call PurchasableItem_create
];

// Uniforms
allItems append [

	// Blufor
	["CfgWeapons","U_B_CombatUniform_mcam","UNIFORM_BLUFOR",30,true] call PurchasableItem_create,
	["CfgWeapons","U_B_CombatUniform_mcam_tshirt","UNIFORM_BLUFOR",30,true] call PurchasableItem_create,
	["CfgWeapons","U_B_CombatUniform_mcam_vest","UNIFORM_BLUFOR",30,true] call PurchasableItem_create,

	["CfgWeapons","U_B_CTRG_1","UNIFORM_BLUFOR",50,false] call PurchasableItem_create,
	["CfgWeapons","U_B_CTRG_2","UNIFORM_BLUFOR",50,false] call PurchasableItem_create,
	["CfgWeapons","U_B_CTRG_3","UNIFORM_BLUFOR",50,false] call PurchasableItem_create,	
	["CfgWeapons","U_B_CTRG_Soldier_urb_1_F","UNIFORM_BLUFOR",50,false] call PurchasableItem_create,
	["CfgWeapons","U_B_CTRG_Soldier_urb_2_F","UNIFORM_BLUFOR",50,false] call PurchasableItem_create,
	["CfgWeapons","U_B_CTRG_Soldier_urb_3_F","UNIFORM_BLUFOR",50,false] call PurchasableItem_create,	
	["CfgWeapons","U_B_CTRG_Soldier_F","UNIFORM_BLUFOR",50,false] call PurchasableItem_create,
	["CfgWeapons","U_B_CTRG_Soldier_2_F","UNIFORM_BLUFOR",50,false] call PurchasableItem_create,
	["CfgWeapons","U_B_CTRG_Soldier_3_F","UNIFORM_BLUFOR",50,false] call PurchasableItem_create,	

	["CfgWeapons","U_B_T_Soldier_F","UNIFORM_BLUFOR",80,false] call PurchasableItem_create,	
	["CfgWeapons","U_B_T_Soldier_AR_F","UNIFORM_BLUFOR",80,false] call PurchasableItem_create,
	["CfgWeapons","U_B_T_Soldier_SL_F","UNIFORM_BLUFOR",80,false] call PurchasableItem_create,

	["CfgWeapons","U_B_Wetsuit","UNIFORM_BLUFOR",320,false] call PurchasableItem_create,	

	// Blufor Sniper Uniform
	["CfgWeapons","U_B_T_Sniper_F","UNIFORM_SNIPER_BLUFOR",100,true] call PurchasableItem_create,
	["CfgWeapons","U_B_GhillieSuit","UNIFORM_SNIPER_BLUFOR",100,true] call PurchasableItem_create,	
	["CfgWeapons","U_B_FullGhillie_lsh","UNIFORM_SNIPER_BLUFOR",130,false] call PurchasableItem_create,
	["CfgWeapons","U_B_FullGhillie_sard","UNIFORM_SNIPER_BLUFOR",130,false] call PurchasableItem_create,
	["CfgWeapons","U_B_FullGhillie_ard","UNIFORM_SNIPER_BLUFOR",130,false] call PurchasableItem_create,
	["CfgWeapons","U_B_T_FullGhillie_tna_F","UNIFORM_SNIPER_BLUFOR",130,false] call PurchasableItem_create,
	

	// Bluefor Crew Uniform
	["CfgWeapons","U_B_HeliPilotCoveralls","UNIFORM_CREWMAN_BLUFOR",50,true] call PurchasableItem_create,
	["CfgWeapons","U_B_PilotCoveralls","UNIFORM_CREWMAN_BLUFOR",1000,true] call PurchasableItem_create,


	// Opfor

	["CfgWeapons","U_O_CombatUniform_ocamo","UNIFORM_OPFOR",30,true] call PurchasableItem_create,
	["CfgWeapons","U_O_CombatUniform_oucamo","UNIFORM_OPFOR",30,true] call PurchasableItem_create,
	
	["CfgWeapons","U_O_SpecopsUniform_ocamo","UNIFORM_OPFOR",30,false] call PurchasableItem_create,
	["CfgWeapons","U_O_SpecopsUniform_blk","UNIFORM_OPFOR",30,false] call PurchasableItem_create,

	["CfgWeapons","U_O_OfficerUniform_ocamo","UNIFORM_OPFOR",199,false] call PurchasableItem_create,
	["CfgWeapons","U_O_T_Officer_F","UNIFORM_OPFOR",199,false] call PurchasableItem_create,

	["CfgWeapons","U_O_V_Soldier_Viper_F","UNIFORM_OPFOR",90,false] call PurchasableItem_create,
	["CfgWeapons","U_O_V_Soldier_Viper_hex_F","UNIFORM_OPFOR",80,false] call PurchasableItem_create,

	["CfgWeapons","U_O_Wetsuit","UNIFORM_OPFOR",320,false] call PurchasableItem_create,

	// Opfor Sniper Uniform
	["CfgWeapons","U_O_T_Sniper_F","UNIFORM_SNIPER_OPFOR",100,true] call PurchasableItem_create,
	["CfgWeapons","U_O_GhillieSuit","UNIFORM_SNIPER_OPFOR",100,true] call PurchasableItem_create,	
	["CfgWeapons","U_O_FullGhillie_lsh","UNIFORM_SNIPER_OPFOR",130,false] call PurchasableItem_create,
	["CfgWeapons","U_O_FullGhillie_sard","UNIFORM_SNIPER_OPFOR",130,false] call PurchasableItem_create,
	["CfgWeapons","U_O_FullGhillie_ard","UNIFORM_SNIPER_OPFOR",130,false] call PurchasableItem_create,
	["CfgWeapons","U_O_T_FullGhillie_tna_F","UNIFORM_SNIPER_OPFOR",130,false] call PurchasableItem_create,

	// Opfor Crew Uniform
	["CfgWeapons","U_O_PilotCoveralls","UNIFORM_CREWMAN_OPFOR",1000,true] call PurchasableItem_create,


	// Independent
	["CfgWeapons","U_I_CombatUniform","UNIFORM_INDEPENDENT",30,true] call PurchasableItem_create,
	["CfgWeapons","U_I_CombatUniform_shortsleeve","UNIFORM_INDEPENDENT",30,true] call PurchasableItem_create,

	["CfgWeapons","U_I_OfficerUniform","UNIFORM_INDEPENDENT",199,false] call PurchasableItem_create,

	["CfgWeapons","U_I_Wetsuit","UNIFORM_INDEPENDENT",320,false] call PurchasableItem_create,

	// Independent Sniper Uniform
	["CfgWeapons","U_I_GhillieSuit","UNIFORM_SNIPER_INDEPENDENT",100,true] call PurchasableItem_create,	
	["CfgWeapons","U_I_FullGhillie_lsh","UNIFORM_SNIPER_INDEPENDENT",130,false] call PurchasableItem_create,
	["CfgWeapons","U_I_FullGhillie_ard","UNIFORM_SNIPER_INDEPENDENT",130,false] call PurchasableItem_create,
	["CfgWeapons","U_I_FullGhillie_sard","UNIFORM_SNIPER_INDEPENDENT",130,false] call PurchasableItem_create,
	
	// Independent Crew Uniform
	["CfgWeapons","U_B_HeliPilotCoveralls","UNIFORM_CREWMAN_INDEPENDENT",50,true] call PurchasableItem_create,
	["CfgWeapons","U_B_PilotCoveralls","UNIFORM_CREWMAN_INDEPENDENT",1000,true] call PurchasableItem_create

];


// Vests

	// Rebreather Vests :
		allItems append[
		// Blufor
			["CfgWeapons","V_RebreatherB","UNIFORM_BLUFOR",300,false] call PurchasableItem_create,
		// Opfor
			["CfgWeapons","V_RebreatherIR","UNIFORM_OPFOR",300,false] call PurchasableItem_create,
		// Independent
			["CfgWeapons","V_RebreatherIA","UNIFORM_INDEPENDENT",300,false] call PurchasableItem_create
		];

	// Lite Vests:

		// Neutral
			// vest "slash Bandollier"
				{allItems append[["CfgWeapons",_x,"BASE",20,true] call PurchasableItem_create];}forEach
				["V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_BandollierB_oli","V_BandollierB_ghex_F"];
			// vest "Chest Rig"
				{allItems append[["CfgWeapons",_x,"BASE",40,false] call PurchasableItem_create];}forEach
				["V_Chestrig_khk","V_Chestrig_rgr","V_Chestrig_blk","V_Chestrig_oli"];
			// vest "Tactical Chest Rig"
				{allItems append[["CfgWeapons",_x,"BASE",40,false] call PurchasableItem_create];}forEach
				["V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_TacChestrig_cbr_F"];
			// vest "Tactical Vest"
				{allItems append[["CfgWeapons",_x,"BASE",60,false] call PurchasableItem_create];}forEach
				["V_TacVest_khk","V_TacVest_brn","V_TacVest_oli","V_TacVest_blk","V_TacVest_camo","V_I_G_resistanceLeader_F"];
			// vest "Multi-Pocket-Vest"
				{allItems append[["CfgWeapons",_x,"BASE",10,true] call PurchasableItem_create];}forEach
				["V_Pocketed_olive_F","V_Pocketed_coyote_F","V_Pocketed_black_F"];
			// vest "Leg Strap Bag"
				{allItems append[["CfgWeapons",_x,"BASE",15,true] call PurchasableItem_create];}forEach
				["V_LegStrapBag_black_F","V_LegStrapBag_coyote_F","V_LegStrapBag_olive_F"];
			// vest "EOD Vest"
				{allItems append[["CfgWeapons",_x,"BASE",100,false] call PurchasableItem_create];}forEach
				["V_EOD_blue_F","V_EOD_olive_F","V_EOD_coyote_F"];
			// vest "Carrier Lite"
				{allItems append[["CfgWeapons",_x,"BASE",150,false] call PurchasableItem_create];}forEach
				["V_PlateCarrier1_blk","V_PlateCarrier1_rgr_noflag_F"];

		// Blufor
			// vest "Carrier Lite"
			{allItems append[["CfgWeapons",_x,"UNIFORM_BLUFOR",150,false] call PurchasableItem_create];}forEach
			["V_PlateCarrier1_tna_F","V_PlateCarrier1_rgr"];

		// Opfor

		// Independent

	// Heavy Vests:
		
		// Neutral
			allItems append[
				["CfgWeapons","V_Rangemaster_belt","BASE",5,true] call PurchasableItem_create,
				["CfgWeapons","V_TacVestIR_blk","BASE",70,false] call PurchasableItem_create
			];
			//vest "Carrier Rig"
			{allItems append[["CfgWeapons",_x,"BASE",180,false] call PurchasableItem_create];}forEach
			["V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_blk"];
	
		// Blufor
			allItems append[
				["CfgWeapons","V_PlateCarrierL_CTRG","UNIFORM_BLUFOR",150,false] call PurchasableItem_create,
				["CfgWeapons","V_PlateCarrierH_CTRG","UNIFORM_BLUFOR",160,false] call PurchasableItem_create
			];
			// vest "Carrier GL Rig"
			{allItems append[["CfgWeapons",_x,"UNIFORM_BLUFOR",160,false] call PurchasableItem_create];}forEach
			["V_PlateCarrierGL_rgr","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp","V_PlateCarrierGL_tna_F"];
			// vest "Carrier Rig"
			{allItems append[["CfgWeapons",_x,"UNIFORM_BLUFOR",140,false] call PurchasableItem_create];}forEach
			["V_PlateCarrier2_rgr","V_PlateCarrier2_tna_F"];
			// vest "Carrier Special Rig"
			{allItems append[["CfgWeapons",_x,"UNIFORM_BLUFOR",200,false] call PurchasableItem_create];}forEach
			["V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_mtp","V_PlateCarrierSpec_tna_F"];

		// Opfor
			// vest "LBV Grenadier Harness"
			{allItems append[["CfgWeapons",_x,"UNIFORM_OPFOR",30,false] call PurchasableItem_create];}forEach
			["V_HarnessOGL_brn","V_HarnessOGL_gry","V_HarnessOGL_ghex_F"];
			// vest "LBV Harness"
			{allItems append[["CfgWeapons",_x,"UNIFORM_OPFOR",40,false] call PurchasableItem_create];}forEach
			["V_HarnessO_brn","V_HarnessO_gry","V_HarnessO_ghex_F"];

		// Independent
			allItems append[
				["CfgWeapons","V_PlateCarrierIA1_dgtl","UNIFORM_INDEPENDENT",100,false] call PurchasableItem_create,
				["CfgWeapons","V_PlateCarrierIA2_dgtl","UNIFORM_INDEPENDENT",120,false] call PurchasableItem_create
			];
			// vest "GA Carrier GL Rig"
			{allItems append[["CfgWeapons",_x,"UNIFORM_INDEPENDENT",150,false] call PurchasableItem_create];}forEach[
			"V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli"];
//

//	Helmets
	// Basic Helmets:
		// Neutral 
			{
				allItems pushBack (["CfgWeapons",_x,"BASE",round (_forEachIndex random 10)+30,false] call PurchasableItem_create);
			}forEach[
				"H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_mcamo","H_Booniehat_tan","H_Booniehat_khk_hs","H_Booniehat_tna_F",
				"H_Cap_red","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_grn","H_Cap_oli_hs",
				"H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_camo","H_Bandanna_mcamo","H_Shemag_olive",
				"H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan",
				"H_Beret_blk",
				"H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo",
				"H_MilCap_tna_F","H_MilCap_ghex_F","H_MilCap_ocamo","H_MilCap_mcamo","H_MilCap_gry","H_MilCap_blue",
				"H_PASGT_basic_blue_F","H_PASGT_basic_white_F","H_PASGT_basic_olive_F","H_PASGT_basic_black_F"
				];

		// Blufor
			{allItems append[["CfgWeapons",_x,"UNIFORM_BLUFOR",10,false] call PurchasableItem_create];}forEach
			["H_Cap_khaki_specops_UK","H_Cap_tan_specops_US","H_Cap_usblack"];
			{allItems append[["CfgWeapons",_x,"UNIFORM_BLUFOR",100,false] call PurchasableItem_create];}forEach
			["H_Beret_02","H_Beret_Colonel"];
			
		
		// Opfor
			{allItems append[["CfgWeapons",_x,"UNIFORM_OPFOR",10,false] call PurchasableItem_create];}forEach
			["H_Cap_brn_SPECOPS"];

		// Independent
			{allItems append[["CfgWeapons",_x,"UNIFORM_INDEPENDENT",round (_forEachIndex random 10)+30,false] call PurchasableItem_create];}forEach
			["H_Booniehat_dgtl","H_MilCap_dgtl","H_Cap_blk_Raven"];
					
	// Combat Helmets:

		// Neutral

		// Blufor
		allItems append[
		["CfgWeapons","H_HelmetB_TI_tna_F","UNIFORM_BLUFOR",100,false] call PurchasableItem_create,
		["CfgWeapons","H_HelmetCrew_B","UNIFORM_CREWMAN_BLUFOR",40,false] call PurchasableItem_create,
		["CfgWeapons","H_CrewHelmetHeli_B","UNIFORM_CREWMAN_BLUFOR",30,false] call PurchasableItem_create,
		["CfgWeapons","H_PilotHelmetFighter_B","UNIFORM_CREWMAN_BLUFOR",100,false] call PurchasableItem_create,
		["CfgWeapons","H_PilotHelmetHeli_B","UNIFORM_CREWMAN_BLUFOR",30,false] call PurchasableItem_create
		];
		{allItems append[["CfgWeapons",_x,"UNIFORM_BLUFOR",50,false] call PurchasableItem_create];}forEach
		["H_HelmetB","H_HelmetB_camo","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_black","H_HelmetB_sand","H_HelmetB_tna_F"];		
		{allItems append[["CfgWeapons",_x,"UNIFORM_BLUFOR",80,false] call PurchasableItem_create];}forEach
		["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin","H_HelmetSpecB_sand","H_HelmetB_Enh_tna_F"];	
		{allItems append[["CfgWeapons",_x,"UNIFORM_BLUFOR",40,false] call PurchasableItem_create];}forEach
		["H_HelmetB_light","H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand","H_HelmetB_Light_tna_F"];	

		// Opfor
		allItems append[
		["CfgWeapons","H_HelmetCrew_O","UNIFORM_CREWMAN_OPFOR",40,false] call PurchasableItem_create,
		["CfgWeapons","H_HelmetCrew_O_ghex_F","UNIFORM_CREWMAN_OPFOR",40,false] call PurchasableItem_create,
		["CfgWeapons","H_CrewHelmetHeli_O","UNIFORM_CREWMAN_OPFOR",30,false] call PurchasableItem_create,
		["CfgWeapons","H_PilotHelmetFighter_O","UNIFORM_CREWMAN_OPFOR",100,false] call PurchasableItem_create,
		["CfgWeapons","H_PilotHelmetHeli_O","UNIFORM_CREWMAN_OPFOR",30,false] call PurchasableItem_create		
		];

		{allItems append[["CfgWeapons",_x,"UNIFORM_OPFOR",60,false] call PurchasableItem_create];}forEach
		["H_HelmetSpecO_ocamo","H_HelmetSpecO_blk","H_HelmetSpecO_ghex_F"];	
		{allItems append[["CfgWeapons",_x,"UNIFORM_OPFOR",100,false] call PurchasableItem_create];}forEach
		["H_HelmetLeaderO_oucamo","H_HelmetLeaderO_ocamo","H_HelmetLeaderO_ghex_F"];	
		{allItems append[["CfgWeapons",_x,"UNIFORM_OPFOR",80,false] call PurchasableItem_create];}forEach
		["H_HelmetO_ocamo","H_HelmetO_oucamo","H_HelmetO_ghex_F"];
		{allItems append[["CfgWeapons",_x,"UNIFORM_OPFOR",250,false] call PurchasableItem_create];}forEach
		["H_HelmetO_ViperSP_hex_F","H_HelmetO_ViperSP_ghex_F"];

		// Independent
		allItems append[
		["CfgWeapons","H_HelmetCrew_I","UNIFORM_CREWMAN_INDEPENDENT",40,false] call PurchasableItem_create,
		["CfgWeapons","H_CrewHelmetHeli_I","UNIFORM_CREWMAN_INDEPENDENT",30,false] call PurchasableItem_create,
		["CfgWeapons","H_PilotHelmetFighter_I","UNIFORM_CREWMAN_INDEPENDENT",100,false] call PurchasableItem_create,
		["CfgWeapons","H_PilotHelmetHeli_I","UNIFORM_CREWMAN_INDEPENDENT",30,false] call PurchasableItem_create,
		["CfgWeapons","H_HelmetIA","UNIFORM_INDEPENDENT",10,false] call PurchasableItem_create	
		];
//

// very basic equipment

//Backpacks
if(!smm_rhs)then{
	allItems pushBack  (["CfgVehicles","B_Parachute","BASE",500,false] call PurchasableItem_create);

	{
		allItems pushBack (["CfgVehicles",_x,"BASE",280,true] call PurchasableItem_create);
	}forEach ["B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_mcamo","B_AssaultPack_ocamo"];

	{
		allItems pushBack (["CfgVehicles",_x,"BACKPACK",550,false] call PurchasableItem_create);
	}forEach ["B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_cbr"];

	{
		allItems pushBack (["CfgVehicles",_x,"BACKPACK",460,false] call PurchasableItem_create);
	}forEach ["B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli"];

	{
		allItems pushBack (["CfgVehicles",_x,"BACKPACK",370,false] call PurchasableItem_create);
	}forEach ["B_FieldPack_khk","B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_blk","B_Carryall_ocamo"];

	{
		allItems pushBack (["CfgVehicles",_x,"BACKPACK",640,false] call PurchasableItem_create);
	}forEach ["B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_khk","B_Carryall_oli","B_Carryall_cbr"];

	{
		allItems pushBack (["CfgVehicles",_x,"BACKPACK",1000,false] call PurchasableItem_create);
	}forEach ["B_Bergen_mcamo_F","B_Bergen_dgtl_F","B_Bergen_hex_F","B_Bergen_tna_F"];

	{
		allItems pushBack (["CfgVehicles",_x,"BACKPACK",600,false] call PurchasableItem_create);
	}forEach ["B_ViperHarness_blk_F","B_ViperHarness_ghex_F","B_ViperHarness_hex_F","B_ViperHarness_khk_F","B_ViperHarness_oli_F"];

	{
		allItems pushBack (["CfgVehicles",_x,"BACKPACK",510,false] call PurchasableItem_create);
	}forEach ["B_ViperLightHarness_blk_F","B_ViperLightHarness_ghex_F","B_ViperLightHarness_hex_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_oli_F"];
};

// Static Weapons Backpack 

	// Tripods backpacks

		// Blufor
		allItems append[
		["CfgVehicles","B_Mortar_01_support_F","TRIPOD_BACKPACK_BLUFOR",100,true] call PurchasableItem_create,
		["CfgVehicles","B_HMG_01_support_F","TRIPOD_BACKPACK_BLUFOR",100,true] call PurchasableItem_create,
		["CfgVehicles","B_HMG_01_support_high_F","TRIPOD_BACKPACK_BLUFOR",100,true] call PurchasableItem_create
		];

		// Opfor
		allItems append[
		["CfgVehicles","O_Mortar_01_support_F","TRIPOD_BACKPACK_OPFOR",100,true] call PurchasableItem_create,
		["CfgVehicles","O_HMG_01_support_F","TRIPOD_BACKPACK_OPFOR",100,true] call PurchasableItem_create,
		["CfgVehicles","O_HMG_01_support_high_F","TRIPOD_BACKPACK_OPFOR",100,true] call PurchasableItem_create
		];

		// Independent
		allItems append[
		["CfgVehicles","I_Mortar_01_support_F","TRIPOD_BACKPACK_INDEPENDENT",100,true] call PurchasableItem_create,
		["CfgVehicles","I_HMG_01_support_F","TRIPOD_BACKPACK_INDEPENDENT",100,true] call PurchasableItem_create,
		["CfgVehicles","I_HMG_01_support_high_F","TRIPOD_BACKPACK_INDEPENDENT",100,true] call PurchasableItem_create
		];

	// Dismantled Wapons backpacks
		// Blufor
		allItems append[
		["CfgVehicles","B_HMG_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_BLUFOR",1000,true] call PurchasableItem_create,
		//["CfgVehicles","B_HMG_01_A_weapon_F","DISMANTLED_WEAPON_BACKPACK_BLUFOR",100,true] call PurchasableItem_create,
		["CfgVehicles","B_GMG_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_BLUFOR",2000,false] call PurchasableItem_create,
		//["CfgVehicles","B_GMG_01_A_weapon_F","DISMANTLED_WEAPON_BACKPACK_BLUFOR",100,true] call PurchasableItem_create,
		["CfgVehicles","B_HMG_01_high_weapon_F","DISMANTLED_WEAPON_BACKPACK_BLUFOR",1000,false] call PurchasableItem_create,
		["CfgVehicles","B_GMG_01_high_weapon_F","DISMANTLED_WEAPON_BACKPACK_BLUFOR",2000,false] call PurchasableItem_create,
		["CfgVehicles","B_Mortar_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_BLUFOR",500,false] call PurchasableItem_create,
		["CfgVehicles","B_AA_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_BLUFOR",650,false] call PurchasableItem_create,
		["CfgVehicles","B_AT_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_BLUFOR",750,false] call PurchasableItem_create
		]; 

		// Opfor
		allItems append[
		["CfgVehicles","O_HMG_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_OPFOR",1000,true] call PurchasableItem_create,
		//["CfgVehicles","O_HMG_01_A_weapon_F","DISMANTLED_WEAPON_BACKPACK_OPFOR",100,true] call PurchasableItem_create,
		["CfgVehicles","O_GMG_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_OPFOR",2000,false] call PurchasableItem_create,
		//["CfgVehicles","O_GMG_01_A_weapon_F","DISMANTLED_WEAPON_BACKPACK_OPFOR",100,true] call PurchasableItem_create,
		["CfgVehicles","O_HMG_01_high_weapon_F","DISMANTLED_WEAPON_BACKPACK_OPFOR",1000,false] call PurchasableItem_create,
		["CfgVehicles","O_GMG_01_high_weapon_F","DISMANTLED_WEAPON_BACKPACK_OPFOR",200,false] call PurchasableItem_create,
		["CfgVehicles","O_Mortar_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_OPFOR",100,false] call PurchasableItem_create,
		["CfgVehicles","O_AA_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_OPFOR",650,false] call PurchasableItem_create,
		["CfgVehicles","O_AT_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_OPFOR",750,false] call PurchasableItem_create
		]; 

		// Independent
		allItems append[
		["CfgVehicles","I_HMG_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT",1000,true] call PurchasableItem_create,
		//["CfgVehicles","I_HMG_01_A_weapon_F","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT",100,true] call PurchasableItem_create,
		["CfgVehicles","I_GMG_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT",1000,false] call PurchasableItem_create,
		//["CfgVehicles","I_GMG_01_A_weapon_F","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT",100,true] call PurchasableItem_create,
		["CfgVehicles","I_HMG_01_high_weapon_F","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT",1000,false] call PurchasableItem_create,
		["CfgVehicles","I_GMG_01_high_weapon_F","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT",2000,false] call PurchasableItem_create,
		["CfgVehicles","I_Mortar_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT",500,false] call PurchasableItem_create,
		["CfgVehicles","I_AA_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT",650,false] call PurchasableItem_create,
		["CfgVehicles","I_AT_01_weapon_F","DISMANTLED_WEAPON_BACKPACK_INDEPENDENT",750,false] call PurchasableItem_create
		]; 
	
	// Dismantled Laser Designator

		allItems append [
		["CfgVehicles","B_Static_Designator_01_weapon_F","DESIGNATOR_BLUFOR",300,true] call PurchasableItem_create,
		["CfgVehicles","O_Static_Designator_02_weapon_F","DESIGNATOR_OPFOR",300,true] call PurchasableItem_create 
		];

//misc items
allItems append[
	["CfgWeapons","ItemWatch","BASE",5,true] call PurchasableItem_create,
	["CfgWeapons","ItemCompass","BASE",3,true] call PurchasableItem_create,
	["CfgWeapons","ItemGPS","BASE",100,true] call PurchasableItem_create,
	["CfgWeapons","ItemMap","BASE",1,true] call PurchasableItem_create,
	["CfgWeapons","Binocular","BASE",80,false] call PurchasableItem_create,
	["CfgWeapons","ToolKit","TOOLKIT",400,true] call PurchasableItem_create,

	["CfgWeapons","Rangefinder","SPOTTER_EQUIPMENT",300,false] call PurchasableItem_create,
	["CfgWeapons","Laserdesignator","DESIGNATOR_BLUFOR",400,true] call PurchasableItem_create,
	["CfgWeapons","Laserdesignator_02","DESIGNATOR_OPFOR",400,true] call PurchasableItem_create,
	["CfgWeapons","Laserdesignator_03","DESIGNATOR_INDEPENDENT",400,true] call PurchasableItem_create,

	["CfgWeapons","NVGoggles","BASE",400,false] call PurchasableItem_create,
	["CfgWeapons","NVGoggles_OPFOR","BASE",400,false] call PurchasableItem_create,
	["CfgWeapons","NVGoggles_INDEP","BASE",400,false] call PurchasableItem_create
	
];

if(!smm_ace)then{
	allItems append [
		["CfgWeapons","FirstAidKit","BASE",40,true] call PurchasableItem_create, 
		["CfgWeapons","Medikit","MEDIC",500,true] call PurchasableItem_create,	
		["CfgWeapons","MineDetector","MINES",400,false] call PurchasableItem_create	
	];
};

if(!smm_tfar)then{
	allItems pushBack (["CfgWeapons","ItemRadio","BASE",10,true] call PurchasableItem_create);
};


// add silencers for random but deterministic price (index as seed)
{
		allItems pushBack (["CfgWeapons",_x,"BASE",round (_forEachIndex random 150) + 250,false] call PurchasableItem_create);
}forEach [
		"muzzle_snds_H",
		"muzzle_snds_L",
		"muzzle_snds_M",
		"muzzle_snds_B",
		"muzzle_snds_acp",
		"muzzle_snds_338_black",
		"muzzle_snds_338_green",
		"muzzle_snds_338_sand",
		"muzzle_snds_93mmg",
		"muzzle_snds_93mmg_tan",
		"muzzle_snds_H_khk_F",
		"muzzle_snds_H_snd_F",
		"muzzle_snds_m_khk_F",
		"muzzle_snds_m_snd_F",
		"muzzle_snds_58_blk_F",
		"muzzle_snds_58_ghex_F",
		"muzzle_snds_58_hex_F",
		"muzzle_snds_B_khk_F",
		"muzzle_snds_B_snd_F",
		"muzzle_snds_65_TI_blk_F",
		"muzzle_snds_65_TI_hex_F",
		"muzzle_snds_65_TI_ghex_F"];

//add simple holosights and ir/flashlight for random but deterministic price
{
		allItems pushBack (["CfgWeapons",_x,"BASE",round (_forEachIndex random 50) + 50,false] call PurchasableItem_create);
}forEach [
		"optic_MRD",
		"optic_Yorris",
		"optic_Aco",
		"optic_ACO_grn",
		"optic_Aco_smg",
		"optic_ACO_grn_smg",
		"optic_Holosight",
		"optic_Holosight_smg",
		"optic_Holosight_blk_F",
		"optic_Holosight_khk_F",
		"optic_Holosight_smg_blk_F",
		"acc_flashlight",
		"acc_pointer_IR"];

//do so for advanced rifleman scopes
{
		allItems pushBack (["CfgWeapons",_x,"RIFLEMAN",round (_forEachIndex random 200)+120,false] call PurchasableItem_create);
}forEach [
		"optic_Arco",
		"optic_Hamr",
		"optic_MRCO",
		"optic_Arco_blk_F",
		"optic_Arco_ghex_F",
		"optic_Hamr_khk_F",
		"optic_ERCO_blk_F",
		"optic_ERCO_khk_F",
		"optic_ERCO_snd_F"];

//and sniper scopes
{
		allItems pushBack (["CfgWeapons",_x,"SCOPE_LR",round (_forEachIndex random 500)+500,false] call PurchasableItem_create);
}forEach[
		"optic_SOS",
		"optic_DMS",
		"optic_LRPS",
		"optic_AMS",
		"optic_AMS_khk",
		"optic_AMS_snd",
		"optic_KHS_blk",
		"optic_KHS_hex",
		"optic_KHS_old",
		"optic_KHS_tan", 
		"optic_DMS_ghex_F",
		"optic_SOS_khk_F",
		"optic_LRPS_tna_F",
		"optic_LRPS_ghex_F"];

//add bipods
{
		allItems pushBack (["CfgWeapons",_x,"BASE",45,false] call PurchasableItem_create);
}forEach [
	"bipod_01_F_snd",
	"bipod_01_F_blk",
	"bipod_01_F_mtp",
	"bipod_02_F_blk",
	"bipod_02_F_tan",
	"bipod_02_F_hex",
	"bipod_03_F_blk",
	"bipod_03_F_oli",
	"bipod_01_F_khk"];

//uav stuff

allItems append [
	["CfgWeapons","B_UavTerminal","UAV_BLUFOR",300,true] call PurchasableItem_create,
	["CfgWeapons","O_UavTerminal","UAV_OPFOR",300,true] call PurchasableItem_create,
	["CfgWeapons","I_UavTerminal","UAV_INDEPENDENT",300,true] call PurchasableItem_create,

	["CfgVehicles","B_UAV_06_backpack_F","UAV_BLUFOR",500,false] call PurchasableItem_create,
	["CfgVehicles","O_UAV_06_backpack_F","UAV_OPFOR",500,false] call PurchasableItem_create,
	["CfgVehicles","I_UAV_06_backpack_F","UAV_INDEPENDENT",500,false] call PurchasableItem_create,

	["CfgVehicles","B_UAV_06_backpack_F","UAV_BLUFOR",600,false] call PurchasableItem_create,
	["CfgVehicles","O_UAV_06_backpack_F","UAV_OPFOR",600,false] call PurchasableItem_create,
	["CfgVehicles","I_UAV_06_backpack_F","UAV_INDEPENDENT",600,false] call PurchasableItem_create,

	["CfgVehicles","B_UAV_01_backpack_F","UAV_BLUFOR",500,false] call PurchasableItem_create,
	["CfgVehicles","O_UAV_01_backpack_F","UAV_OPFOR",500,false] call PurchasableItem_create,
	["CfgVehicles","I_UAV_01_backpack_F","UAV_INDEPENDENT",500,false] call PurchasableItem_create

];