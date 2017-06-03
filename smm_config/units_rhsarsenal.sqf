ai_infantry = [

	[ 
		["rhs_msv_rifleman",10], ["rhs_msv_grenadier",15], ["rhs_msv_machinegunner",20],
		["rhs_msv_at",25],["rhs_msv_marksman",20], ["rhs_msv_sergeant",10],
		["rhs_msv_aa",25], ["rhs_msv_medic",10], ["rhs_vmf_recon_marksman",20], 
		["rhs_msv_combatcrew",10]
		
		 
	],
		
	[ 
		["rhsusf_army_ocp_rifleman_m4",10], ["rhsusf_army_ocp_grenadier",15], ["rhsusf_army_ocp_machinegunner",20],
		["rhsusf_army_ocp_javelin",25], ["rhsusf_army_ocp_marksman",20],["rhsusf_army_ocp_squadleader",10], 
		["rhsusf_army_ocp_aa",25],["rhsusf_army_ocp_medic",10],["rhsusf_army_ocp_sniper",20], 
		["rhsusf_army_ocp_combatcrewman",10]
		
	],

	[  
		["rhssaf_army_m10_para_rifleman_hk416",10],["rhssaf_army_m10_para_gl_m320",15],["rhssaf_army_m10_para_mgun_m84",20],
		["rhssaf_army_m10_para_spec_at",25],["rhssaf_army_m10_para_sniper_m76",20],["rhssaf_army_m10_para_sq_lead",10],
		["rhssaf_army_m10_para_spec_aa",25],["rhssaf_army_m10_para_medic",10],["rhssaf_army_m10_para_sniper_m82a1",20],
		["rhssaf_army_m10_para_officer",10]
	]

			];
			

ai_vehicles = [
	[
		["rhs_tigr_sts_msv",160], ["rhs_btr60_msv",220], ["rhs_bmd1k",110], ["rhs_zsu234_aa",300], ["rhs_t90a_tv",280], ["rhs_2s3_tv",300], ["rhs_Ka52_vvsc",370]
	],
	[
		["rhsusf_m1025_d_m2",150], ["rhsusf_m1025_d_Mk19",160], ["rhsusf_M1117_D",220], ["rhsusf_m113d_usarmy",110], ["rhsusf_cdf_b_zsu234",300], ["rhsusf_m1a2sep1tuskid_usarmy",280], ["rhsusf_m109d_usarmy",300],["rhsusf_AH64D",370]
	],
	[
		["rhsgref_cdf_reg_uaz_dshkm",150], ["rhsgref_cdf_reg_uaz_ags",160], ["rhsgref_cdf_reg_uaz_spg9",170], ["rhsgref_BRDM2",220], ["rhsgref_BRD2_ATGM",110], ["rhsgref_ins_g_zsu_234",300], ["rhsgref_cdf_t80bv_tv",280], ["rhsgref_cdf_Mi35",370]
	]
];

buy_units = [];
if(playerSide == west)then{
	buy_units = [
		["rhsusf_m1025_w_m2",  400],
		["rhsusf_m1025_w_mk19",500],
		["rhsusf_m1025_w",200],
		//["rhsusf_M1078A1P2_B_M2_wd_fmtv_usarmy",300],	//unfinished prototype
		//["rhsusf_M1078A1P2_B_M2_d_fmtv_usarmy",300],	//unfinished prototype
		["rhsusf_m998_w_2dr",150],
		["rhsusf_M1117_D",900],
		["rhsusf_M1237_M2_usarmy_d",550],
		["rhsusf_M1237_MK19_usarmy_d",600],
		["rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd",620],
		["rhsusf_M977A4_AMMO_BKIT_M2_usarmy_wd",700],
		["rhsusf_M978A4_usarmy_wd",630],
		["rhsusf_mrzr4_d",130],
		//["rhsusf_rg33_usmc_d",330],					//unfinished prototype
		//["rhsusf_rg33_m2_usmc_d",490],				//unfinished prototype
		["rhsusf_m113_usarmy_supply",880],
		["rhsusf_m113_usarmy_medical",950],
		["rhsusf_m113_usarmy_MK19",920],
		["rhsusf_m1a1fep_d",5500],
		["rhsusf_m1a1aim_tuski_wd",6500],
		["rhsusf_m1a2sep1tuskiiwd_usarmy",7000],
		["RHS_M2A2",2800],
		["RHS_M2A2_BUSKI",3000],
		["RHS_M2A3",3100],
		["RHS_M2A3_BUSKIII",3300],
		["RHS_AH1Z",2500],
		["RHS_AH64D",2700],
		["RHS_CH_47F",1340],
		["rhsusf_CH53E_USMC",1250],
		["RHS_MELB_H6M",870],
		["RHS_UH1Y",1700],
		["RHS_UH60M",1110],
		["RHS_UH60M_MEV",1440],
		["RHS_A10",2900],
		["RHS_C130J",1730],
		["rhsusf_f22",2750],
		["rhsusf_mkvsoc",410],
		["B_Boat_Transport_01_F",130],
		["rhsgref_cdf_b_zsu234",2000]
	];
};

if(playerSide == independent)then{
	buy_units = [
		["rhsgref_cdf_zsu234",3500],
		["rhsgref_cdf_btr60",2000],
		["rhsgref_cdf_btr70",2500],
		["rhsgref_cdf_reg_uaz_ags",350],
		["rhsgref_cdf_reg_uaz_dshkm",300],
		["rhsgref_cdf_reg_uaz_open",100],
		["rhsgref_cdf_reg_uaz_spg9",400],
		["rhsgref_cdf_bmp1",1100],
		["rhsgref_BRDM2",800],
		["rhsgref_BRDM2_ATGM",1200],
		["rhsgref_BRDM2UM",800],
		["rhsgref_cdf_t80bv_tv",4500],
		["rhsgref_cdf_gaz66",200],
		["rhsgref_cdf_gaz66_ammo",500],
		["rhsgref_cdf_gaz66_zu23",700],
		["rhsgref_cdf_ural_fuel",500],
		["I_Truck_02_medical_F",500],
		["rhsgref_cdf_Mi24D",1600],
		["rhsgref_cdf_reg_Mi17Sh_UPK",1300],
		["rhssaf_airforce_ht48",1100],
		["RHS_AN2",900],
		["rhsgref_cdf_su25",2300],
		["B_Boat_Transport_01_F",70]
		
		
			
	];
};