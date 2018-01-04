
/*
_printPrices

Parameter: [Config,String,Array,Array,Code]

Config - parent config of relevant entries
	(configfile >> "cfgvehicles") for backpacks
	(configfile >> "cfgweapons") otherwise
	
String - condition to filter irrelevant config entries
	("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'type') < 5") for weapons
	("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'itemInfo' >> 'type') in [605,701,801]") for equipment
	("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'isBackpack') == 1") for backpacks
	
Array - array of functions or code representing criteria, each given a config entry and return a number
	[{getNumber ((_this select 0) >> "maximumLoad")}, {(-1) * (getNumber ((_this select 0) >> "mass"))}] for example

Array - array of numbers representing weighting of each criterion, same length as previous array
	[3,1] for example, here "maximumLoad" is valued higher than "mass"
	
Code - function that is given a number between 0 and 1, returns number representing the price of an item
	{ceil (((_this select 0)^1.5 * 0.9 + 0.1) * 1000)} for example
*/

_printPrices = {

	params [
		["_config", configNull, [configNull]],
		["_condition", "true",[""]],
		["_criteria",objNull,[[]]],
		["_weighting", objNull, [[]]],
		["_function", {_this select 0}, [{}]]
	];

	private _configClasses = (_condition configclasses _config);
	private _weightTotal = 0;
	{_weightTotal = _weightTotal + _x} forEach _weighting;
	
	assert (_weightTotal != 0);
	assert ((count _weighting) == (count _criteria));
	assert ((count _configClasses) != 0);

	_normalize = {
		params [
			["_array", objNull, [[]]]
		];
		assert !(_array isEqualTo objNull);
		
		private _min = selectMin _array;
		private _max = selectMax _array;
		
		private _out = [];
		{
			private _normalizedValue = 0;
			if ((_max - _min) != 0) then {
				_normalizedValue = (_x - _min) / (_max - _min);
			};
			_out set [_forEachIndex, _normalizedValue];
		} forEach _array;
		_out
	};

	private _normalizedValues = [];
	{
		private _fnc = _x;
		private _values = [];
		{
			_values set [_forEachIndex, [_x] call _fnc];
		} forEach _configClasses;
		
		_normalizedValues set [_forEachIndex, [_values] call _normalize];
	} forEach _criteria;

	
	private _combinedValues = [];
	{
		_valuesPerEntry = [];
		_entryIndex = _forEachIndex;
		{
			_valuesPerEntry set [_forEachIndex, (_normalizedValues select _forEachIndex) select _entryIndex];
		} forEach _criteria;
		
		private _sum = 0;
		{
			_sum = _sum + _x * (_weighting select _forEachIndex);
		} forEach _valuesPerEntry;
		_sum = _sum / _weightTotal;
		
		_combinedValues set [_forEachIndex, _sum];
	} forEach _configClasses;
	
	private _normalizedCombinedValues = [_combinedValues] call _normalize;
	private _result = [];
	{
		private _price = [_normalizedCombinedValues select _forEachIndex] call _function;
		_result set [_forEachIndex, [_x, _price]];
	} forEach _configClasses;
	
	private _out = "";
	{
		//_out = _out + format ["[""%1"",""%2"",""TODO"", %3, false] call PurchasableItem_create, $", configName _config, configName (_x select 0), _x select 1];
		_out = _out + format ["%2 | %3 | %1 $", configName (_x select 0), _x select 1, getText ((_x select 0) >> "displayName")];
	} forEach _result;

	copyToClipboard _out;

	_result
};

_weaponCriteria = [
	// mass
	{((-1) * (getNumber ((_this select 0) >> "initSpeed" >> "WeaponSlotsInfo" >> "mass")))},
	
	// damage
	{0},
	
	// firerate
	{getNumber ((_this select 0) >> "initSpeed")},
	
	// precision
	{getNumber ((_this select 0) >> "dispersion")},
	
	// reloadtime
	{getNumber ((_this select 0) >> "reloadtime")},
	
	// range
	{getNumber ((_this select 0) >> "maxzeroing")},
	
	// has burst mode
	{
		if ("Burst" in getArray ((_this select 0) >> "modes")) then {1} else {0};
	},
	
	// has full auto mode
	{
		if ("FullAuto" in getArray ((_this select 0) >> "modes")) then {1} else {0};
	},
	
	// largest available mag
	{
		private _cfg = _this select 0;
		private _max = 0;
		{
			_max = _max max getNumber (configFile >> "CfgMagazines" >> _x >> "count");
		} forEach getArray (_cfg >> "magazines");
		_max
	}
];

switch (_this select 0) do {

	case "backpacks": {
		[
			(configfile >> "cfgvehicles"), 
			("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'isBackpack') == 1 && getNumber (_x >> 'maximumLoad') > 0 "), 
			[{getNumber ((_this select 0) >> "maximumLoad")}, {(-1)*(getNumber ((_this select 0) >> "mass"))}],
			[1,0],
			{
				//ceil (((_this select 0)^1.5 * 0.9 + 0.1) * 1000)
				private _x = _this select 0;
                private _q = 0;
                private _a = 100;
                private _b = 1000;
                
                private _y = ( _b * _x^(1 + _q) * ((_b - _a)/_b) + _a);
                ((ceil (_y / 10)) * 10)
			}
		] call _printPrices;
	};
	
	case "vests": {
		[
			(configfile >> "cfgweapons"), 
			("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'itemInfo' >> 'type') in [605,701,801] && ((((configName _x) splitString '_') select 0) == 'V')"), 
			[
				{
					// ballistic protection
					private _cfg = (_this select 0) >> "itemInfo" >> "HitpointsProtectionInfo";
					private _condition = "isclass _x && configname _x != 'HitBody'";
					if (getnumber ((_this select 0) >> "itemInfo" >> "type") == 801) then {
						_cfg = configfile >> "cfgvehicles" >> gettext ((_this select 0) >> "ItemInfo" >> "uniformclass") >> "HitPoints";
						_condition = "isclass _x && tolower configname _x in ['hitabdomen','hitarms','hitchest','hitdiaphragm','hitneck','hitpelvis']";
					};
					private _sum = 0;
					private _a = 0;
					{
						private _armor = getnumber (_x >> "armor");
						private _passThrough = getnumber (_x >> "passThrough");
						_sum = _sum + (_armor / (1 + _armor))^9 * (1 - _passThrough);
						} foreach configproperties [_cfg,_condition];
					(_sum / (_a + 1))
				},
				
				{
					// explosive protection
					private _cfg = (_this select 0) >> "itemInfo" >> "HitpointsProtectionInfo";
					private _condition = "isclass _x && configname _x != 'HitBody'";
					if (getnumber ((_this select 0) >> "itemInfo" >> "type") == 801) then {
						_cfg = configfile >> "cfgvehicles" >> gettext ((_this select 0) >> "ItemInfo" >> "uniformclass") >> "HitPoints";
						_condition = "isclass _x && tolower configname _x in ['hitabdomen','hitarms','hitchest','hitdiaphragm','hitneck','hitpelvis']";
					};
					private _sum = 0;
					private _a = 0;
					{
						private _armor = getnumber (_x >> "armor");
						_sum = (_armor / (1 + _armor))^18;
						_a = _forEachIndex;
					} foreach configproperties [_cfg,_condition];
					(_sum / (_a + 1))
				},
				
				{
					(getNumber (configfile >> "cfgvehicles" >> gettext ((_this select 0) >> "ItemInfo" >> "containerClass") >> "maximumLoad"))
				},
				
				{
					((-1) * (getNumber ((_this select 0) >> "itemInfo" >> "mass")))
				}
			],
			[1,0,0,0],
			{
				//(ceil (((_this select 0)^1 * 1 + 0) * 100)) * 10
				private _x = _this select 0;
                private _q = 0;
                private _a = 100;
                private _b = 1000;
                
                private _y = ( _b * _x^(1 + _q) * ((_b - _a)/_b) + _a);
                ((ceil (_y / 10)) * 10)
			}
		] call _printPrices;
	};
	
	// todo - fix
	case "weapons":{
				[
			(configfile >> "CfgWeapons"), 
			("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'type') < 5 && getnumber (_x >> 'canLock') == 0 "), 
			
			// "reloadtime","dispersion","maxzeroing","hit","mass","initSpeed"
			[
			{getNumber ((_this select 0) >> "reloadtime")},
			{(getNumber ((_this select 0) >> "dispersion"))},
			{(getNumber ((_this select 0) >> "maxzeroing"))},

			//get hit value
			{	
				private _allhit =[];
				private _getmagazines = getarray ((_this select 0) >> "magazines");
				{
				private	_ammo = gettext (configfile >> "CfgMagazines" >> _x >> "ammo");   
				private	_ammohitvalue = getnumber (configfile >> "CfgAmmo" >> _ammo >> "hit");
						_allhit append [_ammohitvalue];
				}forEach _getmagazines;
				selectMax _allhit
			},
			
			//{(getNumber ((_this select 0) >> "mass"))},

			{(getNumber ((_this select 0) >> "initSpeed"))}
			],
			// weight
			[3,8,0,10,
			//1,
			5],

			{
				//ceil (((_this select 0)^1.5 * 0.9 + 0.1) * 1000)
				private _x = _this select 0;
                private _q = 0;
                private _a = 100;
                private _b = 1000;
                
                private _y = ( _b * _x^(1 + _q) * ((_b - _a)/_b) + _a);
                ((ceil (_y / 10)) * 10)
			}
		] call _printPrices;
	};
	default {false};
};
