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
		["b_sharpshooter_f",15,{}] call SpawnableInfantry_create
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
		["B_soldier_LAT_F",30,{}] call SpawnableInfantry_create,
		["B_t_soldier_LAT_F",30,{}] call SpawnableInfantry_create
		*/
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

	["C_Boat_Civil_01_F",2500,{},"BASE",""] call PurchasableVehicle_create
	//["C_Offroad_01_F",4000,{},"BASE",""] call PurchasableVehicle_create,
	//["C_Hatchback_01_sport_F",6000,{},"BASE",""] call PurchasableVehicle_create,
	//["C_SUV_01_F",5500,{},"BASE",""] call PurchasableVehicle_create,
	//["C_Van_01_transport_F",7000,{},"BASE",""] call PurchasableVehicle_create,
	//["C_Van_01_fuel_F",12000,{},"BASE",""] call PurchasableVehicle_create,
	//["C_Kart_01_F",1790,{},"BASE",""] call PurchasableVehicle_create,
	//["C_Heli_Light_01_civil_F",22000,{},"CREWMAN",""] call PurchasableVehicle_create,
	//["C_Plane_Civil_01_racing_F",13500,{},"BASE",""] call PurchasableVehicle_create
];

if(smm_ace)then{
	ace_units = [
			["ACE_Wheel",300,{},"BASE",""] call PurchasableVehicle_create,
			["ACE_Track",5000,{},"BASE",""] call PurchasableVehicle_create,
			//TODO change perk
			["ACE_Box_82mm_Mo_Combo",500,{},"MINES","[Box] Mortar Ammunition"] call PurchasableVehicle_create
	];
};


//call prurchaseble vehicles    ate
//["SUV_WEst",100,""] call PurchasableVehicle_create;
buy_units = [];
if(playerSide == west)then{
	buy_units = [
		["B_Boat_Transport_01_F",2000,{},"BASE",""] call PurchasableVehicle_create,
		["B_Quadbike_01_F",1800,{},"BASE",""] call PurchasableVehicle_create,
		["B_LSV_01_unarmed_F",3500,{},"BASE",""] call PurchasableVehicle_create, //APEX
		["B_LSV_01_armed_F",7000,{},"BASE",""] call PurchasableVehicle_create,	//APEX
		["B_MRAP_01_F",6000,{},"BASE",""] call PurchasableVehicle_create,

		//UAV Terminal
		["B_UGV_01_F",2000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_UGV_01_rcws_F",30000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
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
		["B_Heli_Transport_03_F",20000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_Heli_Transport_03_unarmed_F",25000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,
		["B_Heli_Transport_01_F",30000,{},"LOGISTIC_BLUFOR",""] call PurchasableVehicle_create,

		//Car
		["B_MRAP_01_hmg_F",8000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MRAP_01_gmg_F",12000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//Boat
		["B_Boat_Armed_01_minigun_F",30000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//APC
		["B_APC_Tracked_01_CRV_F",30000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_APC_Tracked_01_rcws_F",31000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_APC_Wheeled_01_cannon_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_AFV_Wheeled_01_cannon_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_AFV_Wheeled_01_UP_cannon_F",60000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//APC anti air
		["B_APC_Tracked_01_AA_F",60000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT
		["B_MBT_01_cannon_F",90000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MBT_01_TUSK_F",120000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT arillery
		["B_MBT_01_arty_F",300000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MBT_01_mlrs_F",160000,{},"CREWMAN",""] call PurchasableVehicle_create,
	
		//Plane 
		["B_Plane_Fighter_01_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Plane_Fighter_01_Stealth_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Plane_CAS_01_dynamicLoadout_F",60000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		//Heli CREWMAN
		["B_Heli_Attack_01_dynamicLoadout_F",240000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Heli_Light_01_stripped_F",30000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Heli_Light_01_armed_F",45000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//VTOL 
		["B_T_VTOL_01_armed_F",58000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_T_VTOL_01_infantry_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_T_VTOL_01_vehicle_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create
	];
};
if(playerSide == independent)then{
	buy_units = [
		["I_Boat_Transport_01_F",2000,{},"BASE",""] call PurchasableVehicle_create,
		["I_Quadbike_01_F",1800,{},"BASE",""] call PurchasableVehicle_create,
		["I_C_Offroad_02_unarmed_F",3000,{},"BASE",""] call PurchasableVehicle_create, //APEX
		["I_C_Offroad_02_LMG_F",6000,{},"BASE",""] call PurchasableVehicle_create,	//APEX
		["I_MRAP_03_F",6000,{},"BASE",""] call PurchasableVehicle_create,

		//UAV Terminal
		["I_UGV_01_F",2000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_UGV_01_rcws_F",30000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_UAV_02_dynamicLoadout_F",40000,{[_this,true] call smm_fnc_clearVehiclePylons;},"UAV_INDEPENDENT",""] call PurchasableVehicle_create,

		["I_Truck_02_ammo_F",15000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		//no box truck
		["I_Truck_02_fuel_F",15000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_Truck_02_medical_F",20000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		// box is repair truck 
		["I_Truck_02_box_F",20000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,	
		["I_Truck_02_transport_F",5000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,

		//Heli
		["I_Heli_Transport_02_F",30000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_Heli_light_03_unarmed_F",20000,{},"LOGISTIC_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_Heli_light_03_dynamicLoadout_F",40000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,

		//Car
		["I_MRAP_03_gmg_F",7000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_MRAP_03_hmg_F",10000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_C_Offroad_02_AT_F",6000,{},"BASE",""] call PurchasableVehicle_create,	//APEX
		//Boat
		["I_Boat_Armed_01_minigun_F",25000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//APC
		["I_APC_Wheeled_03_cannon_F",20000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_APC_tracked_03_cannon_F",25000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//anti air
		["I_LT_01_AA_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT
		["I_LT_01_AT_F",40000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_LT_01_scout_F",25000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_LT_01_cannon_F",60000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_MBT_03_cannon_F",80000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT arillery
		["I_Truck_02_MRL_F",70000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//Plane
		["I_Plane_Fighter_03_dynamicLoadout_F",40000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		["I_Plane_Fighter_04_F",46000,{},"CREWMAN",""] call PurchasableVehicle_create
			
	];
};
if(playerSide == east)then{
	buy_units = [
		["O_Boat_Transport_01_F",2000,{},"BASE",""] call PurchasableVehicle_create,
		["O_Quadbike_01_F",1800,{},"BASE",""] call PurchasableVehicle_create,
		["O_LSV_02_unarmed_F",3500,{},"BASE",""] call PurchasableVehicle_create, //APEX
		["O_LSV_02_armed_F",7000,{},"BASE",""] call PurchasableVehicle_create,	//APEX
		["O_MRAP_02_F",6000,{},"BASE",""] call PurchasableVehicle_create,

		//UAV Terminal
		["O_UGV_01_F",2000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_UGV_01_rcws_F",30000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_UAV_02_dynamicLoadout_F",40000,{[_this,true] call smm_fnc_clearVehiclePylons;},"UAV_OPFOR",""] call PurchasableVehicle_create,
		["O_T_UAV_04_CAS_F",50000,{},"UAV_OPFOR",""] call PurchasableVehicle_create,


		["O_Truck_03_ammo_F",15000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		//no box truck
		["O_Truck_03_fuel_F",5000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Truck_03_medical_F",20000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Truck_03_repair_F",20000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Truck_03_transport_F",5000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,

		//Heli
		["O_Heli_Transport_04_F",20000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Heli_Transport_04_ammo_F",55000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Heli_Transport_04_repair_F",55000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Heli_Transport_04_bench_F",30000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["O_Heli_Light_02_unarmed_F",30000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,

		["Land_Pod_Heli_Transport_04_bench_F",5000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["Land_Pod_Heli_Transport_04_covered_F",7000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,
		["Land_Pod_Heli_Transport_04_medevac_F",7000,{},"LOGISTIC_OPFOR",""] call PurchasableVehicle_create,

		// Car
		["O_MRAP_02_hmg_F",8000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_MRAP_02_gmg_F",12000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//Boat
		["O_Boat_Armed_01_hmg_F",30000,{},"CREWMAN",""] call PurchasableVehicle_create,
		// APC
		["O_APC_Wheeled_02_rcws_F",31000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_APC_Tracked_02_cannon_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		// Anti-Air
		["O_APC_Tracked_02_AA_F",60000,{},"CREWMAN",""] call PurchasableVehicle_create,
		//MBT
		["O_MBT_02_cannon_F",130000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_MBT_04_cannon_F",160000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_MBT_04_command_F",200000,{},"CREWMAN",""] call PurchasableVehicle_create,	
		// MBT Arillery
		["O_MBT_02_arty_F",300000,{},"CREWMAN",""] call PurchasableVehicle_create,

		// Plane
		["O_Plane_Fighter_02_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Plane_Fighter_02_Stealth_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Plane_CAS_02_dynamicLoadout_F",60000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		//Heli CREWMAN
		["O_Heli_Attack_02_dynamicLoadout_F",240000,{},"CREWMAN",""] call PurchasableVehicle_create,	
		["O_Heli_Light_02_dynamicLoadout_F",45000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		//VTOL
		["O_T_VTOL_02_infantry_dynamicLoadout_F",70000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_VTOL_02_vehicle_dynamicLoadout_F",70000,{[_this,true] call smm_fnc_clearVehiclePylons;},"CREWMAN",""] call PurchasableVehicle_create
	];
};
buy_units append civilianBuyableUnits;

//when buying one of this vehicles, a respawn point for the players' side will be created and tracked
respawnVehicles = ["B_Truck_01_medical_F","I_Truck_02_medical_F"];


if(isClass(configfile >> "CfgPatches" >> "rhs_weapons"))then{diag_log "load RHS";
	call compile preprocessFileLineNumbers "smm_config\units_rhsarsenal.sqf";
};

buy_units = [buy_units,[],{[_x] call PurchasableVehicle_get_Price},"ASCEND"] call BIS_fnc_sortBy;
