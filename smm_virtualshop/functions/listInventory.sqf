
#include "defines.hpp"

private _fncName = "listInventory"; LOGFNCCALL

params [
	["_structered", true, [true]],
	["_saveMagContents", false, [true]],
	["_unit", player, [objNull]]
];

// if _structered is false array of unique items in inv is returned
// otherwise see specific structure (see below) is returned

private _uniform = uniform _unit;
private _uniformCargo = uniformItems _unit;
private _vest = vest _unit;
private _vestCargo = vestItems _unit;
private _backpack = (backpack _unit);
private _backpackCargo = backpackItems _unit;
private _headgear = headgear _unit;
private _goggles = goggles _unit;
private _assignedItems = assignedItems _unit;
private _weaponsItems = weaponsItems _unit;
private _mags = [];

if (_saveMagContents) then {

	_mags = magazinesAmmo _unit;
	{
		_uniformCargo = _uniformCargo - [_x select 0];
		_vestCargo = _vestCargo - [_x select 0];
		_backpackCargo = _backpackCargo - [_x select 0];
	} forEach _mags;
	
} else {
	{
		_y = _x;
		{
			if (_x isEqualType []) then {
				if (_x isEqualTo []) then {
					_y set [_foreachIndex, ""];
				} else {
					_y set [_foreachIndex, _x select 0];
				};
			};
		} forEach _y;
	} forEach _weaponsItems;
};

// remove binoculars from assignedItems since they are already listed in weaponsItems 
// together with their mag which is important for laser designator
_weapons = [];
{
	_weapons set [count _weapons, _x select 0];
} forEach _weaponsItems;
_assignedItems = _assignedItems - _weapons;

/* TODO
// replace all weapons with their base version
// to avoid spawning unwanted attachments to weapons that were picked up from enemies
{
	private _weapon = _x select 0;
	private _base = getText (configfile >> "CfgWeapons" >> _weapon >> "baseWeapon");
	
	if (!isNil "_base") then {
		_x set [0, _base];
	};
} forEach _weaponsItems;
*/

// replace backpack with base version if necessary
if ((getNumber (configfile >> "CfgVehicles" >> _backpack >> "scope")) != 2) then {
	{
		private _cfgName = configName _x;
		if ((_backpack find _cfgName) >= 0) then {
			// _cfgName is base version of current backpack
			// replace backpack with base version
			_backpack = _cfgName;
		};
	} forEach (("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'isBackpack') == 1") configClasses (configFile >> "CfgVehicles"));
};

private _inv = [];
if (_structered) then {
	_inv = [
		_uniform,
		_uniformCargo,
		_vest,
		_vestCargo,
		_backpack,
		_backpackCargo,
		_headgear,
		_goggles,
		_assignedItems,
		_weaponsItems,
		_mags];
	
} else {
	_inv = 
		[_uniform] +
		_uniformCargo +
		[_vest] +
		_vestCargo +
		[_backpack] +
		_backpackCargo +
		[_headgear] +
		[_goggles] +
		_assignedItems + 
		_mags;

	{
		{_inv set [count _inv, _x]} forEach _x;
	} forEach _weaponsItems;
	
	_inv = (_inv - [""]) - [[]];
};

_inv
