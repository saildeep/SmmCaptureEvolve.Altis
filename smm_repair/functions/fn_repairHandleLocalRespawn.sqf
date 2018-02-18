_repairUnits = ["repair_blufor_1","repair_blufor_2","repair_blufor_3","repair_blufor_4","repair_independent_1","repair_independent_2","repair_independent_3","repair_independent_4"];
if((str player) in _repairUnits)then{
	// 1 = engineer, repair 	up to 40 percent 
	// 2 = advanced engineer 	up to 60 percent
	player setVariable ["ACE_isEngineer", 2,true];
	player setUnitTrait ["engineer",true];
}else{
	player setVariable ["ACE_isEngineer", 0,true];
	player setUnitTrait ["engineer",true];
};