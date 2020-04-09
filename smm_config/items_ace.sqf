allItems append [
	//rifleman scopes
	["CfgWeapons","ACE_optic_Arco_2D","RIFLEMAN",177,false] call PurchasableItem_create,
	["CfgWeapons","ACE_optic_Arco_PIP","RIFLEMAN",199,false] call PurchasableItem_create,

	["CfgWeapons","ACE_optic_MRCO_2D","RIFLEMAN",131,false] call PurchasableItem_create,
	["CfgWeapons","ACE_optic_MRCO_PIP","RIFLEMAN",211,false] call PurchasableItem_create,
	
	//Long range scopes
	["CfgWeapons","ACE_optic_Arco_2D","SCOPE_LR",311,false] call PurchasableItem_create,
	["CfgWeapons","ACE_optic_Arco_PIP","SCOPE_LR",246,false] call PurchasableItem_create,

	["CfgWeapons","ACE_optic_SOS_2D","SCOPE_LR",490,false] call PurchasableItem_create,
	["CfgWeapons","ACE_optic_SOS_PIP","SCOPE_LR",490,false] call PurchasableItem_create,

	//ACE Silencer
	["CfgWeapons","ACE_muzzle_mzls_338","RIFLEMAN",99,false] call PurchasableItem_create,
	["CfgWeapons","ACE_muzzle_mzls_93mmg","RIFLEMAN",99,false] call PurchasableItem_create,
	["CfgWeapons","ACE_muzzle_mzls_B","RIFLEMAN",99,false] call PurchasableItem_create,
	["CfgWeapons","ACE_muzzle_mzls_H","RIFLEMAN",99,false] call PurchasableItem_create,
	["CfgWeapons","ACE_muzzle_mzls_L","RIFLEMAN",99,false] call PurchasableItem_create,
	["CfgWeapons","ACE_muzzle_mzls_smg_01","RIFLEMAN",99,false] call PurchasableItem_create,
	["CfgWeapons","ACE_muzzle_mzls_smg_02","RIFLEMAN",99,false] call PurchasableItem_create,

	//gunbag
	["CfgVehicles","ACE_gunbag","BACKPACK",199,false] call PurchasableItem_create,
	

	//mine detectors
	["CfgWeapons","ACE_VMM3","MINES",319,false] call PurchasableItem_create,
	["CfgWeapons","ACE_VMH3","MINES",319,false] call PurchasableItem_create,

	//mine equipment 
	["CfgWeapons","ACE_DeadManSwitch","MINES",10,false] call PurchasableItem_create,
	["CfgWeapons","ACE_DefusalKit","MINES",10,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Clacker","MINES",30,false] call PurchasableItem_create,
	["CfgWeapons","ACE_M26_Clacker","MINES",30,false] call PurchasableItem_create,

	//useless flares and chemlights
	["CfgMagazines","ACE_HandFlare_White","BASE",10,false] call PurchasableItem_create,
	["CfgMagazines","ACE_HandFlare_Red","BASE",10,false] call PurchasableItem_create,
	["CfgMagazines","ACE_HandFlare_Green","BASE",10,false] call PurchasableItem_create,
	["CfgMagazines","ACE_HandFlare_Yellow","BASE",10,false] call PurchasableItem_create,
	["CfgMagazines","ACE_Chemlight_IR","BASE",10,false] call PurchasableItem_create,
	//["CfgMagazines","ACE_Chemlight_HiYellow","BASE",10,false] call PurchasableItem_create,

	//mines and grenades
	["CfgMagazines","ACE_M84","BASE",20,false] call PurchasableItem_create,
	["CfgMagazines","ACE_M14","MINES",8,false] call PurchasableItem_create,
	["CfgMagazines","ACE_FlareTripMine_Mag","MINES",8,false] call PurchasableItem_create,

	//barrel
	["CfgMagazines","ACE_SpareBarrel","LMG",50,false] call PurchasableItem_create,


	//huntir
	["CfgMagazines","ACE_HuntIR_M203","UGL",15,true] call PurchasableItem_create,
	["CfgWeapons","ACE_HuntIR_monitor","UGL",100,false] call PurchasableItem_create,


	//medic stuff basic
		//Bandage
		["CfgWeapons","ACE_fieldDressing","BASE",5,true] call PurchasableItem_create,
		["CfgWeapons","ACE_packingBandage","BASE",1,true] call PurchasableItem_create,

	["CfgWeapons","ACE_morphine","BASE",15,true] call PurchasableItem_create,
	["CfgWeapons","ACE_EarPlugs","BASE",1,true] call PurchasableItem_create,
	["CfgWeapons","ACE_personalAidKit","BASE",50,true] call PurchasableItem_create,
	["CfgWeapons","ACE_tourniquet","BASE",8,true] call PurchasableItem_create,

	//medic stuff advanced
		//Bandage
		["CfgWeapons","ACE_elasticBandage","MEDIC",4,true] call PurchasableItem_create,
		["CfgWeapons","ACE_quikclot","MEDIC",10,true] call PurchasableItem_create,

	// Adenosine
	// How much will the heart rate be increased when the HR is low (below 55)? {minIncrease, maxIncrease, seconds}
	/* 
	From :https://github.com/acemod/ACE3/blob/master/addons/medical/ACE_Medical_Treatments.hpp
	hrIncreaseLow[] = {-7, -10, 15};
	hrIncreaseNormal[] = {-15, -30, 20};
	hrIncreaseHigh[] = {-15, -35, 10};
	*/
	["CfgWeapons","ACE_adenosine","MEDIC",15,false] call PurchasableItem_create,
	
	["CfgWeapons","ACE_splint","MEDIC",60,true] call PurchasableItem_create,

	// Atropine
	// How much will the heart rate be increased when the HR is low (below 55)? {minIncrease, maxIncrease, seconds}
	/* 
	From :https://github.com/acemod/ACE3/blob/master/addons/medical/ACE_Medical_Treatments.hpp
	hrIncreaseLow[] = {-2, -5, 15};
	hrIncreaseNormal[] = {-10, -15, 20};
	hrIncreaseHigh[] = {-5, -20, 10};
	*/
	["CfgWeapons","ACE_atropine","MEDIC",10,false] call PurchasableItem_create,

	["CfgWeapons","ACE_epinephrine","BASE",75,true] call PurchasableItem_create,
	["CfgWeapons","ACE_surgicalKit","MEDIC",119,false] call PurchasableItem_create,
	["CfgWeapons","ACE_bodyBag","MEDIC",10,false] call PurchasableItem_create,

	//blood
	["CfgWeapons","ACE_plasmaIV","MEDIC",60,false] call PurchasableItem_create,
	["CfgWeapons","ACE_plasmaIV_500","MEDIC",35,false] call PurchasableItem_create,
	["CfgWeapons","ACE_plasmaIV_250","MEDIC",20,false] call PurchasableItem_create,

	["CfgWeapons","ACE_bloodIV","MEDIC",80,false] call PurchasableItem_create,
	["CfgWeapons","ACE_bloodIV_500","MEDIC",45,false] call PurchasableItem_create,
	["CfgWeapons","ACE_bloodIV_250","BASE",25,true] call PurchasableItem_create,

	["CfgWeapons","ACE_salineIV","MEDIC",30,false] call PurchasableItem_create,
	["CfgWeapons","ACE_salineIV_500","MEDIC",17,false] call PurchasableItem_create,
	["CfgWeapons","ACE_salineIV_250","MEDIC",10,false] call PurchasableItem_create,


	//misc
	["CfgWeapons","ACE_UAVBattery","BASE",10,true] call PurchasableItem_create,
	["CfgWeapons","ACE_wirecutter","BASE",30,false] call PurchasableItem_create,
	["CfgWeapons","ACE_MapTools","BASE",30,false] call PurchasableItem_create,
	["CfgWeapons","ACE_microDAGR","BASE",60,false] call PurchasableItem_create,
	["CfgWeapons","ACE_DAGR","BASE",60,false] call PurchasableItem_create,
	["CfgWeapons","ACE_RangeTable_82mm","BASE",40,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Altimeter","BASE",20,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Sandbag_empty","BASE",3,false] call PurchasableItem_create,
	["CfgWeapons","ACE_EntrenchingTool","BASE",200,false] call PurchasableItem_create,
	["CfgVehicles","ACE_NonSteerableParachute","BASE",200,false] call PurchasableItem_create,
	["CfgVehicles","ACE_TacticalLadder_Pack","RIFLEMAN",200,false] call PurchasableItem_create,
	["CfgWeapons","ACE_IR_Strobe_Item","BASE",50,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Flashlight_XL50","BASE",40,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Flashlight_KSF1","BASE",60,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Flashlight_MX991","BASE",60,false] call PurchasableItem_create,
	//TODO ace explosives and flashlights
	
	// grenades
	["CfgMagazines","ACE_40mm_Flare_white","BASE",5,false] call PurchasableItem_create,
	["CfgMagazines","ACE_40mm_Flare_red","BASE",5,false] call PurchasableItem_create,
	["CfgMagazines","ACE_40mm_Flare_green","BASE",5,false] call PurchasableItem_create,
	["CfgMagazines","ACE_40mm_Flare_ir","BASE",5,false] call PurchasableItem_create,

	//sniper/spotter
	["CfgWeapons","ACE_SpottingScope","SPOTTER_EQUIPMENT",50,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Tripod","SPOTTER_EQUIPMENT",20,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Kestrel4500","SPOTTER_EQUIPMENT",150,false] call PurchasableItem_create,
	["CfgWeapons","ACE_ATragMX","SPOTTER_EQUIPMENT",200,false] call PurchasableItem_create,
	["CfgWeapons","ACE_RangeCard","SPOTTER_EQUIPMENT",40,true] call PurchasableItem_create,
	["CfgWeapons","ACE_MX2A","SPOTTER_EQUIPMENT",300,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Vector","SPOTTER_EQUIPMENT",300,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Yardage450","SPOTTER_EQUIPMENT",270,false] call PurchasableItem_create

	//magazines

];