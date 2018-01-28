// return array of all weapon backpacks 
// todo finish
// current status return all backpacks
// the script should return only the backpack weapons afterwards
_allBackpackWeapons= [];
_cfg = (configFile >> "cfgvehicles");   
   
for "_i" from 0 to ((count _cfg)-1) do {   
   
	if (isClass ((_cfg select _i) )) then {   
		_cfgName = configName (_cfg select _i);  
		_cfgScope = getNumber  (configfile >> "cfgvehicles" >> _cfgName >>"scope");   
		_cfgBackpack = getNumber (configfile >> "cfgvehicles" >> _cfgName >>"isBackpack");
		_cfgBW = ([(configfile >> "cfgvehicles" >> _cfgName),true] call BIS_fnc_returnParents) find "Bag_Base" ;
		if ( (_cfgBW > 0) && _cfgScope == 2 && _cfgBackpack == 1 ) then {
				_allBackpackWeapons append [_cfgName];   
		};
	};   
};   

_allBackpackWeapons
