allItems append [
	//rifleman scopes
	["CfgWeapons","ACE_optic_Arco_2D","BASE",110,false] call PurchasableItem_create,
	["CfgWeapons","ACE_optic_Arco_PIP","BASE",110,false] call PurchasableItem_create,

	["CfgWeapons","ACE_optic_MRCO_2D","BASE",99,false] call PurchasableItem_create,
	["CfgWeapons","ACE_optic_MRCO_PIP","BASE",99,false] call PurchasableItem_create,
	
	//Long range scopes
	["CfgWeapons","ACE_optic_Arco_2D","SCOPE_LR",500,false] call PurchasableItem_create,
	["CfgWeapons","ACE_optic_Arco_PIP","SCOPE_LR",500,false] call PurchasableItem_create,

	["CfgWeapons","ACE_optic_SOS_2D","SCOPE_LR",490,false] call PurchasableItem_create,
	["CfgWeapons","ACE_optic_SOS_PIP","SCOPE_LR",490,false] call PurchasableItem_create,


	//TODO add ace silencers

	//gunbag
	["CfgVehicles","ACE_gunbag","BACKPACK",199,false] call PurchasableItem_create,
	

	//mine detectors and mines
	["CfgWeapons","ACE_VMM3","MINES",319,false] call PurchasableItem_create,
	["CfgWeapons","ACE_VMH3","MINES",319,false] call PurchasableItem_create,
	["CfgWeapons","ACE_M84","MINES",80,false] call PurchasableItem_create,
	["CfgWeapons","ACE_M14","MINES",50,false] call PurchasableItem_create,


	//useless flares and chemlights
	["CfgMagazines","ACE_HandFlare_White","BASE",10,false] call PurchasableItem_create,
	["CfgMagazines","ACE_HandFlare_Red","BASE",10,false] call PurchasableItem_create,
	["CfgMagazines","ACE_HandFlare_Green","BASE",10,false] call PurchasableItem_create,
	["CfgMagazines","ACE_HandFlare_Yellow","BASE",10,false] call PurchasableItem_create,
	["CfgMagazines","ACE_Chemlight_IR","BASE",10,false] call PurchasableItem_create,
	["CfgMagazines","ACE_Chemlight_HiYellow","BASE",10,false] call PurchasableItem_create,

	//barrel
	["CfgMagazines","ACE_SpareBarrel","LMG",50,false] call PurchasableItem_create,


	//huntir
	["CfgMagazines","ACE_HuntIR_M203","UGL",15,true] call PurchasableItem_create,
	["CfgWeapons","ACE_HuntIR_monitor","UGL",100,false] call PurchasableItem_create,


	//medic stuff basic
	["CfgWeapons","ACE_packingBandage","BASE",3,true] call PurchasableItem_create,
	["CfgWeapons","ACE_elasticBandage","BASE",5,true] call PurchasableItem_create,
	["CfgWeapons","ACE_EarPlugs","BASE",1,true] call PurchasableItem_create,

	//medic stuff advanced
	["CfgWeapons","ACE_personalAidKit","MEDIC",50,true] call PurchasableItem_create,
	["CfgWeapons","ACE_morphine","MEDIC",15,true] call PurchasableItem_create,
	["CfgWeapons","ACE_tourniquet","MEDIC",8,true] call PurchasableItem_create,
	["CfgWeapons","ACE_quicklot","MEDIC",10,true] call PurchasableItem_create,
	["CfgWeapons","ACE_fieldDressing","MEDIC",1,false] call PurchasableItem_create,
	["CfgWeapons","ACE_adenosine","MEDIC",15,false] call PurchasableItem_create,
	["CfgWeapons","ACE_atropine","MEDIC",15,false] call PurchasableItem_create,
	["CfgWeapons","ACE_epinephrine","MEDIC",15,false] call PurchasableItem_create,
	["CfgWeapons","ACE_surgicalKit","MEDIC",119,false] call PurchasableItem_create,
	["CfgWeapons","ACE_bodyBag","MEDIC",10,false] call PurchasableItem_create,

	//blood
	["CfgWeapons","ACE_plasmaIV","MEDIC",60,false] call PurchasableItem_create,
	["CfgWeapons","ACE_plasmaIV_500","MEDIC",35,false] call PurchasableItem_create,
	["CfgWeapons","ACE_plasmaIV_250","MEDIC",20,false] call PurchasableItem_create,

	["CfgWeapons","ACE_bloodIV","MEDIC",80,false] call PurchasableItem_create,
	["CfgWeapons","ACE_bloodIV_500","MEDIC",45,false] call PurchasableItem_create,
	["CfgWeapons","ACE_bloodIV_250","MEDIC",25,true] call PurchasableItem_create,

	["CfgWeapons","ACE_salineIV","MEDIC",30,false] call PurchasableItem_create,
	["CfgWeapons","ACE_salineIV_500","MEDIC",17,false] call PurchasableItem_create,
	["CfgWeapons","ACE_salineIV_250","MEDIC",10,false] call PurchasableItem_create,


	//misc
	["CfgWeapons","ACE_UAVBattery","BASE",10,true] call PurchasableItem_create,
	["CfgWeapons","ACE_wirecutter","BASE",30,false] call PurchasableItem_create,
	["CfgWeapons","ACE_MapTools","BASE",30,false] call PurchasableItem_create,
	["CfgWeapons","ACE_microDAGR","BASE",60,false] call PurchasableItem_create,
	["CfgWeapons","ACE_DAGR","BASE",60,false] call PurchasableItem_create,
	["CfgWeapons","ACE_RangeTable_82mm","BASE",8,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Altimeter","BASE",20,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Sandbag_empty","BASE",3,false] call PurchasableItem_create,
	["CfgWeapons","ACE_EntrenchingTool","BASE",200,false] call PurchasableItem_create,

	//TODO ace explosives and flashlights
	

	//sniper/spotter
	["CfgWeapons","ACE_SpottingScope","SPOTTER_EQUIPMENT",50,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Tripod","SPOTTER_EQUIPMENT",20,false] call PurchasableItem_create,
	["CfgWeapons","ACE_Kestrel4500","SPOTTER_EQUIPMENT",150,false] call PurchasableItem_create,
	["CfgWeapons","ACE_ATragMX","SPOTTER_EQUIPMENT",200,false] call PurchasableItem_create,
	["CfgWeapons","ACE_RangeCard","SPOTTER_EQUIPMENT",20,false] call PurchasableItem_create


];	