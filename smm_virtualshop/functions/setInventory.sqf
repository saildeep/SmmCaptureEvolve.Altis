
#include "defines.hpp"

private _fncName = "setInventory"; LOGFNCCALL

params [
	["_inv", [], [[]]],
	["_unit", player, [objNull]]
];

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
private _mags = _inv select 10;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

if !(_uniform isEqualTo "") then {_unit forceAddUniform _uniform;};
if !(_vest isEqualTo "") then {_unit addVest _vest;};
if !(_backpack isEqualTo "") then {_unit addBackpack _backpack;};
if !(_headgear isEqualTo "") then {_unit addHeadgear _headgear;};
if !(_goggles isEqualTo "") then {_unit addGoggles _goggles;};

{
	_weapon = _x select 0;
	_unit addWeapon _weapon;
	{
		_unit addWeaponItem [_weapon, _x];
		if (_x isEqualTo "Laserbatteries" || _x isEqualTo ["Laserbatteries",1]) then {_unit addMagazine "Laserbatteries"};
	} forEach (_x - [_x select 0]);
} forEach _weaponsItems;

{_unit addItemToUniform _x} forEach _uniformCargo;
{_unit addItemToVest _x} forEach _vestCargo;
{_unit addItemToBackpack _x} forEach _backpackCargo;
{_unit linkItem _x} forEach _assignedItems;
{_unit addMagazine _x} forEach _mags;
