/**
This functions sets all components from the advanced zone generator together
*/
private _candidates = call smm_fnc_getZoneCandidates;
_candidates = _candidates call BIS_fnc_arrayShuffle;
private _overlaps = _candidates call smm_fnc_getOverlappingFromCandidates;

//attach overlaps to candidates 
{
	(_candidates select _forEachIndex) set [4,_overlaps select _forEachIndex];
}forEach _candidates;

private _set = [];
private _importance = 0;
for [{_a=0}, {_a < 10}, {_a = _a + 1}] do {
	//calculate overall importance value of previous
	

	private _currentSet = _candidates call smm_fnc_getIndependentSetFromCandidates;
	private _currentImportance = 0;
	//sum up the importance to replace the old set, if this is better
	{
		_currentImportance = _currentImportance + ((_candidates select _x)select 3);
	}forEach _currentSet;
	
	if(_currentImportance > _importance)then{
		_importance = _currentImportance;
		_set = _currentSet;
	};
	
};

_set