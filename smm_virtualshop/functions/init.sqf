
with uiNamespace do {

	[] call compile preprocessFile "smm_virtualshop\config.sqf";

	smm_fnc_virtualshop = compile preprocessFile "smm_virtualshop\functions\fn_virtualshop.sqf";
	
	smm_fnc_virtualshop_listInventory = compile preprocessFile "smm_virtualshop\functions\listInventory.sqf";
	smm_fnc_virtualshop_setInventory = compile preprocessFile "smm_virtualshop\functions\setInventory.sqf";
	smm_fnc_virtualshop_calcLoadoutCost = compile preprocessFile "smm_virtualshop\functions\calcLoadoutCost.sqf";
	smm_fnc_virtualshop_isValidLoadout = compile preprocessFile "smm_virtualshop\functions\isValidLoadout.sqf";
	smm_fnc_virtualshop_updateCostLabel = compile preprocessFile "smm_virtualshop\functions\updateCostLabel.sqf";
	
	smm_fnc_virtualshop_init = true;
};
