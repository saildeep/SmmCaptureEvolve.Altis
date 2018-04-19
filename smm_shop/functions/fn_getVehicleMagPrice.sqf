
params [
	["_magName", "", [""]]
];

private _price = 0;
private _vehicleAmmoPrices = missionNamespace getVariable ["vehicleAmmoPrices", []];
private _index = (_vehicleAmmoPrices apply {_x select 0}) find (getText (configFile >> "CfgMagazines" >> _magName >> "ammo"));
if (_index >= 0) then {
	_price = (_vehicleAmmoPrices select _index) select 1;
} else {
	// mag price was not defined
	// generate mag price dynamically
	private _ammo = getText (configFile >> "CfgMagazines" >> _magName >> "ammo");
	private _count = getNumber (configFile >> "CfgMagazines" >> _magName >> "count");
	private _cost = getNumber (configFile >> "CfgAmmo" >> _ammo >> "cost");
	_price = ceil (_count * _cost * (missionNamespace getVariable ["smm_shop_ammo_cost_multiplier", 1]));
};

_price
