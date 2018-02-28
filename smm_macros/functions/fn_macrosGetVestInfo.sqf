// get vests
// on going work for better info

/*
relevant Vars

*/

_allVest = [];
_allNoCamo = [];
_allCamo = [];
_cfg = (configFile >> "CfgWeapons");   
   
for "_i" from 0 to ((count _cfg)-1) do {   
   
	if (isClass ((_cfg select _i) )) then {   
		_cfgName = configName (_cfg select _i);     
		_cfgVest = ([(configfile >> "CfgWeapons" >> _cfgName),true] call BIS_fnc_returnParents);
		_cfgScope = getNumber (configfile >> "CfgWeapons" >> _cfgName >>"scope");
		if(_cfgScope == 2)then {
			if ((_cfgVest   find "Vest_Camo_Base" )>= 0) then {
					_allCamo append [_cfgName];   
			};
			if ((_cfgVest   find "Vest_NoCamo_Base" )>= 0) then{
					_allNoCamo append [_cfgName];   
			}
		}
	};   
};   
_allUniform = [_allCamo,_allNoCamo];
_allUniform

