/**
	Author:Jonas Körner

	Injects all functions found in missionNamespace
*/

private _fnNames = allVariables missionNamespace;
_fnNames = _fnNames select {(typeName (missionNamespace getVariable _x)) == "CODE"};
_fnNames = _fnNames select {(_x find "bis_") != 0}; //filter out bis functions
_fnNames = _fnNames select {(_x find "ace_") != 0}; //filter out ace functions
_fnNames = _fnNames select {(_x find "cba_") != 0}; //filter out cba functions
_fnNames = _fnNames select {(_x find "tfar_") != 0}; //filter out cba functions
{
	diag_log ("Injecting " + _x);
	[_x,missionNamespace] call smm_fnc_injectMonitorCode;
	
} forEach _fnNames;