//uses the vanilla launchers 
_rand_weapons = [];
{
	if((_x select [0,6]) == "launch")then{
		_rand_weapons pushBack _x;
	};
}forEach rand_weapons;
_niweapons = "(_x call smm_fnc_macrosIsGood) && (_x call smm_fnc_macrosIsWeapon) && (count (configName _x) > 3) && (((configName _x) select [0,3]) == 'hlc')" configClasses (configFile >> "CfgWeapons");
{
	_rand_weapons pushBack (configName _x);
}forEach _niweapons;
rand_weapons = _rand_weapons;

_niitems = "(_x call smm_fnc_macrosIsGood) and (_x call smm_fnc_macrosIsItem) and (_x call smm_is_not_thermal) && (count (configName _x) > 3) && ((configName _x) select [0,3]) == 'hlc'" configClasses (configFile >> "CfgWeapons");
{
	rand_items_two pushBack (configName _x);
}forEach _niitems;

// replace vanilla magazines

rand_magazines = ["hlc_30rnd_556x45_EPR",
"hlc_30rnd_556x45_SOST","hlc_30rnd_556x45_SPR","hlc_30rnd_556x45_S","hlc_30rnd_556x45_MDim","hlc_30rnd_556x45_TDim",
"hlc_50rnd_556x45_EPR","hlc_30Rnd_545x39_B_AK","hlc_30Rnd_545x39_t_ak","hlc_45Rnd_545x39_t_rpk","hlc_30Rnd_545x39_EP_ak",
"hlc_100Rnd_762x51_B_M60E4","hlc_100Rnd_762x51_M_M60E4","hlc_100Rnd_762x51_Mdim_M60E4","hlc_100Rnd_762x51_Barrier_M60E4",
"hlc_100Rnd_762x51_T_M60E4","hlc_10Rnd_303_B_enfield","hlc_10Rnd_303_T_enfield","hlc_10Rnd_303_AP_enfield","hlc_5Rnd_792_T_Kar98",
"hlc_5Rnd_792_AP_Kar98","hlc_32rnd_9x19_B_sten","hlc_12Rnd_45ACP_B_mk23","hlc_12Rnd_45ACP_S_mk23","hlc_12Rnd_45ACP_T_mk23",
"hlc_8Rnd_44mag_B_deagle","hlc_8Rnd_44mag_JHP_deagle","hlc_50Rnd_44mag_B_deagle","hlc_50Rnd_44mag_FUN",
"hlc_10rnd_12g_buck_S12","hlc_10rnd_12g_slug_S12","hlc_30Rnd_545x39_S_AK","hlc_60Rnd_545x39_t_rpk","hlc_30Rnd_762x39_b_ak",
"hlc_30Rnd_762x39_t_ak","hlc_30rnd_762x39_s_ak","hlc_45Rnd_762x39_t_rpk","hlc_45Rnd_762x39_m_rpk","hlc_75Rnd_762x39_m_rpk","hlc_VOG25_AK",
"hlc_GRD_White","hlc_GRD_Red","hlc_GRD_green","hlc_GRD_yellow","hlc_GRD_orange","hlc_GRD_purple","hlc_GRD_blue","29rnd_300BLK_STANAG",
"29rnd_300BLK_STANAG_T","29rnd_300BLK_STANAG_S","hlc_30Rnd_556x45_B_AUG","hlc_30Rnd_556x45_SOST_AUG","hlc_30Rnd_556x45_SPR_AUG",
"hlc_30Rnd_556x45_T_AUG","hlc_30Rnd_556x45_MDIM_AUG","hlc_30Rnd_556x45_TDIM_AUG","hlc_40Rnd_556x45_B_AUG","hlc_40Rnd_556x45_TDIM_AUG",
"hlc_40Rnd_556x45_SOST_AUG","hlc_40Rnd_556x45_SPR_AUG","hlc_25Rnd_9x19mm_M882_AUG","hlc_25Rnd_9x19mm_JHP_AUG","hlc_25Rnd_9x19mm_subsonic_AUG",
"hlc_20Rnd_762x51_B_fal","hlc_20Rnd_762x51_mk316_fal","hlc_20Rnd_762x51_barrier_fal","hlc_20Rnd_762x51_T_fal","hlc_20Rnd_762x51_TDim_fal",
"hlc_20Rnd_762x51_S_fal","hlc_50rnd_762x51_M_FAL","hlc_5rnd_300WM_FMJ_AWM","hlc_5rnd_300WM_AP_AWM","hlc_5rnd_300WM_T_AWM","hlc_5rnd_300WM_BTSP_AWM",
"hlc_5rnd_300WM_mk248_AWM","hlc_5rnd_300WM_SBT_AWM","hlc_30rnd_556x45_EPR_G36","hlc_30rnd_556x45_SOST_G36","hlc_30rnd_556x45_SPR_G36",
"hlc_100rnd_556x45_EPR_G36","hlc_30rnd_556x45_Tracers_G36","hlc_30rnd_556x45_TDIM_G36","hlc_30rnd_556x45_MDIM_G36","hlc_20rnd_762x51_b_G3",
"hlc_20rnd_762x51_Mk316_G3","hlc_20rnd_762x51_barrier_G3","hlc_20rnd_762x51_T_G3","hlc_20rnd_762x51_MDim_G3","hlc_50rnd_762x51_M_G3",
"hlc_50rnd_762x51_MDIM_G3","hlc_20rnd_762x51_IRDim_G3","hlc_20rnd_762x51_S_G3","hlc_30rnd_556x45_b_HK33","hlc_30rnd_556x45_t_HK33",
"hlc_30rnd_556x45_EPR_HK33","hlc_30rnd_556x45_SOST_HK33","hlc_30rnd_556x45_tdim_HK33","hlc_30rnd_556x45_mdim_HK33","hlc_20Rnd_762x51_B_M14",
"hlc_20Rnd_762x51_mk316_M14","hlc_20Rnd_762x51_barrier_M14","hlc_20Rnd_762x51_T_M14","hlc_20Rnd_762x51_Tdim_M14","hlc_20Rnd_762x51_Mdim_M14",
"hlc_50Rnd_762x51_B_M14","hlc_20Rnd_762x51_S_M14","hlc_50Rnd_792x57_B_MG42","hlc_100Rnd_792x57_B_MG42","hlc_200Rnd_792x57_B_MG42",
"hlc_50Rnd_792x57_M_MG42","hlc_100Rnd_792x57_M_MG42","hlc_200Rnd_792x57_M_MG42","hlc_50Rnd_792x57_T_MG42","hlc_100Rnd_792x57_T_MG42",
"hlc_200Rnd_792x57_T_MG42","hlc_50Rnd_792x57_AP_MG42","hlc_100Rnd_792x57_AP_MG42","hlc_200Rnd_792x57_AP_MG42","hlc_50Rnd_762x51_B_MG3",
"hlc_100Rnd_762x51_B_MG3","hlc_250Rnd_762x51_B_MG3","hlc_50Rnd_762x51_M_MG3","hlc_100Rnd_762x51_M_MG3","hlc_250Rnd_762x51_M_MG3",
"hlc_50Rnd_762x51_Barrier_MG3","hlc_100Rnd_762x51_Barrier_MG3","hlc_250Rnd_762x51_Barrier_MG3","hlc_50Rnd_762x51_T_MG3",
"hlc_100Rnd_762x51_T_MG3","hlc_250Rnd_762x51_T_MG3","hlc_30Rnd_9x19_B_MP5","hlc_30Rnd_9x19_GD_MP5","hlc_30Rnd_9x19_SD_MP5",
"hlc_30Rnd_10mm_B_MP5","hlc_30Rnd_10mm_JHP_MP5","hlc_200rnd_556x45_M_SAW","hlc_200rnd_556x45_T_SAW","hlc_200rnd_556x45_Mdim_SAW",
"hlc_200rnd_556x45_B_SAW","hlc_24Rnd_75x55_B_stgw","hlc_24Rnd_75x55_ap_stgw","hlc_20Rnd_762x51_b_amt","hlc_20Rnd_762x51_mk316_amt",
"hlc_20Rnd_762x51_bball_amt","hlc_20Rnd_762x51_T_amt","hlc_24Rnd_75x55_T_stgw","hlc_5rnd_3006_1903"];

rand_magazines append standalone_vanilla_explosives;
startWeapons = ["hlc_rifle_g3a3","hlc_smg_mp5a3","launch_RPG7_F"];