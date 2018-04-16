
_medicUnits = ["medic_blufor_1","medic_blufor_2","medic_blufor_3","medic_blufor_4","medic_independent_1","medic_independent_2","medic_independent_3","medic_independent_4"];
if( ((str player) in _medicUnits) or  ([player,"MEDIC"] call smm_fnc_hasPerk))then{
	player setVariable ["Ace_medical_medicClass", 1,true];
}else{
	player setVariable ["Ace_medical_medicClass", 0,true];
};