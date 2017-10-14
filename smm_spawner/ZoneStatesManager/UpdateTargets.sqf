///ONLY CALLED ON HC
params["_object"];
private _singleton = call ZoneStatesManager_GetInstance;
assert(_object isEqualTo _singleton);
private _log = { diag_log ("UpdateTargets:" + (format _this)); };
private _targetCollection = [_object] call ZoneStatesManager_get_Targets;

private _currentTargets = [_targetCollection] call TargetCollection_fnc_GetAllTargets;

private _currentTargetCounts = _currentTargets apply {count _x};
["Current Targets are %1 with length %2",_currentTargets,_currentTargetCounts] call _log;
//now compare with smm_spawner_max_targets
private _neededTargets = ([_currentTargetCounts,smm_spawner_max_targets] call smm_fnc_zip) apply{0 max  ((_x select 1) - (_x select 0)) };
private _sides = [_targetCollection] call TargetCollection_fnc_GetSides;
["Needed targets are %1",_neededTargets] call _log;
private _zonesManager = call ZonesManager_GetInstance;

{
	private _numNeeded = _x;
	private _side = _sides select _forEachIndex;
	private _sideIndex = _forEachIndex;


	if(_numNeeded > 0)then{
		//collect all neighbours of sides of this zone that belong to that side
		private _candidateIndices = [];
		{
			
			private _candidateZone = _x;
			if(([_candidateZone] call Zone_get_Owner) == _side)then{
				private _nbIndices = [_candidateZone] call Zone_get_Neighbours;
				{
					private _nbZone = [_zonesManager,_x] call ZonesManager_fnc_GetZone;
					if(([_nbZone] call Zone_get_Owner) != _side  )then{
						_candidateIndices pushBackUnique _x;
					};
					
				}forEach _nbIndices;
			};

			
		} forEach ([_zonesManager] call ZonesManager_get_Zones);

		private _candidates = _candidateIndices apply {[_zonesManager,_x] call ZonesManager_fnc_GetZone };

		//TODO change sorting order, currently selects smallest zone first.
		_candidates = [_candidates,[],{[_x] call Zone_get_Size },"ASCEND"] call BIS_fnc_sortBy;
		//make candidate to selection by resizing to needed or at minimum the avaible zones
		_candidates resize (_numNeeded min (count _candidates));
		["Activating %1",_candidates] call _log;
		{
			private _zs = [_singleton,[_x] call Zone_get_ID ] call ZoneStatesManager_fnc_GetZoneState;
			(_currentTargets select _sideIndex) pushBack ([_x] call Zone_get_ID);
			[_zs] call ZoneState_fnc_ActivateZone;
		}forEach _candidates;
		

	};


} forEach _neededTargets;
call ZoneStatesManager_BroadcastInstance;