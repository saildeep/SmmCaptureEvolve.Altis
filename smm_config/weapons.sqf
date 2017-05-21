startWeapons   = ["hgun_ACPC2_F","SMG_05_F","arifle_AKM_F","SMG_02_F","launch_RPG7_F"];
startMagazines = ["9Rnd_45ACP_Mag","30Rnd_9x21_Mag_SMG_02_Tracer_Green","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_9x21_Mag_SMG_02","RPG7_F"];
startItems     = ["ItemGPS","FirstAidKit"];
startBackpacks = ["B_Bergen_rgr"];

//vanilla stuff goes here

// ["name",price,[numWeapons,numMagazines,numItems,numBackpacks,num_ace_items]];
buy_packs = [
["Premium Bundle",1000,[3,3,3,3,3]],
["Ammunition",50,[0,1,0,0,0]],
["Backpacks",200,[0,0,0,1,0]],
["Attachments",150,[0,0,0,0,1]],
["Clothing & Items",80,[0,0,1,0,0]],
["Weapons",300,[1,0,0,0,0]]
];

rand_weapons = 		[
					"launch_NLAW_F","launch_RPG32_F","launch_B_Titan_F","launch_I_Titan_F","launch_O_Titan_F","launch_B_Titan_short_F","launch_I_Titan_short_F",
					"launch_O_Titan_short_F","srifle_DMR_01_F","srifle_EBR_F","srifle_GM6_F","srifle_GM6_camo_F","srifle_LRR_F","srifle_LRR_camo_F","LMG_Mk200_F","LMG_Zafir_F",
					"hgun_ACPC2_F","hgun_P07_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_02_F","hgun_Rook40_F","arifle_Katiba_F","arifle_Katiba_C_F","arifle_Katiba_GL_F",
					"arifle_Mk20_F","arifle_Mk20_plain_F","arifle_Mk20C_F","arifle_Mk20C_plain_F","arifle_Mk20_GL_F","arifle_Mk20_GL_plain_F","arifle_MXC_F","arifle_MX_F",
					"arifle_MX_GL_F","arifle_MX_SW_F","arifle_MXM_F","arifle_SDAR_F","arifle_TRG21_F","arifle_TRG20_F","arifle_TRG21_GL_F","hgun_PDW2000_F","SMG_01_F","SMG_02_F",
					"hgun_Pistol_Signal_F","srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F",
					"srifle_DMR_03_woodland_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_f","srifle_DMR_06_camo_F",
					"srifle_DMR_06_olive_F","srifle_DMR_06_camo_khs_F","LMG_Mk200_BI_F","MMG_01_hex_F","MMG_01_tan_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F",
					"arifle_MX_khk_F","arifle_MX_GL_khk_F","arifle_MX_SW_khk_F","arifle_MXC_khk_F","arifle_MXM_khk_F","srifle_LRR_tna_F","srifle_GM6_ghex_F","hgun_P07_khk_F",
					"launch_RPG32_ghex_F","launch_RPG7_F","launch_B_Titan_tna_F","launch_B_Titan_short_tna_F","launch_O_Titan_ghex_F","launch_O_Titan_short_ghex_F","srifle_DMR_07_blk_F",
					"srifle_DMR_07_hex_F","srifle_DMR_07_ghex_F","LMG_03_F","hgun_Pistol_01_F","arifle_AK12_F","arifle_AK12_GL_F","arifle_AKM_F","arifle_AKS_F","arifle_ARX_blk_F",
					"arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F","arifle_CTAR_ghex_F","arifle_CTAR_GL_blk_F","arifle_CTAR_GL_hex_F","arifle_CTAR_GL_ghex_F",
					"arifle_CTARS_blk_F","arifle_CTARS_hex_F","arifle_CTARS_ghex_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F","arifle_SPAR_01_GL_blk_F",
					"arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F","arifle_SPAR_03_blk_F","arifle_SPAR_03_khk_F",
					"arifle_SPAR_03_snd_F","SMG_05_F"
					];
				
rand_magazines = 	[
					"30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Green",
					"30Rnd_556x45_Stanag_Tracer_Yellow","20Rnd_556x45_UW_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_green","30Rnd_65x39_caseless_mag_Tracer",
					"30Rnd_65x39_caseless_green_mag_Tracer","20Rnd_762x51_Mag","7Rnd_408_Mag","5Rnd_127x108_Mag","100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_mag_Tracer",
					"200Rnd_65x39_cased_Box","200Rnd_65x39_cased_Box_Tracer","30Rnd_9x21_Mag","30Rnd_9x21_Red_Mag","30Rnd_9x21_Yellow_Mag","30Rnd_9x21_Green_Mag","16Rnd_9x21_Mag",
					"30Rnd_9x21_Mag_SMG_02","30Rnd_9x21_Mag_SMG_02_Tracer_Red","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","30Rnd_9x21_Mag_SMG_02_Tracer_Green","16Rnd_9x21_red_Mag",
					"16Rnd_9x21_green_Mag","16Rnd_9x21_yellow_Mag","30Rnd_45ACP_Mag_SMG_01",
					"30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd_45ACP_Mag_SMG_01_Tracer_Red","30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow","9Rnd_45ACP_Mag",
					"150Rnd_762x51_Box","150Rnd_762x51_Box_Tracer","150Rnd_762x54_Box","150Rnd_762x54_Box_Tracer","Titan_AA","Titan_AP","Titan_AT",
					"11Rnd_45ACP_Mag","6Rnd_45ACP_Cylinder","10Rnd_762x51_Mag","10Rnd_762x54_Mag","5Rnd_127x108_APDS_Mag",
					"6Rnd_RedSignal_F","10Rnd_338_Mag","130Rnd_338_Mag","10Rnd_127x54_Mag","150Rnd_93x64_Mag","10Rnd_93x64_DMR_05_Mag","10Rnd_9x21_Mag",
					"30Rnd_580x42_Mag_F","30Rnd_580x42_Mag_Tracer_F","100Rnd_580x42_Mag_F","100Rnd_580x42_Mag_Tracer_F","20Rnd_650x39_Cased_Mag_F",
					"10Rnd_50BW_Mag_F","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Mag_Tracer_F","30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_Green_F",
					"30Rnd_762x39_Mag_Tracer_F","30Rnd_762x39_Mag_Tracer_Green_F","30Rnd_545x39_Mag_F","30Rnd_545x39_Mag_Green_F","30Rnd_545x39_Mag_Tracer_F",
					"30Rnd_545x39_Mag_Tracer_Green_F","200Rnd_556x45_Box_F","200Rnd_556x45_Box_Red_F","200Rnd_556x45_Box_Tracer_F","200Rnd_556x45_Box_Tracer_Red_F"
					];

//used for being added to rand_magazines after this was replaced by a weapon mod
standalone_vanilla_explosives = 	[
									"RPG32_F","RPG32_HE_F","NLAW_F","1Rnd_HE_Grenade_shell","3Rnd_HE_Grenade_shell","1Rnd_Smoke_Grenade_shell",
									"3Rnd_Smoke_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell",
									"1Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","3Rnd_SmokePurple_Grenade_shell",
									"1Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","HandGrenade",
									"MiniGrenade","SmokeShell","SmokeShellRed","SmokeShellGreen","SmokeShellYellow","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange",
									"Chemlight_green","Chemlight_red","Chemlight_yellow","Chemlight_blue","UGL_FlareWhite_F","3Rnd_UGL_FlareWhite_F","UGL_FlareGreen_F",
									"3Rnd_UGL_FlareGreen_F","UGL_FlareRed_F","3Rnd_UGL_FlareRed_F","UGL_FlareYellow_F","3Rnd_UGL_FlareYellow_F","UGL_FlareCIR_F",
									"3Rnd_UGL_FlareCIR_F","FlareWhite_F","FlareGreen_F","FlareRed_F","FlareYellow_F","Laserbatteries","B_IR_Grenade","O_IR_Grenade",
									"I_IR_Grenade","ATMine_Range_Mag","APERSMine_Range_Mag","APERSBoundingMine_Range_Mag","SLAMDirectionalMine_Wire_Mag",
									"APERSTripMine_Wire_Mag","ClaymoreDirectionalMine_Remote_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag",
									"IEDUrbanBig_Remote_Mag","IEDLandBig_Remote_Mag","IEDUrbanSmall_Remote_Mag","IEDLandSmall_Remote_Mag","6Rnd_GreenSignal_F","RPG7_F"
									];


rand_magazines append standalone_vanilla_explosives;


notUsedItems=
	[
	//0815 items
	"ItemRadio","NVGoggles_OPFOR","NVGoggles_INDEP",
	
	//vest
	"V_BandollierB_khk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_blk","V_PlateCarrier2_rgr","V_PlateCarrierGL_blk","V_PlateCarrierGL_mtp",
	"V_PlateCarrier1_blk","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_blk","V_Chestrig_khk","V_Chestrig_rgr","V_Chestrig_blk","V_TacVestIR_blk","V_TacVest_khk",
	"V_TacVest_brn","V_TacVest_oli","V_TacVest_blk","V_TacVest_camo","V_HarnessOGL_brn","V_HarnessO_gry","V_HarnessOGL_gry","V_PlateCarrierIAGL_oli","V_PlateCarrierIA2_dgtl",
	"V_RebreatherIR","V_RebreatherIA","V_PlateCarrier_Kerry","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_I_G_resistanceLeader_F","V_TacChestrig_oli_F","V_TacChestrig_cbr_F",
	"V_PlateCarrier2_tna_F","V_PlateCarrierSpec_tna_F","V_PlateCarrierGL_tna_F","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F",
	
	//Helmet combat
	"H_HelmetB","H_HelmetB_camo","H_HelmetB_grass","H_HelmetB_snakeskin","H_HelmetB_desert","H_HelmetB_sand","H_HelmetB_TI_tna_F","H_HelmetB_tna_F","H_HelmetB_Enh_tna_F",
	"H_HelmetB_Light_tna_F","H_HelmetSpecO_ghex_F","H_HelmetB_light_grass","H_HelmetB_light_desert","H_HelmetB_light_black","H_HelmetB_light_sand",
	"H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin",
	"H_HelmetO_oucamo","H_HelmetO_ghex_F","H_HelmetLeaderO_oucamo","H_HelmetLeaderO_ghex_F","H_HelmetSpecO_ocamo","H_HelmetSpecO_blk",
	
	// Helmet airforce
	"H_HelmetCrew_O","H_HelmetCrew_O_ghex_F",
	"H_PilotHelmetFighter_O","H_PilotHelmetFighter_I",
	"H_PilotHelmetHeli_B",
	"H_CrewHelmetHeli_O","H_CrewHelmetHeli_I",
	"H_PilotHelmetHeli_I","H_CrewHelmetHeli_B",
	
	// Helmet no armor
	"H_Booniehat_khk","H_Booniehat_oli","H_Booniehat_mcamo","H_Booniehat_tan","H_Booniehat_dgtl","H_Booniehat_khk_hs","H_Booniehat_tna_F",
	"H_Cap_red","H_Cap_blu","H_Cap_oli","H_Cap_headphones","H_Cap_tan","H_Cap_blk","H_Cap_blk_CMMG","H_Cap_brn_SPECOPS","H_Cap_tan_specops_US","H_Cap_khaki_specops_UK","H_Cap_grn","H_Cap_grn_BI",
	"H_Cap_blk_ION","H_Cap_oli_hs","H_Cap_press","H_Cap_usblack","H_Cap_surfer",
	"H_MilCap_ocamo","H_MilCap_mcamo","H_MilCap_gry","H_MilCap_dgtl","H_MilCap_blue",
	"H_Bandanna_surfer","H_Bandanna_khk","H_Bandanna_khk_hs","H_Bandanna_cbr","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_surfer_blk","H_Bandanna_surfer_grn","H_Bandanna_gry","H_Bandanna_blu","H_Bandanna_camo","H_Bandanna_mcamo",
	"H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan",
	"H_Beret_blk","H_Beret_02","H_Beret_Colonel","H_Beret_gen_F",
	"H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_khk","H_Watchcap_camo",
	"H_StrawHat","H_StrawHat_dark",
	"H_Hat_blue","H_Hat_brown","H_Hat_camo","H_Hat_grey","H_Hat_checker","H_Hat_tan",
	"H_RacingHelmet_1_F","H_RacingHelmet_2_F","H_RacingHelmet_3_F","H_RacingHelmet_4_F","H_RacingHelmet_1_black_F","H_RacingHelmet_1_blue_F","H_RacingHelmet_1_green_F","H_RacingHelmet_1_red_F","H_RacingHelmet_1_white_F","H_RacingHelmet_1_yellow_F",
	"H_MilCap_tna_F","H_MilCap_gen_F","H_MilCap_ghex_F",
	
	// weapon attachments
	"Zasleh2"
	];

//Items
rand_items_one = 	[
					// 0815 items
					"ItemWatch","ItemCompass","ItemGPS","ItemMap","FirstAidKit","Medikit","ToolKit","MineDetector","Binocular","Rangefinder",
					"NVGoggles",

					// vest
					"V_Rangemaster_belt",
					"V_BandollierB_oli",
					"V_PlateCarrier1_rgr","V_PlateCarrier2_blk",
					"V_PlateCarrierGL_rgr","V_PlateCarrierSpec_mtp","V_PlateCarrier1_tna_F",
					"V_Chestrig_oli",
					"V_TacVest_blk_POLICE",
					"V_HarnessO_brn",
					"V_PlateCarrierIA1_dgtl","V_PlateCarrierIAGL_dgtl",
					"V_RebreatherB",
					"V_Press_F",
					"V_TacChestrig_grn_F",
					"V_HarnessO_ghex_F","V_HarnessOGL_ghex_F",
					"V_BandollierB_ghex_F",
					"V_TacVest_gen_F",

					// Helmet combat
					"H_HelmetB_light","H_HelmetB_black","H_HelmetB_light_snakeskin",
					"H_HelmetSpecB_sand",
					"H_HelmetIA",
					"H_HelmetO_ocamo","H_HelmetLeaderO_ocamo",
					
					// Helmet airforce
					"H_HelmetCrew_B","H_HelmetCrew_I",
					"H_PilotHelmetFighter_B",
					"H_PilotHelmetHeli_O",
					
					// Helmet no armor
					"H_Cap_blk_Raven","H_Cap_police","H_Cap_marshal",
					"H_RacingHelmet_1_orange_F",
					"H_Helmet_Skate"
					];

//weapon attachments
rand_items_two = [
					"muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_acp","muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand",
					"muzzle_snds_93mmg","muzzle_snds_93mmg_tan","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_58_blk_F",
					"muzzle_snds_58_ghex_F","muzzle_snds_58_hex_F","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_hex_F",
					"muzzle_snds_65_TI_ghex_F",
					
					"optic_Arco","optic_Hamr","optic_Aco","optic_ACO_grn","optic_Aco_smg","optic_ACO_grn_smg","optic_Holosight","optic_Holosight_smg","optic_SOS","optic_MRCO",
					"optic_NVS","optic_DMS","optic_Yorris","optic_MRD","optic_LRPS","optic_AMS","optic_AMS_khk","optic_AMS_snd","optic_KHS_blk","optic_KHS_hex","optic_KHS_old","optic_KHS_tan", 
					"optic_Arco_blk_F","optic_Arco_ghex_F","optic_DMS_ghex_F","optic_Hamr_khk_F","optic_ERCO_blk_F","optic_ERCO_khk_F",
					"optic_ERCO_snd_F","optic_SOS_khk_F","optic_LRPS_tna_F","optic_LRPS_ghex_F","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg_blk_F",
					
					"acc_flashlight","acc_pointer_IR",
					
					"bipod_01_F_snd","bipod_01_F_blk","bipod_01_F_mtp","bipod_02_F_blk","bipod_02_F_tan","bipod_02_F_hex","bipod_03_F_blk","bipod_03_F_oli","bipod_01_F_khk"
];
rand_backpacks = [
					"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_blk",
					"B_AssaultPack_cbr","B_AssaultPack_mcamo","B_AssaultPack_ocamo","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_cbr",
					"B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_ocamo","B_TacticalPack_blk","B_TacticalPack_oli","B_FieldPack_khk",
					"B_FieldPack_ocamo","B_FieldPack_oucamo","B_FieldPack_cbr","B_FieldPack_blk","B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo",
					"B_Carryall_khk","B_Carryall_cbr","B_Parachute","B_FieldPack_oli","B_Carryall_oli","B_AssaultPack_Kerry",
					"B_Bergen_mcamo_F","B_Bergen_dgtl_F","B_Bergen_hex_F","B_Bergen_tna_F","B_AssaultPack_tna_F","B_Carryall_ghex_F","B_FieldPack_ghex_F","B_ViperHarness_blk_F",
					"B_ViperHarness_ghex_F","B_ViperHarness_hex_F","B_ViperHarness_khk_F","B_ViperHarness_oli_F","B_ViperLightHarness_blk_F","B_ViperLightHarness_ghex_F",
					"B_ViperLightHarness_hex_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_oli_F"
				];
				
// Items by faction
if(playerside == west)then{
	rand_backpacks append 	[
							"B_HMG_01_support_F","B_HMG_01_support_high_F","B_HMG_01_weapon_F","B_HMG_01_A_weapon_F",
							"B_GMG_01_weapon_F","B_GMG_01_A_weapon_F",
							
							"B_HMG_01_high_weapon_F",
							"B_GMG_01_high_weapon_F",
							
							"B_Mortar_01_support_F",
							"B_Mortar_01_weapon_F",
							
							"B_AT_01_weapon_F","B_AA_01_weapon_F",
							
							"B_UAV_01_backpack_F",
							
							"B_Static_Designator_01_weapon_F"
							];
	
	rand_items_one append 	[
							"B_UavTerminal"
							];
							
};
if(playerside == east)then{
	rand_backpacks append 	[
							"O_HMG_01_support_F","O_HMG_01_support_high_F","O_HMG_01_weapon_F","O_HMG_01_A_weapon_F",
							"O_GMG_01_weapon_F","O_GMG_01_A_weapon_F",
							
							"O_HMG_01_high_weapon_F",
							"O_GMG_01_high_weapon_F",

							"O_Mortar_01_support_F",
							"O_Mortar_01_weapon_F",
							
							"O_AT_01_weapon_F","O_AA_01_weapon_F",
							
							"O_UAV_01_backpack_F",
							
							"O_Static_Designator_02_weapon_F"
							];
							
	rand_items_one append 	[
							"O_UavTerminal"
							];
};
if(playerside == independent)then{
	rand_backpacks append 	[
							"I_HMG_01_support_F","I_HMG_01_support_high_F","I_HMG_01_weapon_F","I_HMG_01_A_weapon_F",
							"I_GMG_01_weapon_F","I_GMG_01_A_weapon_F",
							
							"I_HMG_01_high_weapon_F",
							"I_GMG_01_high_weapon_F",
							
							"I_Mortar_01_support_F",
							"I_Mortar_01_weapon_F",
							
							"I_AT_01_weapon_F","I_AA_01_weapon_F",
							
							"I_UAV_01_backpack_F"
							
							// No Static Designator for Independent
							];
							
	rand_items_one append 	[
							"I_UavTerminal"
							];						
};

if(isClass(configfile >> "CfgPatches" >> "hlcweapons_acr"))then{
	call compile preprocessFileLineNumbers "smm_config\weapons_niarsenal.sqf";
};

if(isClass(configfile >> "CfgPatches" >> "rhs_weapons"))then{
	call compile preprocessFileLineNumbers "smm_config\weapons_rhs.sqf";
};

//load ace stuff
if(isClass(configfile >> "CfgPatches" >> "ace_medical"))then{
	call compile preprocessFileLineNumbers "smm_config\weapons_ace.sqf";
};

if(isClass(configfile >> "CfgPatches" >>"task_force_radio" ))then{
	call compile preprocessFileLineNumbers "smm_config\weapons_tfar.sqf";
};

smm_gear_start = [startItems,startWeapons,startMagazines,startBackpacks,[]];