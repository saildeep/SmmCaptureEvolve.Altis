/**
	Author: Jonas Körner

	Code that is injected to monitor function usage. 
	DO NOT ADD THIS TO THE FUNCTIONS LIBRARY!!!!
	This function receives the function name and code as format paramaters 1 and 2
	Don't forget to return the results the function normally returns
*/
private _caller = if (isNil '_fnc_scriptName') then {'%1'} else {_fnc_scriptName};
if((typeName _caller) == 'CODE')then{
	_caller = 'UNNAMED FUNCTION';
};
if((_caller find '{') > -1)then{
	_caller = 'UNNAMED FUNCTION ' + (str ([str _caller] call smm_fnc_hashString));
};
private _thisfunctionisalreadyinjectedsodonotinjectagain = "DONOTINJECT";
diag_log ('Running function %1 from ' + _caller);


%2