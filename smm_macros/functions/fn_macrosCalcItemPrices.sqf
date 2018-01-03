
/*
#define STATS_WEAPONS\
    ["reloadtime","dispersion","maxzeroing","hit","mass","initSpeed"],\
    [true,true,false,true,false,false]

#define STATS_EQUIPMENT\
    ["passthrough","armor","maximumLoad","mass"],\
    [false,false,false,false]

private _weaponStats = [("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'type') < 5") configclasses (configfile >> "cfgweapons"), STATS_WEAPONS] call bis_fnc_configExtremes;
private _statsEquipment = [("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'itemInfo' >> 'type') in [605,701,801]") configclasses (configfile >> "cfgweapons"), STATS_EQUIPMENT] call bis_fnc_configExtremes;
private _statsBackpacks = [("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'isBackpack') == 1") configclasses (configfile >> "cfgvehicles"), STATS_EQUIPMENT] call bis_fnc_configExtremes;
*/

////////////////////////////////////////////////////////////////////////////////////////////////////

_printPrices = {

	/*
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

	params [
		["_config", configNull, [configNull]],
		["_condition", "true",[""]],
		["_criteria",objNull,[[]]],
		["_weighting", objNull, [[]]],
		["_function", {_this select 0}, [{}]]
	];

	assert ((count _weighting) == (count _criteria));



	private _min = [];
	private _max = [];
	_min resize (count _criteria);
	_max resize (count _criteria);
	{_min set [_forEachIndex,objNull]} forEach _min;
	{_max set [_forEachIndex,objNull]} forEach _max;

	{
		private _y = _x;
		{	
			_value = [_y] call _x;
			if !((_min select _forEachIndex) isEqualTo objNull) then {
				_min set [_forEachIndex, (_min select _forEachIndex) min _value];
			} else {
				_min set [_forEachIndex, _value];
			};
			
			if !((_max select _forEachIndex) isEqualTo objNull) then {
				_max set [_forEachIndex, (_max select _forEachIndex) max _value];
			} else {
				_max set [_forEachIndex, _value];
			};
		} forEach _criteria;
	} forEach (_condition configclasses _config);

	private _extremes = [_min, _max];
	private _weightTotal = 0;
	{_weightTotal = _weightTotal + _x} forEach _weighting;

	private _temp = [];
	{
		private _y = _x;
		private _sum = 0;
		{
			if (((_max select _forEachIndex)-(_min select _forEachIndex)) == 0) exitWith {systemchat format ["min %1 max %2 criterion %3",_min,_max,_forEachIndex]};
			private _value = [_y] call _x;
			private _normValue = ((_value - (_min select _forEachIndex)) / ((_max select _forEachIndex)-(_min select _forEachIndex)));
			_sum = _sum + _normValue * (_weighting select _forEachIndex);
		} forEach _criteria;
		_temp set [count _temp, [_y,_sum / _weightTotal]];
	} forEach (_condition configclasses _config);
	
	private _maxValue = 0;
	private _minValue = 1;
	{
		_maxValue = _maxValue max (_x select 1);
		_minValue = _minValue min (_x select 1);
	} forEach _temp;
	
	private _result = [];
	{
		_result set [count _result, [_x select 0, [((_x select 1) - _minValue)/(_maxValue - _minValue)] call _function]];
	} forEach _temp;

	private _out = "";
	{
		//_out = _out + format ["[""%1"",""%2"",""TODO"", %3, false] call PurchasableItem_create, $", configName _config, configName (_x select 0), _x select 1];
		_out = _out + format ["%2 %3 %1 $", configName (_x select 0), _x select 1, getText ((_x select 0) >> "displayName")];
	} forEach _result;

	copyToClipboard _out;

	_result
};

switch (_this select 0) do {

	case "backpacks": {
		[
			(configfile >> "cfgvehicles"), 
			("isclass _x && getnumber (_x >> 'scope') == 2 && getnumber (_x >> 'isBackpack') == 1"), 
			[{getNumber ((_this select 0) >> "maximumLoad")}, {(-1)*(getNumber ((_this select 0) >> "mass"))}],
			[1,0],
			{
				_this select 0
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
				(ceil (((_this select 0)^1 * 1 + 0) * 100)) * 10
			}
		] call _printPrices;
	};
	
	default {false};
};
