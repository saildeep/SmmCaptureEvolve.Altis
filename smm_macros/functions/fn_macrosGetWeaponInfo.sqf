// get weapon magazines 
// on going work for better info

/*
relevant Vars

_cleanMagList 	= all used magazines
_weaponMagList 	= all used [weapon, magazines per weapon] 


*/

_weaponList = (allItems select  
{([_x] call PurchasableItem_get_ConfigFile) == "CfgWeapons" } 
) apply { [_x] call PurchasableItem_get_ClassName}; 
 
_cfgmagazines = configFile >> "cfgmagazines"; 
 
_weaponMagList=[]; 
_magList=[]; 

_cleanMagList=[];
{ 

_weaponMagList pushBack [_x , (getArray(configfile >> "CfgWeapons" >> _x  >> "magazines")) ];

_localMagList = (getArray(configfile >> "CfgWeapons" >> _x  >> "magazines"));

_magList pushBack _localMagList;
 
{
_cleanMagList pushBackUnique _x ;  
} forEach _localMagList;

} 
forEach _weaponList;
_weaponMagList


