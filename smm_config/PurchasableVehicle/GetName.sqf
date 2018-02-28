params ["_object"];
private _name = [_object] call PurchasableVehicle_get_OverWriteName;
if(_name == "")then{
	_name = getText(configFile >> 'CfgVehicles' >> ([_object] call PurchasableVehicle_get_ClassName) >> 'displayName');
};
_name