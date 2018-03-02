/**
	Author: Jonas Körner

	Code that is injected to monitor function usage. 
	DO NOT ADD THIS TO THE FUNCTIONS LIBRARY!!!!
	This function receives the function name and code as format paramaters 1 and 2
	Don't forget to return the results the function normally returns
*/
private _caller = if (isNil '_fnc_scriptName') then {'UNKNOWN'} else {_fnc_scriptName};
private _thisfunctionisalreadyinjectedsodonotinjectagain = "DONOTINJECT";
private _callkey = '%1_callcount';
private _numCalls = missionNamespace getVariable [_callkey,0];
_numCalls = _numCalls + 1;
missionNamespace setVariable [_callkey, _numCalls,false];
%2