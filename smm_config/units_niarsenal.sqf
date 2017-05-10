//TODO:o-GL-Eineiten, West/guer-Einheiten,





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




O_nia_primary={
	
	private _weaponSet = selectRandom [["hlc_rifle_ak12","hlc_30Rnd_545x39_B_AK",4],["hlc_rifle_ak74","hlc_30Rnd_545x39_B_AK",4],["hlc_rifle_akm","hlc_30Rnd_762x39_b_ak",4],["hlc_rifle_aek971_mtk","hlc_30Rnd_545x39_B_AK",4]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;
};


O_nia_primarylite={
	
	private _weaponSet = selectRandom[["hlc_rifle_aks74u","hlc_30Rnd_545x39_B_AK",4],["hlc_smg_mp5a2","hlc_30Rnd_9x19_B_MP5",5]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;

};
	
O_nia_primaryheavy={
	
	private _weaponSet = selectRandom[["hlc_rifle_RPK12","hlc_60Rnd_545x39_t_rpk",4],["hlc_rifle_rpk74n","hlc_60Rnd_545x39_t_rpk",4],["hlc_rifle_SLRchopmod","hlc_20Rnd_762x51_B_fal",5,["hlc_optic_suit"]],["hlc_rifle_FAL5000","hlc_20Rnd_762x51_B_fal",5,"[hlc_optic_suit]"],["hlc_lmg_minimi","hlc_200rnd_556x45_M_SAW",3],["hlc_lmg_mg42kws_b","hlc_100Rnd_792x57_B_MG42",3]];
	[_this,_weaponSet] call Nia_load_weapons_ammo;

};

Nia_gatling={

	private _weaponSet = ["HLC_wp_M134Painless","hlc_500rnd_762x51_Belt",2]; 
	[_this,_weaponSet] call Nia_load_weapons_ammo;
};


Nia_launcher={

	private _weaponSet = selectRandom[["launch_O_Titan_short_F","Titan_AT",2],["launch_B_Titan_F","Titan_AA",2],["launch_RPG7_F","RPG7_F",6],["launch_RPG32_F","RPG32_F",4],["launch_RPG7_F","RPG7_F",6],["launch_RPG32_F","RPG32_F",4]];
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

ai_infantry = [

	[ 
		["O_Survivor_F",10,{_this call O_nia_gear;_this call O_nia_primary; }],["O_Survivor_F",15,{_this call O_nia_gear;_this call O_nia_backpack;_this call O_nia_primarylite;_this call Nia_launcher; }],["O_Survivor_F",15,{_this call O_nia_gear;_this call O_nia_primaryheavy;_this call O_nia_backpack;}],["O_Survivor_F",35,{_this call O_nia_gear;_this call O_nia_backpack;_this call Nia_gatling; }]
	],

	[ 
		["B_Survivor_F",10]
	],

	[  
		["I_Survivor_F",10]
	]

			];