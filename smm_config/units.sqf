//use [uniteast,unitwest,unitindepndent]
// use unit = ["classname",cost]

if(smm_cup)then{
ai_infantry = [
	
		east call smm_fnc_macrosModUnits
	   ,west call smm_fnc_macrosModUnits
	   ,independent call smm_fnc_macrosModUnits
];
}else{
ai_infantry = [
	[//24
		["O_Soldier_A_F",10,{}] call SpawnableInfantry_create,
		["O_Soldier_AAR_F",10,{}] call SpawnableInfantry_create,
		["O_Soldier_AR_F",15,{}] call SpawnableInfantry_create,
		["O_medic_F",15,{}] call SpawnableInfantry_create,
		//["O_crew_F",10,{}] call SpawnableInfantry_create,
		["O_engineer_F",15,{}] call SpawnableInfantry_create,
		["O_soldier_exp_F",15,{}] call SpawnableInfantry_create,
		["O_Soldier_GL_F",10,{}] call SpawnableInfantry_create,
		["O_HeavyGunner_F",15,{}] call SpawnableInfantry_create,
		["O_soldier_M_F",15,{}] call SpawnableInfantry_create,
		["O_Soldier_AA_F",30,{}] call SpawnableInfantry_create,
//at	//["O_Soldier_AT_F",30,{}] call SpawnableInfantry_create,
		["O_SOLDIER_REPAIR_F",15,{}] call SpawnableInfantry_create,
		["O_Urban_SHARPSHOOTER_F",15,{}] call SpawnableInfantry_create,
		//["O_SOLDIER_SL_F",10,{}] call SpawnableInfantry_create,
		["O_SoldierU_A_F",10,{}] call SpawnableInfantry_create,
		["O_SoldierU_AAR_F",10,{}] call SpawnableInfantry_create,
		["O_SoldierU_AR_F",15,{}] call SpawnableInfantry_create,
		["O_SOLDIERU_MEDIC_F",15,{}] call SpawnableInfantry_create,
		["O_engineer_U_F",15,{}] call SpawnableInfantry_create,
		["O_soldierU_exp_F",15,{}] call SpawnableInfantry_create,
		["O_SoldierU_GL_F",10,{}] call SpawnableInfantry_create,
		["O_Urban_HeavyGunner_F",15,{}] call SpawnableInfantry_create,
		["O_soldierU_M_F",15,{}] call SpawnableInfantry_create,
		["O_SoldierU_AA_F",30,{}] call SpawnableInfantry_create,
		//["O_SoldierU_AT_F",30,{}] call SpawnableInfantry_create,
		["O_SOLDIERU_REPAIR_F",15,{}] call SpawnableInfantry_create,
		["O_SHARPSHOOTER_F",15,{}] call SpawnableInfantry_create,
		//["O_SOLDIERU_SL_F",10,{}] call SpawnableInfantry_create,
		/*
		["O_t_Soldier_A_F",10,{}] call SpawnableInfantry_create,
		["O_t_Soldier_AAR_F",10,{}] call SpawnableInfantry_create,
		["O_T_Soldier_AR_F",15,{}] call SpawnableInfantry_create,
		["O_t_medic_F",15,{}] call SpawnableInfantry_create,
		//["O_t_crew_F",10,{}] call SpawnableInfantry_create,
		["O_t_engineer_F",15,{}] call SpawnableInfantry_create,
		["O_t_soldier_exp_F",15,{}] call SpawnableInfantry_create,
		["O_t_Soldier_GL_F",10,{}] call SpawnableInfantry_create,
		["O_t_soldier_M_F",15,{}] call SpawnableInfantry_create,
		["O_t_Soldier_AA_F",30,{}] call SpawnableInfantry_create,
		//["O_t_Soldier_AT_F",30,{}] call SpawnableInfantry_create,
		["O_t_SOLDIER_REPAIR_F",15,{}] call SpawnableInfantry_create,
		*/
		/*
		["O_G_SOLDIER_A_F",10,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_AR_F",15,{}] call SpawnableInfantry_create,
		["O_G_MEDIC_F",15,{}] call SpawnableInfantry_create,
		["O_G_ENGINEER_F",15,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_EXP_F",15,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_GL_F",10,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_M_F",15,{}] call SpawnableInfantry_create,
		["O_G_SHARPSHOOTER_F",15,{}] call SpawnableInfantry_create,
		//["O_G_SOLDIER_SL_F",10,{}] call SpawnableInfantry_create,
		*/
		["O_Soldier_LAT_F",30,{}] call SpawnableInfantry_create,
		["O_SoldierU_LAT_F",30,{}] call SpawnableInfantry_create
		//["O_G_Soldier_LAT_F",30,{}] call SpawnableInfantry_create
	],
	[	
		["B_SOLDIER_A_F",10,{}] call SpawnableInfantry_create,
		["B_SOLDIER_AAR_F",10,{}] call SpawnableInfantry_create,
		["B_SOLDIER_AR_F",15,{}] call SpawnableInfantry_create,
		["B_MEDIC_F",15,{}] call SpawnableInfantry_create,
		//["B_CREW_F",10,{}] call SpawnableInfantry_create,
		//["B_engineer_f",15,{}] call SpawnableInfantry_create,
		["b_soldier_exp_f",15,{}] call SpawnableInfantry_create,
		["b_soldier_gl_f",10,{}] call SpawnableInfantry_create,
		["b_heavygunner_f",15,{}] call SpawnableInfantry_create,
		["b_soldier_m_f",15,{}] call SpawnableInfantry_create,
		["b_soldier_aa_f",30,{}] call SpawnableInfantry_create,
//at	//["b_soldier_at_f",30,{}] call SpawnableInfantry_create,
		["b_soldier_repair_f",15,{}] call SpawnableInfantry_create,
		["b_sharpshooter_f",15,{}] call SpawnableInfantry_create,
		/*
		//["b_soldier_sl_f",10,{}] call SpawnableInfantry_create,
		["B_G_soldier_a_f",10,{}] call SpawnableInfantry_create,
		["b_g_soldier_ar_f",15,{}] call SpawnableInfantry_create,
		["b_g_medic_f",15,{}] call SpawnableInfantry_create,
		["b_g_engineer_f",15,{}] call SpawnableInfantry_create,
		["b_g_soldier_exp_f",15,{}] call SpawnableInfantry_create,
		["b_g_soldier_gl_f",10,{}] call SpawnableInfantry_create,
		["b_g_soldier_m_f",15,{}] call SpawnableInfantry_create,
		["b_g_sharpshooter_f",15,{}] call SpawnableInfantry_create,
		//["b_g_soldier_sl_f",10,{}] call SpawnableInfantry_create,
		*/
		/*
		["b_t_soldier_a_f",10,{}] call SpawnableInfantry_create,
		["B_t_SOLDIER_AAR_F",10,{}] call SpawnableInfantry_create,
		["B_t_SOLDIER_AR_F",15,{}] call SpawnableInfantry_create,
		["b_t_medic_f",15,{}] call SpawnableInfantry_create,
		//["B_t_CREW_F",10,{}] call SpawnableInfantry_create,
		["B_t_engineer_f",15,{}] call SpawnableInfantry_create,
		["b_t_soldier_exp_f",15,{}] call SpawnableInfantry_create,
		["b_t_soldier_gl_f",10,{}] call SpawnableInfantry_create,
		["b_t_soldier_m_f",15,{}] call SpawnableInfantry_create,
		["b_t_soldier_aa_f",30,{}] call SpawnableInfantry_create,
		//["b_t_soldier_at_f",30,{}] call SpawnableInfantry_create,
		["b_t_soldier_repair_f",15,{}] call SpawnableInfantry_create,
		//["b_t_soldier_sl_f",10,{}]call SpawnableInfantry_create,
		*/
		["B_soldier_LAT_F",30,{}] call SpawnableInfantry_create,
		["B_t_soldier_LAT_F",30,{}] call SpawnableInfantry_create
		
	],
	[   
		["i_soldier_a_f",10,{}] call SpawnableInfantry_create,
		["i_soldier_aar_f",10,{}] call SpawnableInfantry_create,
		["i_soldier_ar_f",15,{}] call SpawnableInfantry_create,
		["i_medic_f",15,{}] call SpawnableInfantry_create,
		//["i_crew_f",10,{}] call SpawnableInfantry_create,
		["i_engineer_f",15,{}] call SpawnableInfantry_create,
		["i_soldier_exp_f",15,{}] call SpawnableInfantry_create,
		["i_soldier_gl_f",10,{}] call SpawnableInfantry_create,
		["i_soldier_m_f",15,{}] call SpawnableInfantry_create,
		["i_soldier_aa_f",30,{}] call SpawnableInfantry_create,
		//["i_soldier_at_f",30,{}] call SpawnableInfantry_create,
		["i_soldier_repair_f",30,{}]call SpawnableInfantry_create,
		["I_soldier_LAT_F",30,{}] call SpawnableInfantry_create

    ]
];
};


ai_vehicles = [
	[	
		// Car
		["O_MRAP_02_gmg_F",150,{}] call SpawnableVehicle_create,
		["O_MRAP_02_hmg_F",170,{}] call SpawnableVehicle_create,
		["O_LSV_02_AT_F",90,{}] call SpawnableVehicle_create,
		["O_LSV_02_armed_F",150,{}] call SpawnableVehicle_create,
		// Anti-Air
		["O_APC_Tracked_02_AA_F",320,{}] call SpawnableVehicle_create,
		// APC
		["O_APC_Tracked_02_cannon_F",270,{}] call SpawnableVehicle_create,
		["O_APC_Wheeled_02_rcws_F",220,{}] call SpawnableVehicle_create,
		// Tank
		["O_MBT_02_cannon_F",330,{}] call SpawnableVehicle_create,
		["O_MBT_04_cannon_F",360,{}] call SpawnableVehicle_create,
		["O_MBT_04_command_F",400,{}] call SpawnableVehicle_create,		
		// Heli
		["O_Heli_Attack_02_F",370,{}] call SpawnableVehicle_create
		// Arillery
		//["O_MBT_02_arty_F",280,{}] call SpawnableVehicle_create,
	],
	[	
		// Car
		["B_MRAP_01_gmg_F",150,{}] call SpawnableVehicle_create,
		["B_MRAP_01_hmg_F",170,{}] call SpawnableVehicle_create,
		["B_LSV_01_AT_F",90,{}] call SpawnableVehicle_create,
		["B_LSV_01_armed_F",150,{}] call SpawnableVehicle_create,
		// Anti-Air
		["B_APC_Tracked_01_AA_F",300,{}] call SpawnableVehicle_create,
		// APC
		["B_APC_Wheeled_01_cannon_F",250,{}] call SpawnableVehicle_create,
		["B_APC_Tracked_01_rcws_F",200,{}] call SpawnableVehicle_create,
		["B_AFV_Wheeled_01_cannon_F",250,{}] call SpawnableVehicle_create,
		["B_AFV_Wheeled_01_up_cannon_F",300,{}] call SpawnableVehicle_create,
		// Tank
		["B_MBT_01_cannon_F",350,{}] call SpawnableVehicle_create,
		["B_MBT_01_TUSK_F",400,{}] call SpawnableVehicle_create,
		// Heli
		["B_Heli_Attack_01_F",370,{}] call SpawnableVehicle_create
		// Arillery
		//["B_MBT_01_arty_F",300,{}] call SpawnableVehicle_create,
	],
	[	
		// Car
		["I_MRAP_03_hmg_F",120,{}] call SpawnableVehicle_create,
		["I_MRAP_03_gmg_F",150,{}] call SpawnableVehicle_create,
		// Anti-Air
		["I_LT_01_AA_F",230,{}] call SpawnableVehicle_create,
		// APC
		["I_APC_Wheeled_03_cannon_F",230,{}] call SpawnableVehicle_create,
		["I_APC_tracked_03_cannon_F",280,{}] call SpawnableVehicle_create,
		// Tank
		["I_LT_01_AT_F",280,{}] call SpawnableVehicle_create,
		["I_LT_01_cannon_F",330,{}] call SpawnableVehicle_create,
		["I_MBT_03_cannon_F",400,{}] call SpawnableVehicle_create,
		// Heli
		["I_Heli_light_03_dynamicLoadout_F",370,{}] call SpawnableVehicle_create
		// Arillery
	]
];

ai_transport_vehicles = [
	[
		["O_Heli_Transport_04_covered_F",370,{}] call SpawnableVehicle_create
	],
	[
		["B_Heli_Transport_03_F",370,{}] call SpawnableVehicle_create
	],
	[
		["I_Heli_Transport_02_F",370,{}] call SpawnableVehicle_create
	]
];

ai_transport_pilots = [
	[
		["O_crew_F",10,{}] call SpawnableInfantry_create
	],
	[
		["B_CREW_F",10,{}] call SpawnableInfantry_create
	],
	[
		["i_crew_f",10,{}] call SpawnableInfantry_create
	]
];


civilianBuyableUnits = [

	["C_Boat_Civil_01_F",2500,{},"BASE",""] call PurchasableVehicle_create,
	//["C_Offroad_01_F",4000,{},"BASE",""] call PurchasableVehicle_create,
	//["C_Hatchback_01_sport_F",6000,{},"BASE",""] call PurchasableVehicle_create,
	//["C_SUV_01_F",5500,{},"BASE",""] call PurchasableVehicle_create,
	["C_Van_02_transport_F",3400,{},"LOGISTIC",""] call PurchasableVehicle_create,
	["C_Van_01_fuel_F",8000,{},"LOGISTIC",""] call PurchasableVehicle_create,
	//["C_Kart_01_F",1790,{},"BASE",""] call PurchasableVehicle_create,
	["C_Boat_Transport_02_F",4000,{},"LOGISTIC",""] call PurchasableVehicle_create,
	["C_Plane_Civil_01_racing_F",6500,{},"LOGISTIC",""] call PurchasableVehicle_create,
	["C_Heli_light_01_digital_F",11500,{},"LOGISTIC",""] call PurchasableVehicle_create
];

if(smm_ace)then{
	ace_units = [
			["ACE_Wheel",300,{},"BASE",""] call PurchasableVehicle_create,
			["ACE_Track",5000,{},"BASE",""] call PurchasableVehicle_create,
			//TODO change perk
			["ACE_Box_82mm_Mo_Combo",500,{},"MINES","[Box] Mortar Ammunition"] call PurchasableVehicle_create
	];

	allAmmoTypes = [
		["ACE_20mm_HE", 1.2] call PurchasableVehicleAmmo_create,	/*20 mm Shells (500)*/
		["ACE_B_35mm_ABM", 4.2] call PurchasableVehicleAmmo_create,	/*35mm ABM Shells (120)*/
		["ACE_B_35mm_ABM_Tracer_Green", 4.2] call PurchasableVehicleAmmo_create,	/*35mm ABM Shells (120)*/
		["ACE_B_35mm_ABM_Tracer_Red", 4.2] call PurchasableVehicleAmmo_create,	/*35mm ABM Shells (120)*/
		["ACE_B_35mm_ABM_Tracer_Yellow", 4.2] call PurchasableVehicleAmmo_create,	/*35mm ABM Shells (120)*/
		["ACE_Hellfire_AGM114K", 500] call PurchasableVehicleAmmo_create,	/*AGM-114K [ACE] (6)*/
		["ACE_Hellfire_AGM114N", 450] call PurchasableVehicleAmmo_create,	/*AGM-114N [ACE] (6)*/
		["ACE_Hydra70_DAGR", 35] call PurchasableVehicleAmmo_create,	/*6 Round DAGR (12)*/
		["ACE_Javelin_FGM148_static", 50] call PurchasableVehicleAmmo_create,	/*Titan Missile (1)*/
		["ace_kh25ml", 150] call PurchasableVehicleAmmo_create,	/*1x Kh-25ML [ACE] (1)*/
		["ace_maverick_L", 150] call PurchasableVehicleAmmo_create,	/*AGM-65 Maverick L [ACE] (1)*/
		["ammo_AAA_Gun35mm_AA", 4.2] call PurchasableVehicleAmmo_create,	/*Praetorian 20mm (1550)*/
		["ammo_Fighter01_Gun20mm_AA", 3] call PurchasableVehicleAmmo_create,	/*M61 20mm 450 rnd (450)*/
		["ammo_Fighter02_Gun30mm_AA", 3] call PurchasableVehicleAmmo_create,	/*Gsh 30mm 180 rnd (180)*/
		["ammo_Fighter04_Gun20mm_AA", 3] call PurchasableVehicleAmmo_create,	/*M61 20mm 150 rbd (150)*/
		["ammo_Missile_AA_R73", 100] call PurchasableVehicleAmmo_create,	/*R73 SR AA x1 (1)*/
		["ammo_Missile_AA_R77", 150] call PurchasableVehicleAmmo_create,	/*R77 MR AA x1 (1)*/
		["ammo_Missile_AMRAAM_C", 150] call PurchasableVehicleAmmo_create,	/*AMRAAM C AA x1 (1)*/
		["ammo_Missile_AMRAAM_D", 150] call PurchasableVehicleAmmo_create,	/*AMRAAM D AA x1 (1)*/
		["ammo_Missile_BIM9X", 100] call PurchasableVehicleAmmo_create,	/*BIM 9X AA x1 (1)*/
		["ammo_Missile_rim116", 100] call PurchasableVehicleAmmo_create,	/*Spartan AA (21)*/
		["ammo_Missile_rim162", 150] call PurchasableVehicleAmmo_create,	/*Centurion AA (8)*/
		["AT_Mine_155mm_AMOS_range", 50] call PurchasableVehicleAmmo_create,	/*AT Mine Cluster (6)*/
		["B_127x108_Ball", 0.5] call PurchasableVehicleAmmo_create,	/*NSVT-M (450)*/
		["B_127x99_Ball", 0.5] call PurchasableVehicleAmmo_create,	/*12.7 mm AA MG Mag (500)*/
		["B_127x99_Ball_Tracer_Green", 0.5] call PurchasableVehicleAmmo_create,	/*12.7 mm AA MG Tracer (Green) Mag (500)*/
		["B_127x99_Ball_Tracer_Red", 0.5] call PurchasableVehicleAmmo_create,	/*12.7 mm AA MG Tracer (Red) Mag (500)*/
		["B_127x99_Ball_Tracer_Yellow", 0.5] call PurchasableVehicleAmmo_create,	/*12.7 mm AA MG Tracer (Yellow) Mag (500)*/
		["B_20mm", 1.2] call PurchasableVehicleAmmo_create,	/*20 mm Shells (300)*/
		["B_20mm_AP", 3] call PurchasableVehicleAmmo_create,	/*20 mm Shells (60)*/
		["B_20mm_Tracer_Red", 1.2] call PurchasableVehicleAmmo_create,	/*20 mm Shells (1000)*/
		["B_25mm", 2] call PurchasableVehicleAmmo_create,	/*25 mm Shells (300)*/
		["B_30mm_AP", 4] call PurchasableVehicleAmmo_create,	/*30 mm APDS shells (250)*/
		["B_30mm_AP_Tracer_Green", 4] call PurchasableVehicleAmmo_create,	/*30 mm APDS Tracer (Green) Shells (250)*/
		["B_30mm_AP_Tracer_Red", 4] call PurchasableVehicleAmmo_create,	/*30 mm APDS Tracer (Red) Shells (250)*/
		["B_30mm_AP_Tracer_Yellow", 4] call PurchasableVehicleAmmo_create,	/*30 mm APDS Tracer (Yellow) Shells (250)*/
		["B_30mm_APFSDS", 4] call PurchasableVehicleAmmo_create,	/*30 mm APFSDS (60)*/
		["B_30mm_APFSDS_Tracer_Green", 4] call PurchasableVehicleAmmo_create,	/*30 mm APFSDS (60)*/
		["B_30mm_APFSDS_Tracer_Red", 4] call PurchasableVehicleAmmo_create,	/*30 mm APFSDS-T (60)*/
		["B_30mm_APFSDS_Tracer_Yellow", 4] call PurchasableVehicleAmmo_create,	/*30 mm APFSDS-T (60)*/
		["B_30mm_HE", 3] call PurchasableVehicleAmmo_create,	/*30 mm HE Shells (250)*/
		["B_30mm_HE_Tracer_Green", 3] call PurchasableVehicleAmmo_create,	/*30 mm HE Tracer (Green) Shells (250)*/
		["B_30mm_HE_Tracer_Red", 3] call PurchasableVehicleAmmo_create,	/*30 mm HE Tracer (Red) Shells (250)*/
		["B_30mm_MP", 3] call PurchasableVehicleAmmo_create,	/*30 mm Multi-purpose (140)*/
		["B_30mm_MP_Tracer_Green", 3] call PurchasableVehicleAmmo_create,	/*30 mm MP-T (140)*/
		["B_30mm_MP_Tracer_Red", 3] call PurchasableVehicleAmmo_create,	/*30 mm MP-T (140)*/
		["B_30mm_MP_Tracer_Yellow", 3] call PurchasableVehicleAmmo_create,	/*30 mm MP-T (140)*/
		["B_35mm_AA", 2] call PurchasableVehicleAmmo_create,	/*35 mm AA Shells (680)*/
		["B_35mm_AA_Tracer_Green", 2] call PurchasableVehicleAmmo_create,	/*35 mm AA Shells (680)*/
		["B_35mm_AA_Tracer_Red", 2] call PurchasableVehicleAmmo_create,	/*35 mm AA Shells (680)*/
		["B_35mm_AA_Tracer_Yellow", 2] call PurchasableVehicleAmmo_create,	/*35 mm AA Shells (680)*/
		["B_40mm_APFSDS", 6] call PurchasableVehicleAmmo_create,	/*40 mm APFSDS (40)*/
		["B_40mm_APFSDS_Tracer_Green", 6] call PurchasableVehicleAmmo_create,	/*40 mm APFSDS-T (40)*/
		["B_40mm_APFSDS_Tracer_Red", 6] call PurchasableVehicleAmmo_create,	/*40 mm APFSDS-T (40)*/
		["B_40mm_APFSDS_Tracer_Yellow", 6] call PurchasableVehicleAmmo_create,	/*40 mm APFSDS-T (40)*/
		["B_40mm_GPR", 4] call PurchasableVehicleAmmo_create,	/*40 mm GPR (60)*/
		["B_40mm_GPR_Tracer_Green", 4] call PurchasableVehicleAmmo_create,	/*40 mm GPR-T (60)*/
		["B_40mm_GPR_Tracer_Red", 4] call PurchasableVehicleAmmo_create,	/*40 mm GPR-T (60)*/
		["B_40mm_GPR_Tracer_Yellow", 4] call PurchasableVehicleAmmo_create,	/*40 mm GPR-T (60)*/
		["B_65x39_Case_green", 0.12] call PurchasableVehicleAmmo_create,	/*6.5 mm 200Rnd Belt Case Tracer (Green) (200)*/
		["B_65x39_Case_Green", 0.12] call PurchasableVehicleAmmo_create,	/*6.5 mm 2000Rnd LMG Belt (2000)*/
		["B_65x39_Case_yellow", 0.12] call PurchasableVehicleAmmo_create,	/*6.5 mm 200Rnd Belt Tracer (Yellow) (200)*/
		["B_65x39_Case_Yellow", 0.12] call PurchasableVehicleAmmo_create,	/*6.5 mm 1000Rnd LMG Belt (1000)*/
		["B_65x39_Caseless", 0.12] call PurchasableVehicleAmmo_create,	/*6.5 mm 200Rnd Belt Case (200)*/
		["B_65x39_Minigun_Caseless_Green_splash", 0.12] call PurchasableVehicleAmmo_create,	/*6.5 mm 2000Rnd LMG Tracer (Green) Belt (2000)*/
		["B_65x39_Minigun_Caseless_Red_splash", 0.12] call PurchasableVehicleAmmo_create,	/*6.5 mm 2000Rnd LMG Tracer (Red) Belt (2000)*/
		["B_65x39_Minigun_Caseless_Yellow_splash", 0.12] call PurchasableVehicleAmmo_create,	/*6.5 mm 2000Rnd LMG Tracer (Yellow) Belt (2000)*/
		["B_762x51_Ball", 0.12] call PurchasableVehicleAmmo_create,	/*7.62 mm Minigun Belt (200)*/
		["B_762x51_Minigun_Tracer_Red_splash", 0.12] call PurchasableVehicleAmmo_create,	/*7.62 mm Minigun Belt (5000)*/
		["B_762x51_Minigun_Tracer_Yellow_splash", 0.12] call PurchasableVehicleAmmo_create,	/*7.62 mm Minigun Belt (5000)*/
		["B_762x51_Tracer_Green", 0.12] call PurchasableVehicleAmmo_create,	/*7.62 mm Minigun Belt (200)*/
		["B_762x51_Tracer_Red", 0.12] call PurchasableVehicleAmmo_create,	/*7.62 mm Minigun Belt (200)*/
		["B_762x51_Tracer_Yellow", 0.12] call PurchasableVehicleAmmo_create,	/*7.62 mm Minigun Belt (200)*/
		["Bo_GBU12_LGB", 2000] call PurchasableVehicleAmmo_create,	/*GBU-12 (2)*/
		["Bo_GBU12_LGB_MI10", 2000] call PurchasableVehicleAmmo_create,	/*GBU-12 (2)*/
		["Bo_Leaflets", 20] call PurchasableVehicleAmmo_create,	/*Leaflets (1)*/
		["Bo_Mk82", 100] call PurchasableVehicleAmmo_create,	/*Mk82 (2)*/
		["Bo_Mk82_MI08", 100] call PurchasableVehicleAmmo_create,	/*Mk82 (2)*/
		["Bomb_03_F", 2000] call PurchasableVehicleAmmo_create,	/*FAB-250M-54 (2)*/
		["Bomb_04_F", 2000] call PurchasableVehicleAmmo_create,	/*GBU-12 (4)*/
		["BombCluster_01_Ammo_F", 2000] call PurchasableVehicleAmmo_create,	/*CBU-85 (4)*/
		["BombCluster_02_Ammo_F", 2000] call PurchasableVehicleAmmo_create,	/*RBK-500F (4)*/
		["BombCluster_02_cap_Ammo_F", 2000] call PurchasableVehicleAmmo_create,	/*RBK-500F Cluster x1 (1)*/
		["BombCluster_03_Ammo_F", 2000] call PurchasableVehicleAmmo_create,	/*BL778 (4)*/
		["BombDemine_01_Ammo_F", 1] call PurchasableVehicleAmmo_create,	/*Demining Charge (4)*/
		["BombDemine_01_DummyAmmo_F", 1] call PurchasableVehicleAmmo_create,	/*Demining Charge (Dummy) (4)*/
		["Cannon_30mm_HE_Plane_CAS_02_F", 2] call PurchasableVehicleAmmo_create,	/*30mm HEI-T (500)*/
		["Cluster_155mm_AMOS", 20] call PurchasableVehicleAmmo_create,	/*Cluster Shells (2)*/
		["Flare_82mm_AMOS_White", 10] call PurchasableVehicleAmmo_create,	/*Flare (White) (8)*/
		["G_20mm_HE", 1] call PurchasableVehicleAmmo_create,	/*20 mm Grenade Mag (200)*/
		["G_40mm_HEDP", 1] call PurchasableVehicleAmmo_create,	/*40 mm HE Grenade Mag (200)*/
		["Gatling_30mm_HE_Plane_CAS_01_F", 2] call PurchasableVehicleAmmo_create,	/*30mm HEI (1170)*/
		["M_120mm_cannon_ATGM", 50] call PurchasableVehicleAmmo_create,	/*120mm ATGM (4)*/
		["M_120mm_cannon_ATGM_LG", 50] call PurchasableVehicleAmmo_create,	/*120mm ATGM LG (4)*/
		["M_125mm_cannon_ATGM", 50] call PurchasableVehicleAmmo_create,	/*125mm ATGM (4)*/
		["M_127mm_Firefist_AT", 50] call PurchasableVehicleAmmo_create,	/*FireFIST ATGM Missile (2)*/
		["M_70mm_SAAMI", 100] call PurchasableVehicleAmmo_create,	/*SAAMI Missile (4)*/
		["M_Air_AA", 100] call PurchasableVehicleAmmo_create,	/*ASRAAM (2)*/
		["M_Air_AA_MI02", 100] call PurchasableVehicleAmmo_create,	/*ASRAAM (2)*/
		["M_Air_AA_MI06", 100] call PurchasableVehicleAmmo_create,	/*ASRAAM (2)*/
		["M_Air_AT", 50] call PurchasableVehicleAmmo_create,	/*AG Missiles (6)*/
		["M_AT", 10] call PurchasableVehicleAmmo_create,	/*DAR (24)*/
		["M_Jian_AT", 150] call PurchasableVehicleAmmo_create,	/*Jian (4)*/
		["M_PG_AT", 35] call PurchasableVehicleAmmo_create,	/*DAGR (24)*/
		["M_Scalpel_AT", 150] call PurchasableVehicleAmmo_create,	/*Scalpel E2 (8)*/
		["M_Scalpel_AT_hidden", 150] call PurchasableVehicleAmmo_create,	/*Scalpel E2 (2)*/
		["M_Titan_AA_long", 100] call PurchasableVehicleAmmo_create,	/*Titan Missile (4)*/
		["M_Titan_AA_static", 100] call PurchasableVehicleAmmo_create,	/*Zephyr (1)*/
		["M_Titan_AT_long", 50] call PurchasableVehicleAmmo_create,	/*Titan Missile (5)*/
		["M_Zephyr", 150] call PurchasableVehicleAmmo_create,	/*Zephyr (4)*/
		["Mine_155mm_AMOS_range", 50] call PurchasableVehicleAmmo_create,	/*Mine Cluster (6)*/
		["Missile_AA_03_F", 100] call PurchasableVehicleAmmo_create,	/*Wympel R-73 (2)*/
		["Missile_AA_04_F", 100] call PurchasableVehicleAmmo_create,	/*AIM-9 Sidewinder (2)*/
		["Missile_AGM_01_F", 150] call PurchasableVehicleAmmo_create,	/*Kh-25MTP (4)*/
		["Missile_AGM_02_F", 150] call PurchasableVehicleAmmo_create,	/*AGM-65 Maverick (6)*/
		["R_230mm_Cluster", 100] call PurchasableVehicleAmmo_create,	/*230 mm Cluster Rocket (12)*/
		["R_230mm_HE", 100] call PurchasableVehicleAmmo_create,	/*227mm HE Missile (12)*/
		["R_80mm_HE", 5] call PurchasableVehicleAmmo_create,	/*Skyfire (14)*/
		["Rocket_03_AP_F", 5] call PurchasableVehicleAmmo_create,	/*S-8 AP (20)*/
		["Rocket_03_HE_F", 5] call PurchasableVehicleAmmo_create,	/*S-8 HE (20)*/
		["Rocket_04_AP_F", 5] call PurchasableVehicleAmmo_create,	/*Hydra 70 AP (7)*/
		["Rocket_04_HE_F", 5] call PurchasableVehicleAmmo_create,	/*Hydra 70 HE (7)*/
		["Sh_105mm_APFSDS", 50] call PurchasableVehicleAmmo_create,	/*105mm APFSDS (40)*/
		["Sh_105mm_APFSDS_T_Green", 50] call PurchasableVehicleAmmo_create,	/*105mm APFSDS-T (40)*/
		["Sh_105mm_APFSDS_T_Red", 50] call PurchasableVehicleAmmo_create,	/*105mm APFSDS-T (40)*/
		["Sh_105mm_APFSDS_T_Yellow", 50] call PurchasableVehicleAmmo_create,	/*105mm APFSDS-T (40)*/
		["Sh_105mm_HEAT_MP", 50] call PurchasableVehicleAmmo_create,	/*105mm HEAT-MP (20)*/
		["Sh_105mm_HEAT_MP_T_Green", 50] call PurchasableVehicleAmmo_create,	/*105mm HEAT-MP-T (20)*/
		["Sh_105mm_HEAT_MP_T_Red", 50] call PurchasableVehicleAmmo_create,	/*105mm HEAT-MP-T (20)*/
		["Sh_105mm_HEAT_MP_T_Yellow", 50] call PurchasableVehicleAmmo_create,	/*105mm HEAT-MP-T (20)*/
		["Sh_120mm_APFSDS", 50] call PurchasableVehicleAmmo_create,	/*120mm APFSDS (30)*/
		["Sh_120mm_APFSDS_Tracer_Green", 50] call PurchasableVehicleAmmo_create,	/*120mm APFSDS-T (30)*/
		["Sh_120mm_APFSDS_Tracer_Red", 50] call PurchasableVehicleAmmo_create,	/*120mm APFSDS-T (30)*/
		["Sh_120mm_APFSDS_Tracer_Yellow", 50] call PurchasableVehicleAmmo_create,	/*120mm APFSDS-T (30)*/
		["Sh_120mm_HE", 30] call PurchasableVehicleAmmo_create,	/*HE Shells (30)*/
		["Sh_120mm_HE_Tracer_Green", 30] call PurchasableVehicleAmmo_create,	/*120mm HE-T (30)*/
		["Sh_120mm_HE_Tracer_Red", 30] call PurchasableVehicleAmmo_create,	/*120mm HE-T (30)*/
		["Sh_120mm_HE_Tracer_Yellow", 30] call PurchasableVehicleAmmo_create,	/*120mm HE-T (30)*/
		["Sh_125mm_HE", 30] call PurchasableVehicleAmmo_create,	/*125mm HE (12)*/
		["Sh_125mm_HE_T_Green", 30] call PurchasableVehicleAmmo_create,	/*125mm HE-T (12)*/
		["Sh_125mm_HE_T_Red", 30] call PurchasableVehicleAmmo_create,	/*125mm HE-T (12)*/
		["Sh_125mm_HE_T_Yellow", 30] call PurchasableVehicleAmmo_create,	/*125mm HE-T (12)*/
		["Sh_125mm_HEAT", 50] call PurchasableVehicleAmmo_create,	/*125mm HEAT (12)*/
		["Sh_125mm_HEAT_T_Green", 50] call PurchasableVehicleAmmo_create,	/*125mm HEAT-T (12)*/
		["Sh_125mm_HEAT_T_Red", 50] call PurchasableVehicleAmmo_create,	/*125mm HEAT-T (12)*/
		["Sh_125mm_HEAT_T_Yellow", 50] call PurchasableVehicleAmmo_create,	/*125mm HEAT-T (12)*/
		["Sh_155mm_AMOS", 30] call PurchasableVehicleAmmo_create,	/*155 mm HE Shells (32)*/
		["Sh_155mm_AMOS_guided", 20] call PurchasableVehicleAmmo_create,	/*Guided (2)*/
		["Sh_155mm_AMOS_LG", 50] call PurchasableVehicleAmmo_create,	/*Laser Guided (2)*/
		["Sh_82mm_AMOS", 20] call PurchasableVehicleAmmo_create,	/*HE Mortar Shells (8)*/
		["Sh_82mm_AMOS_guided", 20] call PurchasableVehicleAmmo_create,	/*Guided (8)*/
		["Sh_82mm_AMOS_LG", 50] call PurchasableVehicleAmmo_create,	/*Laser Guided (8)*/
		["Smoke_120mm_AMOS_White", 20] call PurchasableVehicleAmmo_create,	/*Smoke (White) (6)*/
		["Smoke_82mm_AMOS_White", 100] call PurchasableVehicleAmmo_create,	/*Smoke Shell (White) (8)*/
		["SmokeLauncherAmmo", 10] call PurchasableVehicleAmmo_create,	/*Smoke Screen (2)*/
		["SmokeLauncherAmmo_boat", 10] call PurchasableVehicleAmmo_create	/*Smoke Screen (2)*/
	];

};


//call prurchaseble vehicles    ate
//["SUV_WEst",100,""] call PurchasableVehicle_create;
buy_units = [];
if(playerSide == west)then{
	buy_units = [
		["B_Boat_Transport_01_F",2000,{},"BASE",""] call PurchasableVehicle_create,
		["B_Quadbike_01_F",1800,{
			_this setObjectTextureGlobal [0, "a3\soft_f_bootcamp\quadbike_01\data\quadbike_01_ig_co.paa"];
			_this setObjectTextureGlobal [1, "a3\soft_f_gamma\quadbike_01\data\quadbike_01_wheel_ig_co.paa"];
		},"BASE",""]{ call PurchasableVehicle_create,
		["B_LSV_01_unarmed_F",3500,{},"BASE",""] call PurchasableVehicle_create, //APEX
		["B_LSV_01_armed_F",9000,{},"BASE",""] call PurchasableVehicle_create,	//APEX
		["B_MRAP_01_F",8700,{},"BASE",""] call PurchasableVehicle_create,

		//UAV Terminal
		["B_UGV_01_F",2000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_UGV_01_rcws_F",20000,{[_this,true] call smm_fnc_clearVehicleAmmo;},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_T_UAV_03_dynamicLoadout_F",35000,{[_this,true] call smm_fnc_clearVehiclePylons;},"UAV_BLUFOR",""] call PurchasableVehicle_create,
		["B_UAV_02_dynamicLoadout_F",40000,{[_this,true] call smm_fnc_clearVehiclePylons;},"UAV_BLUFOR",""] call PurchasableVehicle_create,
		["B_UAV_05_F",40000,{},"UAV_BLUFOR",""] call PurchasableVehicle_create,

		["B_Truck_01_ammo_F",15000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_Truck_01_box_F",5000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_Truck_01_fuel_F",15000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_Truck_01_medical_F",20000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_Truck_01_Repair_F",20000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,	
		["B_Truck_01_transport_F",5000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,

		//Heli logistic
		["B_Heli_Transport_03_F",20000,{[_this,true] call smm_fnc_clearVehicleAmmo},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_Heli_Transport_03_unarmed_F",25000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_Heli_Transport_01_F",30000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,

		//Car
		["B_MRAP_01_hmg_F",12000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MRAP_01_gmg_F",14000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//Boat
		["B_Boat_Armed_01_minigun_F",12000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//APC
		["B_APC_Tracked_01_CRV_F",22000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_APC_Tracked_01_rcws_F",24000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_APC_Wheeled_01_cannon_F",25500,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_AFV_Wheeled_01_cannon_F",35000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_AFV_Wheeled_01_UP_cannon_F",40000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//APC anti air
		["B_APC_Tracked_01_AA_F",34000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT
		["B_MBT_01_cannon_F",50000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MBT_01_TUSK_F",55000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT arillery
		["B_MBT_01_arty_F",80000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MBT_01_mlrs_F",85000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
	
		//Plane 
		["B_Plane_Fighter_01_F",30000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Plane_Fighter_01_Stealth_F",31000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Plane_CAS_01_dynamicLoadout_F",33000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		//Heli CREWMAN
		["B_Heli_Attack_01_dynamicLoadout_F",50000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Heli_Light_01_stripped_F",10000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Heli_Light_01_dynamicLoadout_F",18000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,

		//VTOL 
		["B_T_VTOL_01_armed_F",35000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["B_T_VTOL_01_infantry_F",17000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_T_VTOL_01_vehicle_F",18000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create
	];
};
if(playerSide == independent)then{
	buy_units = [
		["I_Boat_Transport_01_F",2000,{},"BASE",""] call PurchasableVehicle_create,
		["I_Quadbike_01_F",1800,{
			_this setObjectTextureGlobal [0, "a3\soft_f_beta\quadbike_01\data\quadbike_01_indp_co.paa"];
			_this setObjectTextureGlobal [1, "a3\soft_f_beta\quadbike_01\data\quadbike_01_wheel_indp_co.paa"];
		},"BASE",""]{ call PurchasableVehicle_create,
		["I_C_Offroad_02_unarmed_F",3000,{},"BASE",""] call PurchasableVehicle_create, //APEX
		["I_C_Offroad_02_LMG_F",6000,{},"BASE",""] call PurchasableVehicle_create,	//APEX
		["I_MRAP_03_F",6000,{},"BASE",""] call PurchasableVehicle_create,

		//UAV Terminal
		["I_UGV_01_F",2000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_UGV_01_rcws_F",15000,{[_this,true] call smm_fnc_clearVehicleAmmo},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_UAV_02_dynamicLoadout_F",25000,{[_this,true] call smm_fnc_clearVehiclePylons;},"UAV_INDEPENDENT",""] call PurchasableVehicle_create,

		["I_Truck_02_ammo_F",8000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		//no box truck
		["I_Truck_02_fuel_F",9000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_Truck_02_medical_F",10000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		// box is repair truck 
		["I_Truck_02_box_F",11000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,	
		["I_Truck_02_transport_F",7000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,

		//Heli
		["I_Heli_Transport_02_F",15000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_Heli_light_03_unarmed_F",14000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_Heli_light_03_dynamicLoadout_F",22000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,

		//Car
		["I_MRAP_03_gmg_F",7000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["I_MRAP_03_hmg_F",10000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["I_C_Offroad_02_AT_F",6000,{[_this,true] call smm_fnc_clearVehicleAmmo},"BASE",""] call PurchasableVehicle_create,	//APEX
		//Boat
		["I_Boat_Armed_01_minigun_F",12000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//APC
		["I_APC_Wheeled_03_cannon_F",18000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["I_APC_tracked_03_cannon_F",25000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//anti air
		["I_LT_01_AA_F",18000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT
		["I_LT_01_AT_F",21000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["I_LT_01_scout_F",11000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["I_LT_01_cannon_F",16000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["I_MBT_03_cannon_F",50000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT arillery
		["I_Truck_02_MRL_F",50000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//Plane
		["I_Plane_Fighter_03_dynamicLoadout_F",26000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		["I_Plane_Fighter_04_F",28000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create
			
	];
};
if(playerSide == east)then{
	buy_units = [
		["O_Boat_Transport_01_F",2000,{},"BASE",""] call PurchasableVehicle_create,
		["O_Quadbike_01_F",1800,{
			_this setObjectTextureGlobal [0, "a3\soft_f\quadbike_01\data\quadbike_01_opfor_co.paa"];
			_this setObjectTextureGlobal [1, "a3\soft_f\quadbike_01\data\quadbike_01_wheel_opfor_co.paa"];
		},"BASE",""]{ call PurchasableVehicle_create,
		["O_LSV_02_unarmed_F",3500,{},"BASE",""] call PurchasableVehicle_create, //APEX
		["O_LSV_02_armed_F",7000,{},"BASE",""] call PurchasableVehicle_create,	//APEX
		["O_MRAP_02_F",8000,{},"BASE",""] call PurchasableVehicle_create,

		//UAV Terminal
		["O_UGV_01_F",2000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_UGV_01_rcws_F",18000,{[_this,true] call smm_fnc_clearVehicleAmmo},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_UAV_02_dynamicLoadout_F",25000,{[_this,true] call smm_fnc_clearVehiclePylons;},"UAV_OPFOR",""] call PurchasableVehicle_create,
		["O_T_UAV_04_CAS_F",27000,{[_this,true] call smm_fnc_clearVehicleAmmo},"UAV_OPFOR",""] call PurchasableVehicle_create,


		["O_Truck_03_ammo_F",11000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		//no box truck
		["O_Truck_03_fuel_F",8000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Truck_03_medical_F",9000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Truck_03_repair_F",9500,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Truck_03_transport_F",5000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,

		//Heli
		["O_Heli_Transport_04_F",15000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Heli_Transport_04_ammo_F",17000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Heli_Transport_04_repair_F",17500,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Heli_Transport_04_bench_F",18000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Heli_Light_02_unarmed_F",14000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,

		["Land_Pod_Heli_Transport_04_bench_F",1100,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["Land_Pod_Heli_Transport_04_covered_F",1200,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["Land_Pod_Heli_Transport_04_medevac_F",1300,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,

		// Car
		["O_MRAP_02_hmg_F",12000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["O_MRAP_02_gmg_F",15000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//Boat
		["O_Boat_Armed_01_hmg_F",12000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		// APC
		["O_APC_Wheeled_02_rcws_F",21000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["O_APC_Tracked_02_cannon_F",28500,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		// Anti-Air
		["O_APC_Tracked_02_AA_F",33500,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT
		["O_MBT_02_cannon_F",50000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["O_MBT_04_cannon_F",55000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["O_MBT_04_command_F",58000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,	
		// MBT Arillery
		["O_MBT_02_arty_F",80000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["I_Truck_02_MRL_F",55000,{
			[_this,true] call smm_fnc_clearVehicleAmmo;
			_this setObjectTextureGlobal [0, "a3\soft_f_beta\truck_02\data\truck_02_kab_opfor_co.paa"];
			_this setObjectTextureGlobal [1, "a3\soft_f_beta\truck_02\data\truck_02_int_co.paa"];
			_this setObjectTextureGlobal [2, "a3\soft_f_gamma\truck_02\data\truck_02_mrl_opfor_co.paa"];
		},"CREWMAN",""] call PurchasableVehicle_create,

		// Plane
		["O_Plane_Fighter_02_F",30000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Plane_Fighter_02_Stealth_F",32500,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Plane_CAS_02_dynamicLoadout_F",35000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		["I_Plane_Fighter_03_dynamicLoadout_F",29000,{
			[_this,true] call smm_fnc_clearVehiclePylons;
			_this setObjectTextureGlobal [0, "a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_1_greyhex_co.paa"];
			_this setObjectTextureGlobal [1, "a3\air_f_gamma\plane_fighter_03\data\plane_fighter_03_body_2_greyhex_co.paa"];
		},"CREWMAN",""] call PurchasableVehicle_create,
		//Heli CREWMAN
		["O_Heli_Attack_02_dynamicLoadout_F",50000,{[_this,true] call smm_fnc_clearVehicleAmmo},"CREWMAN",""] call PurchasableVehicle_create,	
		["O_Heli_Light_02_dynamicLoadout_F",23000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,

		//VTOL
		["O_T_VTOL_02_infantry_dynamicLoadout_F",21000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_VTOL_02_vehicle_dynamicLoadout_F",21500,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create
	];
};
buy_units append civilianBuyableUnits;
if(smm_ace)then{
	buy_units append [
		["ACE_Box_82mm_Mo_Combo",6000,{},"BASE",""] call PurchasableVehicle_create,
		["ACE_Box_82mm_Mo_HE",2000,{},"BASE",""] call PurchasableVehicle_create,
		["ACE_Box_82mm_Mo_Illum",4000,{},"BASE",""] call PurchasableVehicle_create,
		["ACE_Box_82mm_Mo_Smoke",200,{},"BASE",""] call PurchasableVehicle_create
		
	]
		
};


//when buying one of this vehicles, a respawn point for the players' side will be created and tracked
respawnVehicles = ["B_Truck_01_medical_F","I_Truck_02_medical_F"];


if(isClass(configfile >> "CfgPatches" >> "rhs_weapons"))then{diag_log "load RHS";
	call compile preprocessFileLineNumbers "smm_config\units_rhsarsenal.sqf";
};

buy_units = [buy_units,[],{[_x] call PurchasableVehicle_get_Price},"ASCEND"] call BIS_fnc_sortBy;
