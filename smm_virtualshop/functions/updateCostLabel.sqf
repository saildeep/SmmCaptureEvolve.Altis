
#include "defines.hpp"

private _unstructuredInv = [false, false] call smm_fnc_virtualshop_listInventory;
private _loadoutCost = [_unstructuredInv] call smm_fnc_virtualshop_calcLoadoutCost;
private _credit = [] call smm_fnc_virtualshop_getCredit;

CTRL_BUTTON_OK ctrlSetText format [smm_fnc_virtualshop_creditDisplay, (missionnamespace getVariable ["smm_fnc_virtualshop_invCostOnOpen", 0]) - _loadoutCost, _credit];
