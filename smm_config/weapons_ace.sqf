private _aceScopes = 				[
									"ACE_optic_Arco_2D",
									"ACE_optic_Arco_PIP",
									"ACE_optic_LRPS_2D",
									"ACE_optic_LRPS_PIP",
									"ACE_optic_SOS_2D",
									"ACE_optic_SOS_PIP", 	
									"ACE_optic_MRCO_2D",
									"ACE_optic_MRCO_PIP", 	
									"ACE_optic_Hamr_2D",
									"ACE_optic_Hamr_PIP"
									];
						
private _aceWeaponAttachments = 	[
									"ACE_muzzle_mzls_H",
									"ACE_muzzle_mzls_B",
									"ACE_muzzle_mzls_L",
									"ACE_muzzle_mzls_smg_01",
									"ACE_muzzle_mzls_smg_02",
									"ACE_muzzle_mzls_338",
									"ACE_muzzle_mzls_93mmg",
									
									"ACE_acc_pointer_green",
									"ACE_acc_pointer_green_IR",
									"ACE_acc_pointer_red"

									];		
									
private _aceUselessStuff = 			[
									"ACE_Cellphone",
									"ACE_key_master",
									"ACE_key_lockpick",
									"ACE_key_west",
									"ACE_key_east",
									"ACE_key_indp",
									"ACE_key_civ",
									"ACE_Banana"
									];									
						
rand_magazines append 	[
						"ACE_HandFlare_White","ACE_HandFlare_Red",
						"ACE_HandFlare_Green","ACE_HandFlare_Yellow","ACE_M84","ACE_M14","ACE_HuntIR_M203","ACE_SpareBarrel","30Rnd_65x39_caseless_green_Tracer",
						"hlc_30rnd_68x43_FMJ","hlc_30rnd_68x43_OTM","hlc_30rnd_68x43_Tracer","hlc_30rnd_68x43_MIRDIM","hlc_30rnd_68x43_MFMJ","hlc_30rnd_68x43_IRDIM",
						"ACE_100Rnd_65x39_caseless_mag_Tracer_Dim","ACE_200Rnd_65x39_cased_Box_Tracer_Dim","ACE_30Rnd_65x39_caseless_mag_Tracer_Dim",
						"ACE_30Rnd_65x39_caseless_green_mag_Tracer_Dim","ACE_30Rnd_556x45_Stanag_M995_AP_mag","ACE_30Rnd_556x45_Stanag_Mk262_mag",
						"ACE_30Rnd_556x45_Stanag_Mk318_mag","ACE_30Rnd_556x45_Stanag_Tracer_Dim","ACE_20Rnd_762x51_Mag_Tracer","ACE_20Rnd_762x51_Mag_Tracer_Dim",
						"ACE_20Rnd_762x51_Mag_SD","ACE_10Rnd_762x51_M118LR_Mag","ACE_10Rnd_762x51_Mk316_Mod_0_Mag","ACE_10Rnd_762x51_Mk319_Mod_0_Mag",
						"ACE_10Rnd_762x51_M993_AP_Mag","ACE_20Rnd_762x51_M118LR_Mag","ACE_20Rnd_762x51_Mk316_Mod_0_Mag","ACE_20Rnd_762x51_Mk319_Mod_0_Mag",
						"ACE_20Rnd_762x51_M993_AP_Mag","ACE_20Rnd_762x67_Mk248_Mod_0_Mag","ACE_20Rnd_762x67_Mk248_Mod_1_Mag","ACE_20Rnd_762x67_Berger_Hybrid_OTM_Mag",
						"ACE_30Rnd_65x47_Scenar_mag","ACE_20Rnd_65x47_Scenar_mag","ACE_30Rnd_65_Creedmor_mag","ACE_20Rnd_65_Creedmor_mag","ACE_10Rnd_338_300gr_HPBT_Mag",
						"ACE_10Rnd_338_API526_Mag","ACE_7Rnd_408_305gr_Mag","ACE_5Rnd_127x99_Mag","ACE_5Rnd_127x99_API_Mag","ACE_5Rnd_127x99_AMAX_Mag","ACE_30Rnd_9x19_mag",
						"ACE_16Rnd_9x19_mag","ACE_10Rnd_762x54_Tracer_mag","ACE_Chemlight_Orange","ACE_Chemlight_White","ACE_Chemlight_HiRed","ACE_Chemlight_HiYellow",
						"ACE_Chemlight_HiOrange","ACE_Chemlight_HiWhite","ACE_Chemlight_IR","ACE_FlareTripMine_Mag"
						];
						
startItems append 		[
						"ACE_personalAidKit",
						"ACE_packingBandage",
						"ACE_elasticBandage",
						"ACE_tourniquet",
						"ACE_EarPlugs",
						"ACE_morphine"
						];						
rand_items_one append ((call smm_fnc_macrosAceItems) - (_aceScopes + _aceWeaponAttachments + _aceUselessStuff));

// warning hack
rand_items_one = rand_items_one - ["FirstAidKit","Medikit"];
//

rand_items_two append (_aceScopes +_aceWeaponAttachments)  ;
rand_backpacks append ["ACE_gunbag","ACE_NonSteerableParachute","ACE_TacticalLadder_Pack"];