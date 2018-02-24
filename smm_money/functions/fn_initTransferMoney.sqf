
#define IDC_LABEL_FUNDS 1001
#define IDC_LABEL_TOPIC 1000
#define IDC_TEXTFIELD 1400
#define IDC_SLIDER 1900
#define DIALOG (findDisplay 45600)

#define SLIDER_STEPS 10

params [
	"_target",
	"_caller",
	"_id"
];

_success = createDialog "RscTransferMoney";

if (_success) then {
	
	private _funds = 10000; //TODO
	
	missionNamespace setVariable ["transferMoneyTo", _target];
	missionNamespace setVariable ["transferMoneyFrom", _caller];
	missionNamespace setVariable ["transferMoneyFunds", _funds];
	
	ctrlSetText [IDC_LABEL_FUNDS, format ["/ %1", _funds]];
	ctrlSetText [IDC_LABEL_TOPIC, format ["Transfer Money to %1", name _target]];
	
	ctrlSetText [IDC_TEXTFIELD, ""];
	
	sliderSetRange [IDC_SLIDER, 0, SLIDER_STEPS];
	sliderSetPosition [IDC_SLIDER, 0];
	
	_ehSliderChanged = (DIALOG displayCtrl IDC_SLIDER) ctrlAddEventHandler [
		"SliderPosChanged", 
		{ctrlSetText [IDC_TEXTFIELD, str ceil (((_this select 1) * (missionNamespace getVariable "transferMoneyFunds")) / SLIDER_STEPS)]}
	];
	
	_ehTextfieldChanged = DIALOG displayAddEventHandler [
		"char",
		{[] spawn {
			sleep 0.01;
			private _n = ceil parseNumber ctrlText IDC_TEXTFIELD;
			ctrlSetText [IDC_TEXTFIELD, str ((_n min (missionNamespace getVariable 'transferMoneyFunds')) max 0)]; 
			sliderSetPosition [IDC_SLIDER, _n/((missionNamespace getVariable 'transferMoneyFunds') + 1) * SLIDER_STEPS];
		}}
	];	
	
} else {
	diag_log "Error: could not open RscTransferMoney dialog";
};
