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
private _numIterations = if(smm_debug)then{2}else{20};
diag_log ("Finding independent set with " + (str _numIterations) + " iterations");
for [{_a=0}, {_a < _numIterations}, {_a = _a + 1}] do {
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
_chosenCandidates = [];
{
	_chosenCandidates pushBack (_candidates select _x);
}forEach _set;



private _connections = _chosenCandidates call smm_fnc_triangulateCandidates;
//convert to spawnlocs format now [position,hash,size,owner,connections,name]
private _out = [];

//TODO better startzone algorithm
{
	diag_log ("Searching helipads for " + (str (_x select 0)));
	private _owner = smm_spawner_default_owner;
	if(_forEachIndex < (count smm_spawner_player_factions))then{
		_owner = smm_spawner_player_factions select _forEachIndex;
	};

	private _pos = _x select 0;
	private _r = _x select 2;
	


	private _c = [_x select 0, str (_x select 0),_x select 2,_owner,_connections select _forEachIndex,_x select 1,[_pos,_r*0.5,_r+300,if(smm_debug)then{1}else{10},if(smm_debug)then{3}else{30}] call smm_fnc_getHelipadPositions];
	_out pushBack _c;
}forEach _chosenCandidates;


private _itemids = _out call smm_fnc_distributeItems;
_itemids