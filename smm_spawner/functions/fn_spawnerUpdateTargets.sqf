{
if(isNil "spawner_init_finished")exitWith{false};
[] call smm_fnc_cleanupTargets;
private _currentSide = _x;
private _maxTargets = smm_spawner_max_targets select _forEachIndex;
private _currentTargets = (_currentSide call smm_fnc_getTargets);
assert (typeName _currentSide == "SIDE");
assert(typeName _maxTargets == "SCALAR");
assert(typeName _currentTargets == "ARRAY");
private _ccand = [_currentSide] call smm_fnc_SpawnerDeterminePossibleTargets;
private _cand = _ccand - _currentTargets;
private _neededTargets = _maxTargets - (count _currentTargets);
_cand resize _neededTargets;
[_currentSide, _currentTargets + _cand] call smm_fnc_setTargets;

}forEach smm_spawner_all_factions;
publicVariable "activeTargets";
[] remoteExec ["smm_fnc_spawnerUpdateMarkerAlpha",0,false];