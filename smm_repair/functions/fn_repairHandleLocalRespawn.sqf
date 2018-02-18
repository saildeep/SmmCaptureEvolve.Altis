if([player,"REPAIR_SIMPLE"] call smm_fnc_hasPerk)then{
	// 1 = engineer, repair 	up to 40 percent 
	// 2 = advanced engineer 	up to 60 percent
	player setVariable ["ACE_isEngineer", 2,true];
	player setUnitTrait ["engineer",true];
}else{
	player setVariable ["ACE_isEngineer", 0,true];
	player setUnitTrait ["engineer",true];
};