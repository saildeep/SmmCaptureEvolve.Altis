/**
	Author:Jonas Körner

	Injects all functions found in missionNamespace
	Can be called multiple times
*/

private _fnNames = allVariables missionNamespace;
_fnNames = _fnNames select {(typeName (missionNamespace getVariable _x)) == "CODE"};
_fnNames = _fnNames select {(_x find "bis_") != 0}; //filter out bis functions
_fnNames = _fnNames select {(_x find "ace_") != 0}; //filter out ace functions
_fnNames = _fnNames select {(_x find "cba_") != 0}; //filter out cba functions
_fnNames = _fnNames select {(_x find "tfar_") != 0}; //filter out cba functions
_callcountnames = missionNamespace getVariable ["callcounts",[]];
{
	diag_log ("Injecting " + _x);
	[_x,missionNamespace] call smm_fnc_injectMonitorCode;
	_callcountnames pushBackUnique (_x + "_callcount");
} forEach _fnNames;
missionNamespace setVariable["callcounts",_callcountnames,false];