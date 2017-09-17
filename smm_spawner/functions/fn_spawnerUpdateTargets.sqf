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
	diag_log ("Candidates are " + (str _cand) + " for " + (str _currentSide) + " before anything");
	if((count _cand) > 0)then{
		//determine center position of all zones owned by this faction
		private _xpos = 0;
		private _ypos = 0;
		private _zpos = 0;
		private _numZonesOfFaction = 0.0001;
		{
			if((_x call smm_fnc_getSide)==_currentSide )then{
				private _p = _x call smm_fnc_getPosition;
				private _s = _x call smm_fnc_getSize;
				_xpos = _xpos + (_p select 0) * _s;
				_ypos = _ypos + (_p select 1) * _s;
				_zpos = _zpos + (_p select 2) * _s;
				_numZonesOfFaction = _numZonesOfFaction + _s;
			};
		}forEach spawnLocs;
		_xpos = _xpos /_numZonesOfFaction;
		_ypos = _ypos /_numZonesOfFaction;
		_zpos = _zpos /_numZonesOfFaction;
		private _center = [_xpos,_ypos,_zpos];
		[_center,20,"ColorRed"] call smm_fnc_createDebugMarker;
		_cand = [_cand,[_center],{(_x call smm_fnc_getPosition) distance  _input0},"ASCEND"] call BIS_fnc_sortBy;
		diag_log ("Candidates are " + (str _cand) + " for " + (str _currentSide) + " after sorting");
		_cand resize (_neededTargets min (count _cand));
		diag_log ("Candidates are " + (str _cand) + " for " + (str _currentSide) + " after selection");
		[_currentSide, _currentTargets + _cand] call smm_fnc_setTargets;
	};

}forEach smm_spawner_all_factions;
publicVariable "activeTargets";
[] remoteExec ["smm_fnc_spawnerUpdateMarkerAlpha",0,false];