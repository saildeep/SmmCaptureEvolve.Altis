
#define TEXTBOX 1400

params [
	"_amountStr"
];

_target = missionNamespace getVariable "transferMoneyTo";
_caller = missionNamespace getVariable "transferMoneyFrom";
_funds = missionNamespace getVariable "transferMoneyFunds";

private _playerFunds = 1000;
private _amount = parseNumber _amountStr;

if (_amount > 0) then {
	systemchat format["transaction to %1 for %2", _target, _amount];
	[_amount * (-1), _caller] call smm_fnc_addMoney;
	[_amount, _target] call smm_fnc_addMoney;
};

closeDialog 0;
