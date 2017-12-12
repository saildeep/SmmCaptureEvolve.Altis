	
_unit = _this select 0;
_sorted = _this select 1;


_uniform = uniform _unit;
_uniformCargo = uniformItems _unit;
_vest = vest _unit;
_vestCargo = vestItems _unit;
_backpack = backpack _unit;
_backpackCargo = backpackItems _unit;
_headgear = headgear _unit;
_goggles = goggles _unit;
_assignedItems = assignedItems _unit;

_formatWeaponsItems = {
	_w = _this select 0;
	_formated = [];
	{
		_y = _x;
		_weaponAndItems = [_x select 0];
		{
			if (_x isEqualType []) then {
				// current item is magazine, format: ["name",ammo], only save name
				if ((count _x) != 0) then {
					_weaponAndItems set [count _weaponAndItems, _x select 0]
				};
			} else {
				if (!(_x isEqualTo "")) then {
					_weaponAndItems set [count _weaponAndItems, _x]
				}
			}
			
		} forEach (_y - [_y select 0]); // for each item mounted on weapon
		
		_formated set [_forEachIndex, _weaponAndItems];
	} forEach _w; // for each weapon, format: [["weaponname","itemname or empty",...], ...]
	
	_formated
};

_weaponsItems = [weaponsItems _unit] call _formatWeaponsItems;

_inv = [];
if (_sorted) then {
	_inv = [_uniform,
			_uniformCargo,
			_vest,
			_vestCargo,
			_backpack,
			_backpackCargo,
			_headgear,
			_goggles,
			_assignedItems,
			_weaponsItems];
} else {
	_inv = [_uniform] +
			_uniformCargo +
			[_vest] +
			_vestCargo +
			[_backpack] +
			_backpackCargo +
			[_headgear] +
			[_goggles] +
			_assignedItems;
	
	{
		_inv append _x;
	} forEach _weaponsItems;
};

_inv
