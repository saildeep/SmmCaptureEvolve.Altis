
//diag_log format ["initDisplay %1", _this];

_virtualshop_script = {
	//diag_log format ["script %1", _this];
	_mode = _this select 0;
	_params = _this select 1;
	_class = _this select 2;

	switch _mode do {
		case "onLoad": {
			if (isnil {missionnamespace getvariable "bis_fnc_arsenal_data"}) then {
				startloadingscreen [""];
				['Init',_params] spawn smm_fnc_virtualshop;
			} else {
				['Init',_params] call smm_fnc_virtualshop;
			};
		};
		case "onUnload": {
			['Exit',_params] call smm_fnc_virtualshop;
		};
	};
};


with uiNamespace do
{
	params 
	[
	["_mode", "", [""]],
	["_params", []],
	["_class", "", [""]],
	["_path", "default", [""]],
	["_register", true, [true, 0]]
	];

	_display = _params param [0, displayNull];
	if (isNull _display) exitWith {diag_log "displayNull"; nil};

	if (_register isEqualType true) then {_register = parseNumber _register};
	if (_register > 0) then 
	{
		_varDisplays = _path + "_displays";
		_displays = (uiNamespace getVariable [_varDisplays, []]) - [displayNull];

		if (_mode == "onLoad") exitWith 
		{

			_display setVariable ["BIS_fnc_initDisplay_configClass", _class];
			uiNamespace setVariable [_class, _display];

			_displays pushBackUnique _display;
			uiNamespace setVariable [_varDisplays, _displays];

			if !(uiNamespace getVariable ["BIS_initGame", false]) then 
			{
				uiNamespace setVariable ["BIS_initGame", _path == "GUI" && {ctrlIdd _x >= 0} count _displays > 1];
			};
		};

		if (_mode == "onUnload") exitWith 
		{
			_displays = _displays - [_display];
			uiNamespace setVariable [_varDisplays, _displays];
		};
	};

	if (!cheatsEnabled) exitWith 
	{
		[_mode, _params, _class] call _virtualshop_script;
		nil
	};

	if !(uiNamespace getVariable ["BIS_disableUIscripts", false]) then 
	{
		[_mode, _params, _class] call _virtualshop_script;
		nil
	};
};