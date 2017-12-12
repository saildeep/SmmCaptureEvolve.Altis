
_cost = _this select 0;

disableSerialization;

_display = uinamespace getVariable "RscDisplayArsenal";
//idc 44346  ok button
_ctrl = _display displayCtrl 44346;
_ctrl ctrlEnable true;
_ctrl ctrlSetText format["%1 $",_cost];
