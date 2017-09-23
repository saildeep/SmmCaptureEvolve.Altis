///ONLY CALLED ON HC
params["_object"];
private _singleton = call ZoneStatesManager_GetInstance;
assert(_object isEqualTo _singleton);

private _targetCollection = [_object] call ZoneStatesManager_get_Targets;
private _currentTargets = [_targetCollection] call TargetCollection_fnc_GetAllTargets;
private _currentTargetCounts = _currentTargets apply {count _x};

//now compare with smm_spawner_max_targets
private _neededTargets = ([_currentTargetsCounts,smm_spawner_max_targets] call smm_fnc_zip) apply{abs( (_x select 1) - (_x select 0)) };
private _sides = [_targetCollection] call TargetCollection_fnc_GetSides;

{
	private _numNeeded = _x;
	private _side = _sides select _forEachIndex;
	
	//TODO continue generating targets

} forEach _neededTargets;