ai_infantry = [

	[ 
		["rhs_msv_rifleman",10,{}] call SpawnableInfantry_create,
		["rhs_msv_grenadier",15,{}] call SpawnableInfantry_create,
		["rhs_msv_machinegunner",20,{}] call SpawnableInfantry_create,
		["rhs_msv_at",25,{}] call SpawnableInfantry_create,
		["rhs_msv_marksman",20,{}] call SpawnableInfantry_create,
		["rhs_msv_sergeant",10,{}] call SpawnableInfantry_create,
		["rhs_msv_aa",25,{}] call SpawnableInfantry_create,
		["rhs_msv_medic",10,{}] call SpawnableInfantry_create,
		["rhs_vmf_recon_marksman",20,{}] call SpawnableInfantry_create, 
		["rhs_msv_combatcrew",10,{}] call SpawnableInfantry_create
		
		 
	],
		
	[ 
		["rhsusf_army_ocp_rifleman_m4",10,{}] call SpawnableInfantry_create,
		["rhsusf_army_ocp_grenadier",15,{}] call SpawnableInfantry_create,
		["rhsusf_army_ocp_machinegunner",20,{}] call SpawnableInfantry_create,
		["rhsusf_army_ocp_javelin",25,{}] call SpawnableInfantry_create, 
		["rhsusf_army_ocp_marksman",20,{}] call SpawnableInfantry_create,
		["rhsusf_army_ocp_squadleader",10,{}] call SpawnableInfantry_create, 
		["rhsusf_army_ocp_aa",25,{}] call SpawnableInfantry_create,
		["rhsusf_army_ocp_medic",10,{}] call SpawnableInfantry_create,
		["rhsusf_army_ocp_sniper",20,{}] call SpawnableInfantry_create, 
		["rhsusf_army_ocp_combatcrewman",10,{}] call SpawnableInfantry_create
		
	],

	[  
		["rhssaf_army_m10_para_rifleman_hk416",10,{}] call SpawnableInfantry_create,
		["rhssaf_army_m10_para_gl_m320",15,{}] call SpawnableInfantry_create,
		["rhssaf_army_m10_para_mgun_m84",20,{}] call SpawnableInfantry_create,
		["rhssaf_army_m10_para_spec_at",25,{}] call SpawnableInfantry_create,
		["rhssaf_army_m10_para_sniper_m76",20,{}] call SpawnableInfantry_create,
		["rhssaf_army_m10_para_sq_lead",10,{}] call SpawnableInfantry_create,
		["rhssaf_army_m10_para_spec_aa",25,{}] call SpawnableInfantry_create,
		["rhssaf_army_m10_para_medic",10,{}] call SpawnableInfantry_create,
		["rhssaf_army_m10_para_sniper_m82a1",20,{}] call SpawnableInfantry_create,
		["rhssaf_army_m10_para_officer",10,{}] call SpawnableInfantry_create
	]

			];
			

ai_vehicles = [
	[
		["rhs_tigr_sts_msv",160,{}] call SpawnableInfantry_create, 
		["rhs_btr60_msv",220,{}] call SpawnableInfantry_create, 
		["rhs_bmd1k",110,{}] call SpawnableInfantry_create,
		["rhs_zsu234_aa",300,{}] call SpawnableInfantry_create,
		["rhs_t90a_tv",280,{}] call SpawnableInfantry_create, 
		["rhs_2s3_tv",300,{}] call SpawnableInfantry_create, 
		["rhs_Ka52_vvsc",370,{}] call SpawnableInfantry_create
	],
	[
		["rhsusf_m1025_d_m2",150,{}] call SpawnableInfantry_create,
		["rhsusf_m1025_d_Mk19",160,{}] call SpawnableInfantry_create,
		["rhsusf_M1117_D",220,{}] call SpawnableInfantry_create,
		["rhsusf_m113d_usarmy",110,{}] call SpawnableInfantry_create,
		["rhsusf_cdf_b_zsu234",300,{}] call SpawnableInfantry_create,
		["rhsusf_m1a2sep1tuskid_usarmy",280,{}] call SpawnableInfantry_create,
		["rhsusf_m109d_usarmy",300,{}] call SpawnableInfantry_create,
		["rhsusf_AH64D",370,{}] call SpawnableInfantry_create
	],
	[
		["rhsgref_cdf_reg_uaz_dshkm",150,{}] call SpawnableInfantry_create,
		["rhsgref_cdf_reg_uaz_ags",160,{}] call SpawnableInfantry_create,
		["rhsgref_cdf_reg_uaz_spg9",170,{}] call SpawnableInfantry_create,
		["rhsgref_BRDM2",220,{}] call SpawnableInfantry_create,
		["rhsgref_BRD2_ATGM",110,{}] call SpawnableInfantry_create, 
		["rhsgref_ins_g_zsu_234",300,{}] call SpawnableInfantry_create,
		["rhsgref_cdf_t80bv_tv",280,{}] call SpawnableInfantry_create, 
		["rhsgref_cdf_Mi35",370,{}] call SpawnableInfantry_create
	]
];

buy_units = [];
if(playerSide == west)then{
	buy_units = [
		["rhsusf_m1025_w_m2",  400] call PurchasableVehicle_create,
		["rhsusf_m1025_w_mk19",500] call PurchasableVehicle_create,
		["rhsusf_m1025_w",200] call PurchasableVehicle_create,
		//["rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy",300],	//unfinished prototype
		//["rhsusf_M1078A1P2_B_M2_d_fmtv_usarmy",300],	//unfinished prototype
		["rhsusf_m998_w_2dr",150] call PurchasableVehicle_create,
		["rhsusf_M1117_D",900] call PurchasableVehicle_create,
		["rhsusf_M1237_M2_usarmy_d",550] call PurchasableVehicle_create,
		["rhsusf_M1237_MK19_usarmy_d",600] call PurchasableVehicle_create,
		["rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd",620] call PurchasableVehicle_create,
		["rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd",700] call PurchasableVehicle_create,
		["rhsusf_M978A4_usarmy_wd",630] call PurchasableVehicle_create,
		["rhsusf_mrzr4_d",130] call PurchasableVehicle_create,
		//["rhsusf_rg33_usmc_d",330],					//unfinished prototype
		//["rhsusf_rg33_m2_usmc_d",490],				//unfinished prototype
		["rhsusf_m113_usarmy_supply",880] call PurchasableVehicle_create,
		["rhsusf_m113_usarmy_medical",950] call PurchasableVehicle_create,
		["rhsusf_m113_usarmy_MK19",920] call PurchasableVehicle_create,
		["rhsusf_m1a1fep_d",5500] call PurchasableVehicle_create,
		["rhsusf_m1a1aim_tuski_wd",6500] call PurchasableVehicle_create,
		["rhsusf_m1a2sep1tuskiiwd_usarmy",7000] call PurchasableVehicle_create,
		["RHS_M2A2",2800] call PurchasableVehicle_create,
		["RHS_M2A2_BUSKI",3000] call PurchasableVehicle_create,
		["RHS_M2A3",3100] call PurchasableVehicle_create,
		["RHS_M2A3_BUSKIII",3300] call PurchasableVehicle_create,
		["RHS_AH1Z",2500] call PurchasableVehicle_create,
		["RHS_AH64D",2700] call PurchasableVehicle_create,
		["RHS_CH_47F",1340] call PurchasableVehicle_create,
		["rhsusf_CH53E_USMC",1250] call PurchasableVehicle_create,
		["RHS_MELB_H6M",870] call PurchasableVehicle_create,
		["RHS_UH1Y",1700] call PurchasableVehicle_create,
		["RHS_UH60M",1110] call PurchasableVehicle_create,
		["RHS_UH60M_MEV",1440] call PurchasableVehicle_create,
		["RHS_A10",2900] call PurchasableVehicle_create,
		["RHS_C130J",1730] call PurchasableVehicle_create,
		["rhsusf_f22",2750] call PurchasableVehicle_create,
		["rhsusf_mkvsoc",410] call PurchasableVehicle_create,
		["B_Boat_Transport_01_F",130] call PurchasableVehicle_create,
		["rhsgref_cdf_b_zsu234",2000] call PurchasableVehicle_create
	];
};

if(playerSide == independent)then{
	buy_units = [
		["rhsgref_cdf_zsu234",3500] call PurchasableVehicle_create,
		["rhsgref_cdf_btr60",2000] call PurchasableVehicle_create,
		["rhsgref_cdf_btr70",2500] call PurchasableVehicle_create,
		["rhsgref_cdf_reg_uaz_ags",350] call PurchasableVehicle_create,
		["rhsgref_cdf_reg_uaz_dshkm",300] call PurchasableVehicle_create,
		["rhsgref_cdf_reg_uaz_open",100] call PurchasableVehicle_create,
		["rhsgref_cdf_reg_uaz_spg9",400] call PurchasableVehicle_create,
		["rhsgref_cdf_bmp1",1100] call PurchasableVehicle_create,
		["rhsgref_BRDM2",800] call PurchasableVehicle_create,
		["rhsgref_BRDM2_ATGM",1200] call PurchasableVehicle_create,
		["rhsgref_BRDM2UM",800] call PurchasableVehicle_create,
		["rhsgref_cdf_t80bv_tv",4500] call PurchasableVehicle_create,
		["rhsgref_cdf_gaz66",200] call PurchasableVehicle_create,
		["rhsgref_cdf_gaz66_ammo",500] call PurchasableVehicle_create,
		["rhsgref_cdf_gaz66_zu23",700] call PurchasableVehicle_create,
		["rhsgref_cdf_ural_fuel",500] call PurchasableVehicle_create,
		["I_Truck_02_medical_F",500] call PurchasableVehicle_create,
		["rhsgref_cdf_Mi24D",1600] call PurchasableVehicle_create,
		["rhsgref_cdf_reg_Mi17Sh_UPK",1300] call PurchasableVehicle_create,
		["rhssaf_airforce_ht48",1100] call PurchasableVehicle_create,
		["RHS_AN2",900] call PurchasableVehicle_create,
		["rhsgref_cdf_su25",2300] call PurchasableVehicle_create,
		["B_Boat_Transport_01_F",70] call PurchasableVehicle_create
		
		
			
	];
};