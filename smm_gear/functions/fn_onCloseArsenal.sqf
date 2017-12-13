
// calc new loadout cost
private _cost = [[player, false] call smm_fnc_listInventory] call smm_fnc_calcLoadoutCost;
private _funds = [] call smm_fnc_getBalance;

private _invCostOnOpen = player getVariable "invCostOnOpen";
//diag_log format ["ArsenalShop: invCostOnClose %1", _cost];

// player "sells" his inv when opening arsenal
if (_cost <= (_funds + _invCostOnOpen)) then {
	//diag_log format ["ArsenalShop: new balance %1",(_funds + _invCostOnOpen - _cost)];
	[_invCostOnOpen, getPlayerUID player] call smm_fnc_addMoney;
	[(0 - _cost), getPlayerUID player] call smm_fnc_addMoney;
} else {
	// not enough funds to buy current inv
	// revert inv to inv when player opened arsenal
	[player, (player getVariable "invOnOpen")] call smm_fnc_setInventory;
	hint "You do not have enough money to buy this loadout"; //TODO replace with static
};
