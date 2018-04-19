
#define IDC_LNB 1500
#define IDC_COMBO 2100
#define IDC_BUTTON_OK 1600
#define IDC_BUTTON_CANCEL 1601
#define IDC_BUTTON_RM 1602
#define IDC_BUTTON_ADD 1603
#define IDC_TEXT_COST 1000

#define FITS_SEL_VEH_COLOR [0.7,0.9,0.7,1]
#define BASE_PRICE 500
_updateMags = {
	params [
		["_ctrlCombo", controlNull , [controlNull]]
	];

	disableSerialization;

	private _display = ctrlParent _ctrlCombo;
	private _ctrl = _display displayCtrl 1500; // ContentsListNBox

	private _cur = lbCurSel _ctrlCombo;
	private _vehicleName = _ctrlCombo lbData _cur;

	private _boxContents = missionNamespace getVariable ["vehicleAmmoboxContent",[]];
	private _boxMags = _boxContents apply {_x select 0};

	private _availableMags = [];
	{
		{
			_availableMags pushbackUnique _x;
		} forEach _x;
	} forEach (_vehicleName getCompatiblePylonMagazines "");

	{
		if !(_x isEqualTo "Laserbatteries") then {
			_availableMags pushbackUnique _x;
		};
	} forEach ([_vehicleName] call BIS_fnc_magazinesEntityType);

	private _listContents = +_availableMags;
	{
		_listContents pushbackUnique _x;
	} forEach _boxMags;

	lnbClear _ctrl;
	{
		private _amount = 0;
		private _boxIndex = _boxMags find _x;
		if (_boxIndex >= 0) then {_amount = (_boxContents select _boxIndex) select 1;};

		private _name = getText (configFile >> "CfgMagazines" >> _x >> "displayname");
		if (_name isEqualTo "") then {_name = _x;};
		if (count (_name splitString "") > 15) then {
			_name = [_name,0,15] call bis_fnc_trimString;
			_name = _name + "...";
		};

		private _price = 100; // TODO
		private _ammoCount = getNumber (configFile >> "CfgMagazines" >> _x >> "count");

		private _index = _ctrl lnbAddRow [str (_amount * _ammoCount), _name , format [" (%1 $) ", _price], format [" %1 $ ",_price * _amount]]; // TODO make str_pricePerMag and str_priceTotal global
		_ctrl lnbSetData [[_index, 0], _x];
		_ctrl lbSetTooltip [_index * 4, _x];
		
		if (_x in _availableMags) then {
			_ctrl lnbSetColor [[_index,1],FITS_SEL_VEH_COLOR];
			_ctrl lnbSetValue [[_index, 0], 1];
		} else {
			_ctrl lnbSetValue [[_index, 0], 1];
		};

	} forEach _listContents;

	_ctrl lnbSortByValue [0,false];
	_ctrl lnbSetCurSelRow 0;
};

_changeBoxContent = {
	params [
		["_ctrlButton", controlNull, [controlNull]]
	];
	disableSerialization;

	private _add = (ctrlIDC _ctrlButton) == 1603; // add button was pressed
	private _display = ctrlParent _ctrlButton;
	private _ctrl = _display displayCtrl 1500; // ContentsListNBox
	private _cur = lnbCurSelRow _ctrl;
	private _magName = _ctrl lnbData [_cur,0];

	private _boxContents = missionNamespace getVariable ["vehicleAmmoboxContent",[]]; // [[magname1, amount1], [...], ...]
	private _boxMags = _boxContents apply {_x select 0}; // [magname1, magname2, ...]
	private _index = _boxMags find _magName;

	if (_index >= 0) then {
		// mag is present in _boxContents
		private _content = _boxContents select _index;
		if (_add) then {
			_content set [1, (_content select 1) + 1];
		} else {
			if (((_content select 1) - 1) > 0) then {
				_content set [1, (_content select 1) - 1];
			} else {
				_boxContents set [_index, []];
				_boxContents = _boxContents - [[]];
			};
		};
	} else {
		// mag is not yet listed in _boxContents
		if (_add) then {
			_boxContents pushback [_magName, 1];
		};
	};
	missionNamespace setVariable ["vehicleAmmoboxContent", _boxContents, false];
	
	// update amount and totalcost values in listnbox
	_boxMags =  _boxContents apply {_x select 0};
	_index = _boxMags find _magName;
	private _ammoCount = getNumber (configFile >> "CfgMagazines" >> _magName >> "count");
	private _price = 100; // TODO
	if (_index >= 0) then {
		_ctrl lnbSetText [[_cur,0],str (((_boxContents select _index) select 1) * _ammoCount)];
		_ctrl lnbSetText [[_cur,3],format [" %1 $ ",((_boxContents select _index) select 1) * _price]]; // TODO make str_priceTotal global
	} else {
		_ctrl lnbSetText [[_cur,0],"0"];
		_ctrl lnbSetText [[_cur,3],format [" %1 $ ",0]]; // TODO make str_priceTotal global
	};

	// calc total cost and update text
	private _ctrlText = _display displayCtrl 1000; // CostText
	private _totalCost = 0;
	{
		private _magName = _x select 0;
		private _price = 100; // TODO
		_totalCost = _totalCost + _price * (_x select 1);
	} forEach _boxContents;

	_totalCost = _totalCost + (missionNamespace getVariable ["vehicleAmmoboxBasePrice",0]);

	missionNamespace setVariable ["vehicleAmmoboxTotalCost", _totalCost];

	_ctrlText ctrlSetText format ["Total Cost:  %1 $", _totalCost]; // TODO make str_totalcost global
};

_buyAmmobox = {
	params [
		"_ctrl"
	];

	private _boxContents = missionNamespace getVariable ["vehicleAmmoboxContent", []];
	if (true) then { // TODO make transaction
		// TODO spawn crate with contents

		closeDialog 1;
	} else {
		hint "Insufficient funds"; // TODO make string global
	}
};

// ---------------------

params [
	["_display", displayNull, [displayNull]]
];

disableSerialization;

private _purchasableVehicles = buy_units apply {[_x] call PurchasableVehicle_get_ClassName};

missionNamespace setVariable ["vehicleAmmoboxBasePrice", BASE_PRICE];
(_display displayCtrl IDC_TEXT_COST) ctrlSetText format ["Total Cost:  %1 $",BASE_PRICE]; // TODO make str_totalcost global

private _ctrlCombo = _display displayCtrl IDC_COMBO;
{
	_index = _ctrlCombo lbAdd getText (configFile >> "CfgVehicles" >> _x >> "displayname");
	_ctrlCombo lbSetData [_index, _x];
} forEach _purchasableVehicles;
lbSort _ctrlCombo;
_ctrlCombo ctrlAddEventHandler ["lbselchanged", _updateMags];

private _ctrlButtonCancel = _display displayCtrl IDC_BUTTON_CANCEL;
_ctrlButtonCancel ctrlAddEventHandler ["buttonclick", {closeDialog 2}];

private _ctrlButtonOk = _display displayCtrl IDC_BUTTON_OK;
_ctrlButtonOk ctrlAddEventHandler ["buttonclick", _buyAmmobox];

private _ctrlButtonAdd = _display displayCtrl IDC_BUTTON_ADD;
_ctrlButtonAdd ctrlAddEventHandler ["buttonclick", _changeBoxContent];

private _ctrlButtonRm = _display displayCtrl IDC_BUTTON_RM;
_ctrlButtonRm ctrlAddEventHandler ["buttonclick", _changeBoxContent];
