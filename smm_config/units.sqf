//use [uniteast,unitwest,unitindepndent]
// use unit = ["classname",cost]

if(smm_cup)then{
ai_infantry = [
	
		east call macros_mod_units
	   ,west call macros_mod_units
	   ,independent call macros_mod_units
];
}else{
ai_infantry = [
	[
		["O_Soldier_A_F",10],["O_Soldier_AAR_F",10],["O_Soldier_AR_F",15],["O_medic_F",15],["O_crew_F",10],["O_engineer_F",15],["O_soldier_exp_F",15],["O_Soldier_GL_F",10],["O_HeavyGunner_F",15],["O_soldier_M_F",15],["O_Soldier_AA_F",30],["O_Soldier_AT_F",30],["O_SOLDIER_REPAIR_F",15],["O_Urban_SHARPSHOOTER_F",15],["O_SOLDIER_SL_F",10],["O_SoldierU_A_F",10],["O_SoldierU_AAR_F",10],["O_SoldierU_AR_F",15],["O_SOLDIERU_MEDIC_F",15],["O_engineer_U_F",15],["O_soldierU_exp_F",15],["O_SoldierU_GL_F",10],["O_Urban_HeavyGunner_F",15],["O_soldierU_M_F",15],["O_SoldierU_AA_F",30],["O_SoldierU_AT_F",30],
		["O_SOLDIERU_REPAIR_F",15],["O_SHARPSHOOTER_F",15],["O_SOLDIERU_SL_F",10],["O_t_Soldier_A_F",10],["O_t_Soldier_AAR_F",10],["O_T_Soldier_AR_F",15],["O_t_medic_F",15],["O_t_crew_F",10],["O_t_engineer_F",15],["O_t_soldier_exp_F",15],["O_t_Soldier_GL_F",10],["O_t_soldier_M_F",15],["O_t_Soldier_AA_F",30],["O_t_Soldier_AT_F",30],["O_t_SOLDIER_REPAIR_F",15],["O_G_SOLDIER_A_F",10],["O_G_SOLDIER_AR_F",15],["O_G_MEDIC_F",15],["O_G_ENGINEER_F",15],["O_G_SOLDIER_EXP_F",15],["O_G_SOLDIER_GL_F",10],["O_G_SOLDIER_M_F",15],["O_G_SHARPSHOOTER_F",15],["O_G_SOLDIER_SL_F",10]
	],
	[	
		["B_SOLDIER_A_F",10],["B_SOLDIER_AAR_F",10],["B_SOLDIER_AR_F",15],["B_MEDIC_F",15],["B_CREW_F",10],["B_engineer_f",15],["b_soldier_exp_f",15],["b_soldier_gl_f",10],["b_heavygunner_f",15],["b_soldier_m_f",15],["b_soldier_aa_f",30],["b_soldier_at_f",30],["b_soldier_reapair_f",15],["b_sharpshooter_f",15],["b_soldier_sl_f",10],
		["B_G_soldier_a_f",10],["b_g_soldier_ar_f",15],["b_g_medic_f",15],["b_g_engineer_f",15],["b_g_soldier_exp_f",15],["b_g_soldier_gl_f",10],["b_g_soldier_m_f",15],["b_g_sharpshooter_f",15],["b_g_soldier_sl_f",10],
		["b_t_soldier_a_f",10],["B_t_SOLDIER_AAR_F",10],["B_t_SOLDIER_AR_F",15],["b_t_medic_f",15],["B_t_CREW_F",10],["B_t_engineer_f",15],["b_t_soldier_exp_f",15],["b_t_soldier_gl_f",10],["b_t_soldier_m_f",15],["b_t_soldier_aa_f",30],["b_t_soldier_at_f",30],["b_t_soldier_reapair_f",15],["b_t_soldier_sl_f",10]
	],
	[   
		["i_soldier_a_f",10],["i_soldier_aar_f",10],["i_soldier_ar_f",15],["i_medic_f",15],["i_crew_f",10],["i_engineer_f",15],["i_soldier_exp_f",15],["i_soldier_gl_f",10],["i_soldier_m_f",15],["i_soldier_aa_f",30],["i_soldier_at_f",30],["i_soldier_repair_f",30]
    ]
];
};
//removed ,["CUP_B_AW159_Cannon_GB",220],
if(smm_cup)then{
ai_vehicles = [
	[
		["CUP_B_Mi24_D_CDF",280],["CUP_O_BMP1_TKA",250],["CUP_O_LR_SPG9_TKA",170],["CUP_I_T34_NAPA",210],["CUP_O_Ka50_SLA",240],["CUP_B_ZSU23_CDF",300],["CUP_O_Ural_ZU23_RU",170],["CUP_B_UAZ_AGS30_CDF",160],["CUP_B_UAZ_MG_CDF",110],["CUP_O_BMP2_ZU_TKA",270],["CUP_B_T72_CDF",380],["CUP_O_BMP2_TKA",360],["CUP_O_BTR90_RU",280],["CUP_B_BRDM2_CDF",201],["CUP_O_Datsun_PK_Random",100],["CUP_O_BTR60_TK",250]
	],
	[
		["CUP_B_HMMWV_Avenger_USMC",400],["CUP_B_HMMWV_M1114_USMC",350],["CUP_B_HMMWV_TOW_USMC",120],["CUP_B_UH1Y_GUNSHIP_USMC",350],["CUP_B_MH60S_USMC",299],["CUP_B_AH1Z",400],["CUP_B_CH47F_USA",350],["CUP_B_Dingo_CZ_Wdl",300],["CUP_B_Jackal2_L2A1_GB_D",170],["CUP_B_HMMWV_SOV_USA",200],["CUP_I_SUV_Armored_ION",200]],
	[
		["CUP_B_Mi24_D_CDF",280],["CUP_O_BMP1_TKA",250],["CUP_O_LR_SPG9_TKA",170],["CUP_I_T34_NAPA",210],["CUP_O_Ka50_SLA",240],["CUP_B_ZSU23_CDF",300],["CUP_O_Ural_ZU23_RU",170],["CUP_B_UAZ_AGS30_CDF",160],["CUP_B_UAZ_MG_CDF",110],["CUP_O_BMP2_ZU_TKA",270],["CUP_B_T72_CDF",380],["CUP_O_BMP2_TKA",360],["CUP_O_BTR90_RU",280],["CUP_B_BRDM2_CDF",201],["CUP_O_Datsun_PK_Random",100],["CUP_O_BTR60_TK",250]
	]
];
}else{

ai_vehicles = [
	[
		["O_MRAP_02_gmg_F",150],["O_MRAP_02_hmg_F",160],["O_APC_Wheeled_02_rcws_F",220],["O_T_LSV_02_armed_F",120],["O_MBT_02_arty_F",280],["O_APC_Tracked_02_cannon_F",270],["O_APC_Tracked_02_AA_F",320],["O_MBT_02_cannon_F",350],["O_Heli_Attack_02_F",370]
	],
	[
		["B_MRAP_01_gmg_F",150],["B_MRAP_01_hmg_F",160],["B_APC_Wheeled_01_cannon_F",220],["B_T_LSV_01_armed_F",110],["B_APC_Tracked_01_CRV_F",250],["B_APC_Tracked_01_AA_F",300],["B_APC_Tracked_01_rcws_F",240],["B_MBT_01_cannon_F",350],["B_MBT_01_arty_F",300],["B_MBT_01_mlrs_F",280]
	],
	[
		["I_APC_Wheeled_03_cannon_F",230],["I_APC_tracked_03_cannon_F",280],["I_MBT_03_cannon_F",400],["I_G_Offroad_01_armed_F",80],["I_MRAP_03_hmg_F",140],["I_MRAP_03_gmg_F",130]
	]
];
};


civilianBuyableUnits = [
	["B_Boat_Transport_01_F",65],
	["B_Quadbike_01_F",50],
	["C_Boat_Civil_01_F",100],
	["C_Offroad_01_F",140],
	["C_Hatchback_01_sport_F",200],
	["C_SUV_01_F",170],
	["C_Van_01_transport_F",200],
	["C_Van_01_fuel_F",130],
	["C_Kart_01_F",90],
	["C_Heli_Light_01_civil_F",600],
	["C_Plane_Civil_01_racing_F",450]
];

ace_units = [
		["ACE_Wheel",10],
		["ACE_Track",50]
];

if(smm_ace)then{
civilianBuyableUnits append ace_units;
};

buy_units = [];
if(playerSide == west)then{
	buy_units = [
		["B_UGV_01_F",200],
		["B_UGV_01_rcws_F",620],
		["B_Truck_01_transport_F",500],
		["B_Truck_01_mover_F",300],
		["B_Truck_01_Repair_F",500],
		["B_Truck_01_ammo_F",500],
		["B_Truck_01_fuel_F",500],
		["B_Truck_01_medical_F",500],
		["B_G_Offroad_01_armed_F",300],
		["B_MRAP_01_gmg_F",800],
		["B_MRAP_01_hmg_F",850],
		["B_Boat_Armed_01_minigun_F",620],
		["B_MBT_01_mlrs_F",12100],
		["B_MBT_01_arty_F",8900],
		["B_MBT_01_cannon_F",5100],
		["B_APC_Tracked_01_AA_F",2400],
		["B_APC_Tracked_01_CRV_F",2000],
		["B_T_APC_Wheeled_01_cannon_F",1930],
		["B_Heli_Transport_03_black_F",1800],
		["B_Plane_CAS_01_F",2300],
		["B_Heli_Transport_01_camo_F",1450],
		["B_Heli_Attack_01_F",2500],
		["B_Heli_Light_01_stripped_F",1050],
		["B_Heli_Light_01_armed_F",1750],
		["B_T_LSV_01_armed_F",550],
		["B_LSV_01_unarmed_F",370],
		["B_T_VTOL_01_armed_F",3200],
		["B_T_VTOL_01_infantry_F",1900]
	];
};
if(playerSide == independent)then{
	buy_units = [
		["I_UGV_01_F",120],
		["I_UGV_01_rcws_F",500],
		["I_Heli_Transport_02_F",1000],
		["I_Heli_light_03_F",1500],
		["I_Heli_light_03_unarmed_F",800],
		["I_Plane_Fighter_03_CAS_F",2200],
		["I_Plane_Fighter_03_AA_F",2150],
		["I_APC_tracked_03_cannon_F",1800],
		["I_MBT_03_cannon_F",5000],
		["I_Boat_Armed_01_minigun_F",400],
		["I_UAV_02_CAS_F",1300],
		["I_G_Offroad_01_armed_F",250],
		["I_MRAP_03_F",600],
		["I_MRAP_03_hmg_F",900],
		["I_MRAP_03_gmg_F",920],
		["O_Truck_02_box_F",370],
		["I_Truck_02_ammo_F",370],
		["I_Truck_02_medical_F",370],
		["I_Truck_02_fuel_F",370],
		["I_APC_Wheeled_03_cannon_F",1700]
	];
};

buy_units append civilianBuyableUnits;


if(smm_cup)then{
	if(playerSide == west)then{
	buy_units = [
		["CUP_B_UH60M_US",1100],
		["B_Heli_Light_01_F",800],
		["CUP_B_MV22_USMC",1600],
		["CUP_USMC_MQ9",2000],
		["CUP_B_F35B_AA_USMC",1700],
		["CUP_B_AV8B_CAP_USMC",1500],
		["CUP_B_A10_CAS_USA",1600],
		["CUP_B_MH60S_USMC",1000],
		["CUP_B_CH47F_USA",1000],
		["ACE_Wheel",15],
		["ACE_Track",15],
		["CUP_B_Dingo_CZ_Wdl",900],
		["CUP_B_Jackal2_L2A1_GB_D",600],
		["CUP_B_HMMWV_SOV_USA",600],
		["CUP_B_HMMWV_Transport_USA",100],
		["CUP_B_HMMWV_Unarmed_USMC",80],
		["CUP_B_HMMWV_Ambulance_USA",300],
		["CUP_B_HMMWV_Avenger_USMC",1000],
		["CUP_B_HMMWV_M1114_USMC",350],
		["CUP_B_HMMWV_TOW_USMC",600],
		
		["CUP_O_Ural_Refuel_RU",400],
		["CUP_O_Ural_Reammo_RU",400],
		["CUP_O_Ural_Repair_RU",400]
	];
	};


	if(playerSide == independent)then{
	buy_units = [
		["CUP_B_CH53E_USMC",800],
		["CUP_B_Su25_CDF",1300],
		["CUP_C_DC3_CIV",600],
		["C_Heli_Light_01_civil_F",500],
		["CUP_C_LR_Transport_CTK",60],
		["CUP_B_LR_MG_CZ_W",250],
		["CUP_I_SUV_Armored_ION",150],
		["CUP_O_LR_SPG9_TKA",250],
		["CUP_C_Golf4_whiteblood_Civ",50],
		["C_Hatchback_01_sport_F",80],
		["CUP_B_LR_Ambulance_CZ_W",150],
		["CUP_O_Ural_Refuel_RU",200],
		["CUP_O_Ural_Reammo_RU",200],
		["CUP_O_Ural_Repair_RU",200],
		["B_Quadbike_01_F",15],
		["ACE_Wheel",5],
		["ACE_Track",100]

	];
	};
};
//when buying one of this vehicles, a respawn point for the players' side will be created and tracked
respawnVehicles = ["B_Truck_01_medical_F","I_Truck_02_medical_F"];

diag_log "TODO remove 0";
if(isClass(configfile >> "CfgPatches" >> "hlcweapons_acr"))then{diag_log "TODO remove 1";
	call compile preprocessFileLineNumbers "smm_config\units_niarsenal.sqf";
	
};

buy_units = [buy_units,[],{_x select 1},"ASCEND"] call BIS_fnc_sortBy;

