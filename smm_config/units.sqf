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
	[
		["O_Soldier_A_F",10,{}] call SpawnableInfantry_create,
		["O_Soldier_AAR_F",10,{}] call SpawnableInfantry_create,
		["O_Soldier_AR_F",15,{}] call SpawnableInfantry_create,
		["O_medic_F",15,{}] call SpawnableInfantry_create,
		["O_crew_F",10,{}] call SpawnableInfantry_create,
		["O_engineer_F",15,{}] call SpawnableInfantry_create,
		["O_soldier_exp_F",15,{}] call SpawnableInfantry_create,
		["O_Soldier_GL_F",10,{}] call SpawnableInfantry_create,
		["O_HeavyGunner_F",15,{}] call SpawnableInfantry_create,
		["O_soldier_M_F",15,{}] call SpawnableInfantry_create,
		["O_Soldier_AA_F",30,{}] call SpawnableInfantry_create,
		["O_Soldier_AT_F",30,{}] call SpawnableInfantry_create,
		["O_SOLDIER_REPAIR_F",15,{}] call SpawnableInfantry_create,
		["O_Urban_SHARPSHOOTER_F",15,{}] call SpawnableInfantry_create,
		["O_SOLDIER_SL_F",10,{}] call SpawnableInfantry_create,
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
		["O_SoldierU_AT_F",30,{}] call SpawnableInfantry_create,
		["O_SOLDIERU_REPAIR_F",15,{}] call SpawnableInfantry_create,
		["O_SHARPSHOOTER_F",15,{}] call SpawnableInfantry_create,
		["O_SOLDIERU_SL_F",10,{}] call SpawnableInfantry_create,
		["O_t_Soldier_A_F",10,{}] call SpawnableInfantry_create,
		["O_t_Soldier_AAR_F",10,{}] call SpawnableInfantry_create,
		["O_T_Soldier_AR_F",15,{}] call SpawnableInfantry_create,
		["O_t_medic_F",15,{}] call SpawnableInfantry_create,
		["O_t_crew_F",10,{}] call SpawnableInfantry_create,
		["O_t_engineer_F",15,{}] call SpawnableInfantry_create,
		["O_t_soldier_exp_F",15,{}] call SpawnableInfantry_create,
		["O_t_Soldier_GL_F",10,{}] call SpawnableInfantry_create,
		["O_t_soldier_M_F",15,{}] call SpawnableInfantry_create,
		["O_t_Soldier_AA_F",30,{}] call SpawnableInfantry_create,
		["O_t_Soldier_AT_F",30,{}] call SpawnableInfantry_create,
		["O_t_SOLDIER_REPAIR_F",15,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_A_F",10,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_AR_F",15,{}] call SpawnableInfantry_create,
		["O_G_MEDIC_F",15,{}] call SpawnableInfantry_create,
		["O_G_ENGINEER_F",15,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_EXP_F",15,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_GL_F",10,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_M_F",15,{}] call SpawnableInfantry_create,
		["O_G_SHARPSHOOTER_F",15,{}] call SpawnableInfantry_create,
		["O_G_SOLDIER_SL_F",10,{}] call SpawnableInfantry_create
	],
	[	
		["B_SOLDIER_A_F",10,{}] call SpawnableInfantry_create,
		["B_SOLDIER_AAR_F",10,{}] call SpawnableInfantry_create,
		["B_SOLDIER_AR_F",15,{}] call SpawnableInfantry_create,
		["B_MEDIC_F",15,{}] call SpawnableInfantry_create,
		["B_CREW_F",10,{}] call SpawnableInfantry_create,
		["B_engineer_f",15,{}] call SpawnableInfantry_create,
		["b_soldier_exp_f",15,{}] call SpawnableInfantry_create,
		["b_soldier_gl_f",10,{}] call SpawnableInfantry_create,
		["b_heavygunner_f",15,{}] call SpawnableInfantry_create,
		["b_soldier_m_f",15,{}] call SpawnableInfantry_create,
		["b_soldier_aa_f",30,{}] call SpawnableInfantry_create,
		["b_soldier_at_f",30,{}] call SpawnableInfantry_create,
		["b_soldier_repair_f",15,{}] call SpawnableInfantry_create,
		["b_sharpshooter_f",15,{}] call SpawnableInfantry_create,
		["b_soldier_sl_f",10,{}] call SpawnableInfantry_create,
		["B_G_soldier_a_f",10,{}] call SpawnableInfantry_create,
		["b_g_soldier_ar_f",15,{}] call SpawnableInfantry_create,
		["b_g_medic_f",15,{}] call SpawnableInfantry_create,
		["b_g_engineer_f",15,{}] call SpawnableInfantry_create,
		["b_g_soldier_exp_f",15,{}] call SpawnableInfantry_create,
		["b_g_soldier_gl_f",10,{}] call SpawnableInfantry_create,
		["b_g_soldier_m_f",15,{}] call SpawnableInfantry_create,
		["b_g_sharpshooter_f",15,{}] call SpawnableInfantry_create,
		["b_g_soldier_sl_f",10,{}] call SpawnableInfantry_create,
		["b_t_soldier_a_f",10,{}] call SpawnableInfantry_create,
		["B_t_SOLDIER_AAR_F",10,{}] call SpawnableInfantry_create,
		["B_t_SOLDIER_AR_F",15,{}] call SpawnableInfantry_create,
		["b_t_medic_f",15,{}] call SpawnableInfantry_create,
		["B_t_CREW_F",10,{}] call SpawnableInfantry_create,
		["B_t_engineer_f",15,{}] call SpawnableInfantry_create,
		["b_t_soldier_exp_f",15,{}] call SpawnableInfantry_create,
		["b_t_soldier_gl_f",10,{}] call SpawnableInfantry_create,
		["b_t_soldier_m_f",15,{}] call SpawnableInfantry_create,
		["b_t_soldier_aa_f",30,{}] call SpawnableInfantry_create,
		["b_t_soldier_at_f",30,{}] call SpawnableInfantry_create,
		["b_t_soldier_repair_f",15,{}] call SpawnableInfantry_create,
		["b_t_soldier_sl_f",10,{}]call SpawnableInfantry_create
	],
	[   
		["i_soldier_a_f",10,{}] call SpawnableInfantry_create,
		["i_soldier_aar_f",10,{}] call SpawnableInfantry_create,
		["i_soldier_ar_f",15,{}] call SpawnableInfantry_create,
		["i_medic_f",15,{}] call SpawnableInfantry_create,
		["i_crew_f",10,{}] call SpawnableInfantry_create,
		["i_engineer_f",15,{}] call SpawnableInfantry_create,
		["i_soldier_exp_f",15,{}] call SpawnableInfantry_create,
		["i_soldier_gl_f",10,{}] call SpawnableInfantry_create,
		["i_soldier_m_f",15,{}] call SpawnableInfantry_create,
		["i_soldier_aa_f",30,{}] call SpawnableInfantry_create,
		["i_soldier_at_f",30,{}] call SpawnableInfantry_create,
		["i_soldier_repair_f",30,{}]call SpawnableInfantry_create
    ]
];
};


ai_vehicles = [
	[
		["O_MRAP_02_gmg_F",150,{}] call SpawnableVehicle_create,
		["O_MRAP_02_hmg_F",160,{}] call SpawnableVehicle_create,
		["O_APC_Wheeled_02_rcws_F",220,{}] call SpawnableVehicle_create,
		["O_T_LSV_02_armed_F",120,{}] call SpawnableVehicle_create,
		["O_MBT_02_arty_F",280,{}] call SpawnableVehicle_create,
		["O_APC_Tracked_02_cannon_F",270,{}] call SpawnableVehicle_create,
		["O_APC_Tracked_02_AA_F",320,{}] call SpawnableVehicle_create,
		["O_MBT_02_cannon_F",350,{}] call SpawnableVehicle_create,
		["O_Heli_Attack_02_F",370,{}] call SpawnableVehicle_create
	],
	[
		["B_MRAP_01_gmg_F",150,{}] call SpawnableVehicle_create,
		["B_MRAP_01_hmg_F",160,{}] call SpawnableVehicle_create,
		["B_APC_Wheeled_01_cannon_F",220,{}] call SpawnableVehicle_create,
		["B_T_LSV_01_armed_F",110,{}] call SpawnableVehicle_create,
		["B_APC_Tracked_01_CRV_F",250,{}] call SpawnableVehicle_create,
		["B_APC_Tracked_01_AA_F",300,{}] call SpawnableVehicle_create,
		["B_APC_Tracked_01_rcws_F",240,{}] call SpawnableVehicle_create,
		["B_MBT_01_cannon_F",350,{}] call SpawnableVehicle_create,
		["B_MBT_01_arty_F",300,{}] call SpawnableVehicle_create,
		["B_MBT_01_mlrs_F",280,{}] call SpawnableVehicle_create,
		["B_Heli_Attack_01_F",370,{}] call SpawnableVehicle_create
	],
	[
		["I_APC_Wheeled_03_cannon_F",230,{}] call SpawnableVehicle_create,
		["I_APC_tracked_03_cannon_F",280,{}] call SpawnableVehicle_create,
		["I_MBT_03_cannon_F",400,{}] call SpawnableVehicle_create,
		["I_G_Offroad_01_armed_F",80,{}] call SpawnableVehicle_create,
		["I_MRAP_03_hmg_F",140,{}] call SpawnableVehicle_create,
		["I_MRAP_03_gmg_F",130,{}] call SpawnableVehicle_create
	]
];



civilianBuyableUnits = [
	["B_Boat_Transport_01_F",2000,{},"BASE",""] call PurchasableVehicle_create,
	["B_Quadbike_01_F",1800,{},"BASE",""] call PurchasableVehicle_create,
	["C_Boat_Civil_01_F",2500,{},"BASE",""] call PurchasableVehicle_create,
	["C_Offroad_01_F",4000,{},"BASE",""] call PurchasableVehicle_create,
	["C_Hatchback_01_sport_F",6000,{},"BASE",""] call PurchasableVehicle_create,
	["C_SUV_01_F",5500,{},"BASE",""] call PurchasableVehicle_create,
	["C_Van_01_transport_F",7000,{},"BASE",""] call PurchasableVehicle_create,
	["C_Van_01_fuel_F",12000,{},"BASE",""] call PurchasableVehicle_create,
	["C_Kart_01_F",1790,{},"BASE",""] call PurchasableVehicle_create,
	["C_Heli_Light_01_civil_F",22000,{},"CREWMAN",""] call PurchasableVehicle_create,
	["C_Plane_Civil_01_racing_F",13500,{},"BASE",""] call PurchasableVehicle_create
];

if(smm_ace)then{
	ace_units = [
			["ACE_Wheel",300,{},"BASE",""] call PurchasableVehicle_create,
			["ACE_Track",5000,{},"BASE",""] call PurchasableVehicle_create,
			//TODO change perk
			["ACE_Box_82mm_Mo_Combo",500,{},"MINES","[Box] Mortar Ammunition"] call PurchasableVehicle_create
	];
	private _vehicleMagazines = (("true" configClasses (configFile >> "CfgMagazines")) select {getNumber (_x >> "scope") == 2}) select {(configFile >> "CfgMagazines">>"VehicleMagazine") in(_x call BIS_fnc_returnParents)} ;
	private _displayNames = [];
	{
		private _name = getText(_x >> "displayName");
		_displayNames pushBackUnique _name;
	} forEach _vehicleMagazines;

	ace_units append (_displayNames apply {
		private _nameArray = toArray _x;
		private _hash = 0;
		if((count _nameArray) > 2)then{
			_hash = (_nameArray select 0) *5 + (_nameArray select 1) * 3 + (_nameArray select 2);
		};
		private _boxes  = ["Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","Box_IND_AmmoVeh_F"];
		private _box = _boxes select (_hash random (count _boxes));
		private _price = 3000 + (round(_hash random 200))*10;

		private _contents = "true" configClasses (configFile>> "CfgMagazines");
		private _dn = _x;
		
		_contents = _contents select {getText (_x >> "displayName") == _dn};

		private _boxName = "[Box] "  + _x;
		private _functionCode = "[_this,3000] call ace_rearm_fnc_setSupplyCount;";
		{
			_functionCode = _functionCode + (format ["[_this,'%1'] call ace_rearm_fnc_addMagazineToSupply;",configName _x]);
		}forEach _contents;
		[_box,_price,compile _functionCode,"MINES",_boxName] call PurchasableVehicle_create
	});

	civilianBuyableUnits append ace_units;
};


//call prurchaseble vehicles    ate
//["SUV_WEst",100,""] call PurchasableVehicle_create;
buy_units = [];
if(playerSide == west)then{
	buy_units = [
		["B_UGV_01_F",18000,{},"UAV_BLUFOR",""] call PurchasableVehicle_create,
		["B_UGV_01_rcws_F",33000,{},"UAV_BLUFOR",""] call PurchasableVehicle_create,
		["B_T_UAV_03_dynamicLoadout_F",75000,{},"UAV_BLUFOR",""] call PurchasableVehicle_create,
		["B_UAV_02_dynamicLoadout_F",50000,{},"UAV_BLUFOR",""] call PurchasableVehicle_create,
		["B_UAV_05_F",23000,{},"UAV_BLUFOR",""] call PurchasableVehicle_create,
		["B_Truck_01_transport_F",15000,{},"BASE",""] call PurchasableVehicle_create,
		["B_Truck_01_mover_F",13000,{},"BASE",""] call PurchasableVehicle_create,
		["B_Truck_01_Repair_F",22000,{},"BASE",""] call PurchasableVehicle_create,
		["B_Truck_01_ammo_F",25000,{},"BASE",""] call PurchasableVehicle_create,
		["B_Truck_01_fuel_F",24000,{},"BASE",""] call PurchasableVehicle_create,
		["B_Truck_01_medical_F",21000,{},"MEDIC",""] call PurchasableVehicle_create,
		["B_G_Offroad_01_armed_F",20000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MRAP_01_gmg_F",35000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MRAP_01_hmg_F",40000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Boat_Armed_01_minigun_F",32000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MBT_01_mlrs_F",160000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MBT_01_arty_F",300000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_MBT_01_cannon_F",89000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_APC_Tracked_01_AA_F",60000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_APC_Tracked_01_CRV_F",59000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_T_APC_Wheeled_01_cannon_F",51000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Heli_Transport_03_black_F",35000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Plane_Fighter_01_F",55000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Plane_CAS_01_dynamicLoadout_F",65000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Heli_Transport_01_camo_F",35000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Heli_Attack_01_F",240000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Heli_Light_01_stripped_F",30000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_Heli_Light_01_armed_F",45000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_T_LSV_01_armed_F",16000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_LSV_01_unarmed_F",7000,{},"BASE",""] call PurchasableVehicle_create,
		["B_T_VTOL_01_armed_F",90000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["B_T_VTOL_01_infantry_F",60000,{},"CREWMAN",""] call PurchasableVehicle_create
	];
};
if(playerSide == independent)then{
	buy_units = [
		["I_UGV_01_F",30000,{},"UAV_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_UGV_01_rcws_F",50000,{},"UAV_INDEPENDENT",""] call PurchasableVehicle_create,
		["I_Heli_Transport_02_F",29000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_Heli_light_03_dynamicLoadout_F",42000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_Heli_light_03_unarmed_F",25000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_Plane_Fighter_03_dynamicLoadout_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_Plane_Fighter_04_F",56000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_APC_tracked_03_cannon_F",50000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_MBT_03_cannon_F",99000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_Boat_Armed_01_minigun_F",28000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_UAV_02_dynamicLoadout_F",49000,{},"UAV_INDEPENDENT",""] call PurchasableVehicle_create,
		
		["I_G_Offroad_01_armed_F",12000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_C_Offroad_02_unarmed_F",3500,{},"BASE",""] call PurchasableVehicle_create,
		["I_MRAP_03_F",22000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_MRAP_03_hmg_F",28000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["I_MRAP_03_gmg_F",29000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Truck_02_box_F",7000,{},"BASE",""] call PurchasableVehicle_create,
		["I_Truck_02_ammo_F",15000,{},"BASE",""] call PurchasableVehicle_create,
		["I_Truck_02_medical_F",12000,{},"MEDIC",""] call PurchasableVehicle_create,
		["I_Truck_02_fuel_F",37000,{},"BASE",""] call PurchasableVehicle_create,
		["I_APC_Wheeled_03_cannon_F",52000,{},"CREWMAN",""] call PurchasableVehicle_create
	];
};
if(playerSide == east)then{
	buy_units = [
		["O_UGV_01_F",30000,{},"UAV_OPFOR",""] call PurchasableVehicle_create,
		["O_UGV_01_rcws_F",50000,{},"UAV_OPFOR",""] call PurchasableVehicle_create,
		["O_UAV_02_dynamicLoadout_F",60000,{},"UAV_OPFOR",""] call PurchasableVehicle_create,
		["O_T_UAV_04_CAS_F",55000,{},"UAV_OPFOR",""] call PurchasableVehicle_create,
		["O_Truck_03_transport_F",15000,{},"BASE",""] call PurchasableVehicle_create,
		["O_Truck_03_covered_F",13000,{},"BASE",""] call PurchasableVehicle_create,
		["O_Truck_03_repair_F",22000,{},"BASE",""] call PurchasableVehicle_create,
		["O_Truck_03_ammo_F",25000,{},"BASE",""] call PurchasableVehicle_create,
		["O_Truck_03_fuel_F",24000,{},"BASE",""] call PurchasableVehicle_create,
		["O_Truck_03_medical_F",21000,{},"MEDIC",""] call PurchasableVehicle_create,
		["O_G_Offroad_01_armed_F",30000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_MRAP_02_gmg_ghex_F",35000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_MRAP_02_hmg_ghex_F",40000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_Boat_Armed_01_hmg_F",32000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_MBT_02_cannon_ghex_F",160000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_MBT_02_arty_ghex_F",300000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_APC_Tracked_02_AA_F",60000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_APC_Tracked_02_cannon_F",59000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_APC_Wheeled_02_rcws_F",51000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Heli_Transport_04_F",45000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Heli_Transport_04_ammo_F",55000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Heli_Transport_04_repair_F",55000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["Land_Pod_Heli_Transport_04_bench_F",5000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["Land_Pod_Heli_Transport_04_covered_F",7000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["Land_Pod_Heli_Transport_04_medevac_F",7000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Plane_Fighter_02_F",150000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Plane_CAS_02_dynamicLoadout_F",220000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Heli_Attack_02_F",240000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Heli_Light_02_unarmed_F",30000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_Heli_Light_02_dynamicLoadout_F",45000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_LSV_02_armed_F",16000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_LSV_02_unarmed_F",7000,{},"BASE",""] call PurchasableVehicle_create,
		["O_T_VTOL_02_infantry_dynamicLoadout_F",75000,{},"CREWMAN",""] call PurchasableVehicle_create,
		["O_T_VTOL_02_vehicle_dynamicLoadout_F",75000,{},"CREWMAN",""] call PurchasableVehicle_create
	];
};
buy_units append civilianBuyableUnits;

//when buying one of this vehicles, a respawn point for the players' side will be created and tracked
respawnVehicles = ["B_Truck_01_medical_F","I_Truck_02_medical_F"];


if(isClass(configfile >> "CfgPatches" >> "rhs_weapons"))then{diag_log "load RHS";
	call compile preprocessFileLineNumbers "smm_config\units_rhsarsenal.sqf";
};

buy_units = [buy_units,[],{[_x] call PurchasableVehicle_get_Price},"ASCEND"] call BIS_fnc_sortBy;

