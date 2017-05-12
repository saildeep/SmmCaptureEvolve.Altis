/**
Get an independet set from the graph of overlapping zone candidates.
Needs to approximate the inpendent graph problem.
It is important to take care of the importance value.

INPUT: Array of Candidates of type [position,name,size,importance,overlaps]
OUTPUT: Array of indices
*/
diag_log "Starting independent set search";
private _set = [];
private _overlaps = [];


//first determine minimum and maximum importance
private _minImportance = 55555555555;
private _maxImportance = -555555;
{
	_minImportance = _minImportance min (_x select 3);
	_maxImportance = _maxImportance max (_x select 3);
}forEach _this;

for [{_i=0}, {_i < 100000}, {_i = _i + 1}] do {
	private _candidateIndex = floor (random (count _this));
	private _candidate = _this select _candidateIndex;
	private _probability = (_candidate select 3)/_maxImportance;
	if(!(_candidateIndex in _set)&&!(_candidateIndex in _overlaps) && (_probability > (random 1)))then{
		_set pushBackUnique _candidateIndex;
		{
			_overlaps pushBackUnique _x;
		}forEach (_candidate select 4);
	};

};
{
	[(_this select _x) select 0,60,"ColorGreen"] call smm_fnc_createDebugMarker;
}forEach _set;
diag_log ("Finished independent set search, found " + (str (count _set)));
_set