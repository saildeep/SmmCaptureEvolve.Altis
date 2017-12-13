
private _unit = _this select 0;
private _inv = _this select 1;

private _uniform = _inv select 0;
private _uniformCargo = _inv select 1;
private _vest = _inv select 2;
private _vestCargo = _inv select 3;
private _backpack = _inv select 4;
private _backpackCargo = _inv select 5;
private _headgear = _inv select 6;
private _goggles = _inv select 7;
private _assignedItems = _inv select 8;
private _weaponsItems = _inv select 9;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

{
	_w = _x select 0;
	_unit addWeapon _w;
	{
		_unit addWeaponItem [_w, _x];
	} forEach (_x - [_x select 0]);
} forEach _weaponsItems;
_unit forceAddUniform _uniform;
{_unit addItemToUniform _x} forEach _uniformCargo;
_unit addVest _vest;
{_unit addItemToVest _x} forEach _vestCargo;
_unit addBackpack _backpack;
{_unit addItemToBackpack _x} forEach _backpackCargo;
_unit addHeadgear _headgear;
_unit addGoggles _goggles;
{_unit linkItem _x} forEach _assignedItems;
