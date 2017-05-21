startWeapons   = ["hgun_ACPC2_F","SMG_05_F","arifle_AKM_F","SMG_02_F","launch_RPG7_F"];
startMagazines = ["9Rnd_45ACP_Mag","30Rnd_9x21_Mag_SMG_02_Tracer_Green","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_9x21_Mag_SMG_02","RPG7_F"];
startItems     = ["ItemGPS","FirstAidKit"];
startBackpacks = ["B_Bergen_rgr"];


rand _weapons = [
					"rhs_weap_ak74m","rhs_weap_asval","rhs_weap_asval_grip","rhs_weap_asval_npz","rhs_weap_asval_grip_npz","rhs_weap_vss","rhs_weap_vss_grip",
					"rhs_weap_vss_npz","rhs_weap_vss_grip_npz","rhs_weap_ak74m_zenitco01","rhs_weap_ak74m_zenitco01_grip1","rhs_weap_ak74m_zenitco01_afg",
					"rhs_weap_ak74m_zenitco01_npz","rhs_weap_ak74m_zenitco01_npz_grip1","rhs_weap_ak74m_zenitco01_npz_afg","rhs_weap_ak74m_zenitco01_b33"
					"rhs_weap_ak74m_zenitco01_b33_grip1","rhs_weap_ak74m_zenitco01_b33_afg","rhs_weap_ak74mr","rhs_weap_ak74mr_grip1","rhs_weap_ak74mr_afg",
					"rhs_weap_ak74mr_gp25","rhs_weap_ak105","rhs_weap_ak105_zenitco01","rhs_weap_ak105_zenitco01_grip1","rhs_weap_ak105_zenitco01_afg",
					"rhs_weap_ak105_zenitco01_npz","rhs_weap_ak105_zenitco01_npz_grip1","rhs_weap_ak105_zenitco01_npz_afg","rhs_weap_ak105_npz",
					"rhs_weap_ak105_zenitco01_b33","rhs_weap_ak105_zenitco01_b33_grip1","rhs_weap_ak105_zenitco01_b33_afg","rhs_weap_ak74m_camo","rhs_weap_ak74m_npz",
					"rhs_weap_ak74m_desert_npz","rhs_weap_ak74m_camo_npz","rhs_weap_akm","rhs_weap_akm_gp25","rhs_weap_akms","rhs_weap_akms_gp25","rhs_weap_ak103",
					"rhs_weap_ak104","rhs_weap_ak104_npz","rhs_weap_ak104_zenitco01","rhs_weap_ak104_zenitco01_grip1","rhs_weap_ak104_zenitco01_afg",
					"rhs_weap_ak104_zenitco01_npz","rhs_weap_ak104_zenitco01_npz_grip1","rhs_weap_ak104_zenitco01_npz_afg","rhs_weap_ak104_zenitco01_b33",
					"rhs_weap_ak104_zenitco01_b33_grip1","rhs_weap_ak104_zenitco01_b33_afg","rhs_weap_ak103_npz","rhs_weap_ak103_zenitco01","rhs_weap_ak103_zenitco01_grip1",
					"rhs_weap_ak103_zenitco01_afg","rhs_weap_ak103_zenitco01_npz","rhs_weap_ak103_zenitco01_npz_grip1","rhs_weap_ak103_zenitco01_npz_afg","rhs_weap_ak103_zenitco01_b33",
					"rhs_weap_ak103_zenitco01_b33_grip1","rhs_weap_ak103_zenitco01_b33_afg","rhs_weap_ak103_1","rhs_weap_ak103_1_npz","rhs_weap_ak103_2",
					"rhs_weap_ak103_2_npz","rhs_weap_ak103_gp25","rhs_weap_ak103_gp25_npz","rhs_weap_ak74m_2mag","rhs_weap_ak74m_2mag_npz","rhs_weap_ak74m_2mag_camo_npz",
					"rhs_weap_ak74m_2mag_camo","rhs_weap_ak74m_desert","rhs_weap_ak74m_plummag","rhs_weap_ak74m_plummag_npz","rhs_weap_ak74m_gp25","rhs_weap_ak74m_gp25_npz",
					"rhs_weap_ak74m_fullplum","rhs_weap_ak74m_fullplum_npz","rhs_weap_ak74m_fullplum_gp25","rhs_weap_ak74m_fullplum_gp25_npz","rhs_weap_ak74","rhs_weap_ak74_gp25",
					"rhs_weap_ak74n","rhs_weap_ak74n_gp25","rhs_weap_ak74n_npz","rhs_weap_ak74n_gp25_npz","rhs_weap_ak74_2","rhs_weap_ak74_3","rhs_weap_aks74","rhs_weap_aks74_2",
					"rhs_weap_aks74_gp25","rhs_weap_aks74n","rhs_weap_aks74n_npz","rhs_weap_aks74n_gp25","rhs_weap_aks74n_gp25_npz","rhs_weap_aks74u","rhs_weap_aks74un","rhs_weap_svdp",
					"rhs_weap_svdp_npz","rhs_weap_svdp_wd","rhs_weap_svdp_wd_npz","rhs_weap_svds","rhs_weap_svds_npz","rhs_weap_t5000","rhs_weap_pp2000","rhs_weap_pp2000_folded","rhs_weap_pya",
					"rhs_weap_rsp30_white","rhs_weap_rsp30_red","rhs_weap_rsp30_green","rhs_weap_tr8","rhs_weap_makarov_pm","rhs_weap_pkp","rhs_weap_pkm","rhs_weap_rpg26","rhs_weap_rshg2",
					"rhs_weap_rpg7","rhs_weap_igla","rhs_weap_kar98k","rhs_weap_m38","rhs_weap_m38_rail","rhs_weap_m70ab2","rhs_weap_m70b1","rhs_weap_m92","rhs_weap_m76","rhs_weap_m21a",
					"rhs_weap_m21a_pr","rhs_weap_m21s","rhs_weap_m21s_pr","rhs_weap_savz61","rhs_weap_M320","rhs_weap_XM2010","rhs_weap_XM2010_d","rhs_weap_XM2010_wd","rhs_weap_XM2010_sa",
					"rhs_weap_m24sws","rhs_weap_m24sws_blk","rhs_weap_m24sws_ghillie","rhs_weap_m40a5","rhs_weap_m40a5_d","rhs_weap_m40a5_wd","rhs_weap_m4","rhs_weap_m4_pmag","rhs_weap_m4_mstock",
					"rhs_weap_m4_carryhandle","rhs_weap_m4_carryhandle_pmag","rhs_weap_m4_carryhandle_mstock","rhs_weap_m4_m320","rhs_weap_m4_m203","rhs_weap_m4_m203S","rhs_weap_m4a1","rhs_weap_m4a1_d",
					"rhs_weap_m4a1_mstock","rhs_weap_m4a1_d_mstock","rhs_weap_m4a1_pmag","rhs_weap_m4a1_carryhandle","rhs_weap_m4a1_carryhandle_mstock","rhs_weap_m4a1_carryhandle_pmag",
					"rhs_weap_m4a1_m203","rhs_weap_m4a1_m203s","rhs_weap_m4a1_m203s_d","rhs_weap_m4a1_carryhandle_m203","rhs_weap_m4a1_carryhandle_m203S","rhs_weap_m4a1_m320","rhs_weap_mk18",
					"rhs_weap_mk18_bk","rhs_weap_mk18_wd","rhs_weap_mk18_d","rhs_weap_mk18_KAC","rhs_weap_mk18_KAC_bk","rhs_weap_mk18_KAC_wd","rhs_weap_mk18_KAC_d","rhs_weap_mk18_m320",
					"rhs_weap_m16a4","rhs_weap_m16a4_pmag","rhs_weap_m16a4_carryhandle","rhs_weap_m16a4_carryhandle_pmag","rhs_weap_m16a4_carryhandle_M203","rhs_weap_hk416d10",
					"rhs_weap_hk416d145","rhs_weap_hk416d10_LMT","rhs_weap_hk416d10_m320","rhs_weap_hk416d145_m320","rhs_weap_hk416d10_LMT_d","rhs_weap_hk416d10_LMT_wd","rhs_weap_m27iar",
					"rhs_weap_m27iar_grip","rhs_weap_m249","rhs_weap_m249_pip_S","rhs_weap_m249_pip_S_para","rhs_weap_m249_pip_S_vfg","rhs_weap_m249_pip","rhs_weap_m249_pip_L",
					"rhs_weap_m249_pip_L_para","rhs_weap_m249_pip_L_vfg","rhs_weap_m240B","rhs_weap_m240G","rhs_weap_m240B_CAP","rhs_weap_m14ebrri","rhs_weap_sr25","rhs_weap_sr25_ec",
					"rhs_weap_sr25_wd","rhs_weap_sr25_ec_wd","rhs_weap_sr25_d","rhs_weap_sr25_ec_d","rhs_weap_M107","rhs_weap_M107_d","rhs_weap_M107_w","rhs_weap_M590_5RD","rhs_weap_M590_8RD",
					"rhs_weap_m32","rhsusf_weap_MP7A2","rhsusf_weap_MP7A2_winter","rhsusf_weap_MP7A2_desert","rhsusf_weap_MP7A2_aor1","rhs_weap_smaw","rhs_weap_smaw_green","rhs_weap_M136",
					"rhs_weap_M136_hedp","rhs_weap_M136_hp","rhs_weap_m72a7","rhs_weap_fim92","rhs_weap_fgm148","rhsusf_weap_m1911a1","rhsusf_weap_glock17g4","rhsusf_weap_m9","rhsgref_weap_svds",
					"rhs_weap_g36c","rhs_weap_g36kv","rhs_weap_g36kv_ag36","rhs_weap_m84","rhs_weap_minimi_para_railed"
				];

private _rhsitems = ("(_x call macros_isgood) and (_x call macros_isitem) and (_x call smm_is_not_thermal) && (count (configName _x) > 3) && ((toLower(configName _x)) select [0,3]) == 'rhs'" configClasses (configFile >> "CfgWeapons"))apply{configName _x};