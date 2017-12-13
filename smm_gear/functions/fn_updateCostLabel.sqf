
#define DISPLAY (uinamespace getVariable "RscDisplayArsenal")
#define CTRL (DISPLAY displayCtrl 44346)

_cost = _this select 0;
CTRL ctrlEnable true;
CTRL ctrlSetText format["%1 $",_cost];
