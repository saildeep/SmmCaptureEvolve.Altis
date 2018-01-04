
#include "defines.hpp"

private _unstructuredInv = [false, false] call smm_fnc_virtualshop_listInventory;
private _loadoutCost = [_unstructuredInv] call smm_fnc_virtualshop_calcLoadoutCost;
private _credit = [] call smm_fnc_virtualshop_getCredit;
private _invCostOnOpen = missionnamespace getVariable ["smm_fnc_virtualshop_invCostOnOpen", objNull];

if !(_invCostOnOpen isEqualTo objNull) then {
	private _delta = _invCostOnOpen - _loadoutCost;
	CTRL_BUTTON_OK ctrlSetText format [smm_fnc_virtualshop_creditDisplay, _delta, _credit];
};
