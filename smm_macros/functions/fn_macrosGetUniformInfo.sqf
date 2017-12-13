// get Uniforms
// on going work for better info

/*
relevant Vars

*/

_allUniform = [];
_cfg = (configFile >> "CfgWeapons");   
   
for "_i" from 0 to ((count _cfg)-1) do {   
   
	if (isClass ((_cfg select _i) )) then {   
		_cfgName = configName (_cfg select _i);     
		_cfgUniform = ([(configfile >> "CfgWeapons" >> _cfgName),true] call BIS_fnc_returnParents) find "Uniform_Base" ;
		if (_cfgUniform >= 0) then {
				_allUniform append [_cfgName];   
		};
	};   
};   

_allUniform

