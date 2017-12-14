
#define DISPLAY (uinamespace getVariable "RscDisplayArsenal")
#define CTRL_BUTTON (DISPLAY displayCtrl 44346)
#define CTLR_INFO (DISPLAY displayCtrl 24516)

_cost = _this select 0;
CTRL_BUTTON ctrlEnable true;
CTRL_BUTTON ctrlSetText format["%1 $   |   %2 $",(_cost - (player getVariable "invCostOnOpen")), ([] call smm_fnc_getBalance)];


_Hypno_fnc_getName = {
//Modified by Iceman77
   private["_this","_name","_default","_out","_cfgWeapons","_cfgMagazines"];

   _displayName = _this select 0;
   _default = [_this, 1, "ERROR: Item not found"] call BIS_fnc_param;
   _out = _default;
   _cfgWeapons = configFile >> "CfgWeapons";
   _cfgMagazines = configFile >> "CfgMagazines";

   for "_i" from 0 to count (_cfgWeapons) - 1 do {
    if (isClass (_cfgWeapons select _i)) then {
		if (_displayName == getText(_cfgWeapons select _i >> "displayName")) exitWith {
			_out = configName (_cfgWeapons select _i);
		};
	};
   };
   if (_out != _default) exitWith {_out};
   for "_i" from 0 to count (_cfgMagazines) - 1 do {
    if (isClass (_cfgMagazines select _i)) then {
		if (_displayName == getText(_cfgMagazines select _i >> "displayName")) exitWith {
			_out = configName(_cfgMagazines select _i);
		};
	};
   };
   _out 
};  

//CTLR_INFO ctrlSetText format ["%1 $   |   %2", 9999, (ctrlText CTLR_INFO)];
