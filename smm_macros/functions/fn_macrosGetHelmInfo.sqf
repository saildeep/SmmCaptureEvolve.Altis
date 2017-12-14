// return array of all helms
_allHelm= [];
_allBasicHelm=[];
_allCombatHelm=[];
_cfg = (configFile >> "CfgWeapons");   
   
for "_i" from 0 to ((count _cfg)-1) do {   
   
	if (isClass ((_cfg select _i) )) then {   
		_cfgName = configName (_cfg select _i);  
		_cfgScope = getNumber  (configfile >> "CfgWeapons" >> _cfgName >>"scope");   
		_cfgBasicHelm = ([(configfile >> "CfgWeapons" >> _cfgName),true] call BIS_fnc_returnParents) find "HelmetBase" ;
		_cfgCombatHelm = ([(configfile >> "CfgWeapons" >> _cfgName),true] call BIS_fnc_returnParents) find "H_HelmetB" ;
		if ((_cfgBasicHelm >= 0)&& _cfgScope == 2) then {
				_allBasicHelm append [_cfgName];   
		};
		if ((_cfgCombatHelm >= 0)&& _cfgScope == 2) then {
				_allCombatHelm append [_cfgName];   
		};
	};   
};   

_allHelm = [_allBasicHelm,_allCombatHelm];
_allHelm

