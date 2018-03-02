/**
	Author: Jonas Körner

	Code that is injected to monitor function usage. 
	DO NOT ADD THIS TO THE FUNCTIONS LIBRARY!!!!
	This function receives the function name and code as format paramaters 1 and 2
	Don't forget to return the results the function normally returns
*/
private _fnc_scriptNameParent = if (isNil '_fnc_scriptName') then {'%2'} else {_fnc_scriptName};
diag_log ("Running function %1 from " + _fnc_scriptNameParent);
_this call %2