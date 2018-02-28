allItems append [
	//Mini radios for rifleman
	["CfgWeapons","tf_rf7800str","RADIO_SMALL_BLUFOR",10,true] call PurchasableItem_create,
	["CfgWeapons","tf_anprc154","RADIO_SMALL_INDEPENDENT",5,true] call PurchasableItem_create,
	["CfgWeapons","tf_pnr1000a","RADIO_SMALL_OPFOR",10,true] call PurchasableItem_create,


	//group leader radios
	["CfgWeapons","tf_anprc152","RADIO_SMALL_BLUFOR",53,true] call PurchasableItem_create,
	["CfgWeapons","tf_anprc148jem","RADIO_SMALL_INDEPENDENT",35,true] call PurchasableItem_create,
	["CfgWeapons","tf_fadak","RADIO_SMALL_OPFOR",60,true] call PurchasableItem_create,


	//backpack
	["CfgVehicles","tf_anprc152","RADIO_LARGE_BLUFOR",250,true] call PurchasableItem_create,
	["CfgVehicles","tf_anprc148jem","RADIO_LARGE_INDEPENDENT",170,true] call PurchasableItem_create,
	["CfgVehicles","tf_mr3000","RADIO_LARGE_OPFOR",250,true] call PurchasableItem_create,

	//item
	["CfgWeapons","tf_microdagr","BASE",5,true] call PurchasableItem_create

];