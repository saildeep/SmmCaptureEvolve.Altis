
params [
	["_magName", "", [""]]
];

private _price = 0;
private _ammo = getText (configFile >> "CfgMagazines" >> _magName >> "ammo");
private _index = (allAmmotypes apply {[_x] call PurchasableVehicleAmmo_get_ClassName}) find _ammo;
private _count = getNumber (configFile >> "CfgMagazines" >> _magName >> "count");
if (_index >= 0) then {
	_price = ([allAmmotypes select _index] call PurchasableVehicleAmmo_get_Price) * _count;
} else {
	// mag price was not defined
	// generate mag price dynamically
	
	private _count = getNumber (configFile >> "CfgMagazines" >> _magName >> "count");
	private _cost = getNumber (configFile >> "CfgAmmo" >> _ammo >> "cost");
	_price = ceil (_count * _cost * (missionNamespace getVariable ["smm_shop_ammo_cost_multiplier", 1]));
};

_price
