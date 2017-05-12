// verschiedene scopes ,verschiedne westen





diag_log "creating niarsenal units";
//equips a given unit with weapon and ammo. Input format: [unit,["weaponname","magazinename",magazinecount,"attachments" (optional)]]
Nia_load_weapons_ammo = {
	private _unit = _this select 0;
	private _weapon = (_this select 1) select 0;
	private _magazine = (_this select 1) select 1;
	private _magazinecount = (_this select 1) select 2;
	private _attachments = [];
	
	if ( (count(_this select 1)) > 3 ) then { _attachments = ( _this select 1) select 3;};
	
	
	
	for "_i" from 1 to _magazinecount do {_unit addItem _magazine;};
	_unit addWeapon _weapon;
	
	{_unit addPrimaryWeaponItem _x}foreach _attachments;

};

//---------------------------------------------------------------------------------------
//For all factions

Nia_gl_ammo={

	for "_i" from 1 to 6 do {_this addItem "hlc_VOG25_AK";};
	for "_i" from 1 to 3 do {_this addItem "hlc_GRD_White";};

};

Nia_gatling={

	private _weaponSet = ["HLC_wp_M134Painless","hlc_500rnd_762x51_Belt",2]; 
	[_this,_weaponSet] call Nia_load_weapons_ammo;
};


Nia_launcher={

	private _weaponSet = selectRandom[["launch_O_Titan_short_F","Titan_AT",2],		["launch_B_Titan_F","Titan_AA",2],["launch_RPG7_F","RPG7_F",6],		["launch_RPG32_F","RPG32_F",4],
									  ["launch_RPG7_F","RPG7_F",6],		["launch_RPG32_F","RPG32_F",4]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;

};	


//---------------------------------------------------------------------------------------
//OPFPR faction



O_nia_primary={
	
	private _weaponSet = selectRandom [["hlc_rifle_ak12","hlc_30Rnd_545x39_B_AK",4],		["hlc_rifle_ak74","hlc_30Rnd_545x39_B_AK",4],		["hlc_rifle_akm","hlc_30Rnd_762x39_b_ak",4],
									   ["hlc_rifle_aek971_mtk","hlc_30Rnd_545x39_B_AK",4]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;
};

O_nia_gl={

	private _weaponSet = selectRandom [["hlc_rifle_ak12GL","hlc_30Rnd_545x39_B_AK",4],			["hlc_rifle_ak74m_gl","hlc_30Rnd_545x39_B_AK",4],			["hlc_rifle_akmgl","hlc_30Rnd_762x39_b_ak",4]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;
};


O_nia_primarylite={
	
	private _weaponSet = selectRandom[["hlc_rifle_aks74u","hlc_30Rnd_545x39_B_AK",4],			["hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",5]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;

};
	
O_nia_primaryheavy={
	
	private _weaponSet = selectRandom[["hlc_rifle_RPK12","hlc_60Rnd_545x39_t_rpk",4],			["hlc_rifle_rpk74n","hlc_60Rnd_545x39_t_rpk",4],			["hlc_rifle_SLRchopmod","hlc_20Rnd_762x51_B_fal",5,["hlc_optic_suit"]],
									  ["hlc_rifle_FAL5000","hlc_20Rnd_762x51_B_fal",5,"[hlc_optic_suit]"],			["hlc_lmg_minimi","hlc_200rnd_556x45_M_SAW",3],			["hlc_lmg_mg42kws_b","hlc_100Rnd_792x57_B_MG42",3]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;

};


	
O_nia_gear={
		_this addVest "V_TacVest_khk";
		_this addHeadgear "H_HelmetO_ocamo";
		_this linkItem "ItemMap";
		_this linkItem "ItemCompass";
		_this linkItem "ItemWatch";
		_this linkItem "ItemGPS";
		_this linkItem "NVGoggles";
		_this linkItem "ItemRadio";
		_this addItem "FirstAidKit";
		
		
};	

O_nia_backpack={
		_this addBackpack "B_ViperLightHarness_hex_F";
};

//---------------------------------------------------------------------------------------
//BLUFOR faction

B_nia_primary={
	
	private _weaponSet = selectRandom [["hlc_rifle_M4","hlc_30rnd_556x45_EPR",4],			["hlc_rifle_G36A1","hlc_30rnd_556x45_EPR_G36",4],			["hlc_rifle_G36V","hlc_30rnd_556x45_EPR_G36",4],
								       ["hlc_rifle_ACR68_SBR_black","hlc_30rnd_68x43_FMJ",4]],			["hlc_rifle_ACR_full_black","hlc_30rnd_556x45_EPR",4],			["hlc_rifle_auga3_b","hlc_30Rnd_556x45_B_AUG",4];
	[_this,_weaponSet] call Nia_load_weapons_ammo;
};

B_nia_gl={

	private _weaponSet = selectRandom [["hlc_rifle_m4m203","hlc_30rnd_556x45_EPR",4],			["hlc_rifle_G36A1AG36","hlc_30rnd_556x45_EPR_G36",4],			["hlc_rifle_G36VAG36","hlc_30rnd_556x45_EPR_G36",4]],
									   ["hlc_rifle_auga3_GL_B","hlc_30Rnd_556x45_B_AUG",4];
	
	
	[_this,_weaponSet] call Nia_load_weapons_ammo;
};


B_nia_primarylite={
	
	private _weaponSet = selectRandom[["hlc_rifle_G36C","hlc_30rnd_556x45_EPR_G36",4],			["hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",5]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;

};
	
B_nia_primaryheavy={
	
	private _weaponSet = selectRandom[["hlc_rifle_awmagnum_BL","hlc_5rnd_300WM_FMJ_AWM",6,["optic_AMS"]],		["hlc_rifle_PSG1A1_RIS","hlc_20rnd_762x51_b_G3",4,["optic_AMS","bipod_01_F_blk"]],		
									  ["hlc_lmg_M249E2","hlc_200rnd_556x45_M_SAW",2],		  ["hlc_lmg_mk48mod1","hlc_100Rnd_762x51_B_M60E4",3],		
									  ["hlc_lmg_minimi","hlc_200rnd_556x45_M_SAW",3],			["hlc_lmg_mg42kws_b","hlc_100Rnd_792x57_B_MG42",3]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;

};


	
B_nia_gear={
		_this addVest "V_PlateCarrier1_rgr";
		_this addHeadgear "H_HelmetB_grass";
		_this linkItem "ItemMap";
		_this linkItem "ItemCompass";
		_this linkItem "ItemWatch";
		_this linkItem "ItemGPS";
		_this linkItem "NVGoggles";
		_this linkItem "ItemRadio";
		_this addItem "FirstAidKit";
		
		
};	

B_nia_backpack={
		_this addBackpack "B_ViperLightHarness_khk_F";
};


//---------------------------------------------------------------------------------------
//INDEPENDENT faction




I_nia_primary={
	
	private _weaponSet = selectRandom [["hlc_rifle_honeybadger","29rnd_300BLK_STANAG",4],			["hlc_rifle_vendimus","29rnd_300BLK_STANAG",4],			["hlc_rifle_g3sg1","hlc_20rnd_762x51_b_G3",5],
								       ["hlc_rifle_hk33a2","hlc_30rnd_556x45_b_HK33",4]],			["hlc_rifle_auga1carb_B","hlc_30Rnd_556x45_B_AUG",4];
	[_this,_weaponSet] call Nia_load_weapons_ammo;
};

I_nia_gl={

	private _weaponSet = selectRandom [["HLC_Rifle_g3ka4_GL","hlc_20rnd_762x51_b_G3",5]];
	
	
	[_this,_weaponSet] call Nia_load_weapons_ammo;
};


I_nia_primarylite={
	
	private _weaponSet = selectRandom[["hlc_rifle_G36C","hlc_30rnd_556x45_EPR_G36",4],			["hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",5],		 ["hlc_rifle_hk51","hlc_20rnd_762x51_b_G3",4]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;

};
	
I_nia_primaryheavy={
	
	private _weaponSet = selectRandom[["hlc_lmg_m60","hlc_100Rnd_762x51_B_M60E4",3],		["hlc_rifle_M14","hlc_20Rnd_762x51_B_M14",4,["hlc_optic_artel_m14"]],		
									  ["hlc_rifle_M1903A1_unertl","hlc_5rnd_3006_1903",8],		 		
									  ["hlc_lmg_minimi","hlc_200rnd_556x45_M_SAW",3],			["hlc_lmg_mg42kws_b","hlc_100Rnd_792x57_B_MG42",3]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;

};


	
I_nia_gear={
		_this addVest "V_PlateCarrierIA1_dgtl";
		_this addHeadgear "H_HelmetIA_net";
		_this linkItem "ItemMap";
		_this linkItem "ItemCompass";
		_this linkItem "ItemWatch";
		_this linkItem "ItemGPS";
		_this linkItem "NVGoggles";
		_this linkItem "ItemRadio";
		_this addItem "FirstAidKit";
		
		
};	

B_nia_backpack={
		_this addBackpack "B_ViperLightHarness_oli_F";
};



//-----------------------------------------------------------------------------

ai_infantry = [

	[ 
		["O_Survivor_F",10,{_this call O_nia_gear;_this call O_nia_primary; }],			["O_Survivor_F",25,{_this call O_nia_gear;_this call O_nia_backpack;_this call O_nia_primarylite;_this call Nia_launcher; }],
		["O_Survivor_F",20,{_this call O_nia_gear;_this call O_nia_primaryheavy;_this call O_nia_backpack;}],			["O_Survivor_F",50,{_this call O_nia_gear;_this call O_nia_backpack;_this call Nia_gatling; }],
		["O_Survivor_F",15,{_this call O_nia_gear; _this call O_nia_backpack; _this call Nia_gl_ammo; _this call O_nia_gl;}]
	],

	[ 
		["B_Survivor_F",10,{_this call B_nia_gear;_this call B_nia_primary; }],			["B_Survivor_F",25,{_this call B_nia_gear;_this call B_nia_backpack;_this call B_nia_primarylite;_this call Nia_launcher; }],
		["B_Survivor_F",20,{_this call B_nia_gear;_this call B_nia_primaryheavy;_this call B_nia_backpack;}],			["B_Survivor_F",50,{_this call B_nia_gear;_this call B_nia_backpack;_this call Nia_gatling; }],
		["B_Survivor_F",15,{_this call B_nia_gear; _this call B_nia_backpack; _this call Nia_gl_ammo; _this call B_nia_gl;}]
	],

	[  
		["I_Survivor_F",10,{_this call I_nia_gear;_this call I_nia_primary; }],			["I_Survivor_F",25,{_this call I_nia_gear;_this call I_nia_backpack;_this call I_nia_primarylite;_this call Nia_launcher; }],
		["I_Survivor_F",20,{_this call I_nia_gear;_this call I_nia_primaryheavy;_this call I_nia_backpack;}],			["I_Survivor_F",50,{_this call I_nia_gear;_this call I_nia_backpack;_this call Nia_gatling; }],
		["I_Survivor_F",15,{_this call I_nia_gear; _this call I_nia_backpack; _this call Nia_gl_ammo; _this call I_nia_gl;}]
	]

			];