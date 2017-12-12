
disableSerialization;

// calc new loadout cost
_cost = [[player, false] call smm_fnc_listInventory] call smm_fnc_calcLoadoutCost;

_funds = 0; //TODO retrieve player balance


_invCostOnOpen = player getVariable "invCostOnOpen";
diag_log format ["ArsenalShop: invCostOnClose %1", _cost];

// player "sells" his inv when opening arsenal
if (_cost <= (_funds + _invCostOnOpen)) then {
	_balance = _funds + _invCostOnOpen - _cost;
	diag_log format ["ArsenalShop: new balance %1", _balance];
	//TODO apply new balance
} else {
	// not enough funds to buy current inv
	// revert inv to inv when player opened arsenal
	[player, (player getVariable "invOnOpen")] call smm_fnc_setInventory;
	hint "You do not have enough money to buy this loadout"; //TODO replace with static
};
