/**
Calculates which zone candidates would overlap
Input: Array of Candidates of type [position,name,size,importance]
Output: Array of indices array :[[2,5,7],[],[1],...]
*/
private _doOverlap = {
	private _firstCandidate = _this select 0;
	private _secondCandidate = _this select 1;
	private _summedDistance = (_firstCandidate select 2) + (_secondCandidate select 2);
	(((_firstCandidate select 0) distance (_secondCandidate select 0)) < _summedDistance)
};
private _out = [];
{
	private _currentZone = _x;
	private _marker = [_x select 0,120,"ColorGreen"] call smm_fnc_createDebugMarker;
	_marker setMarkerSize [_x select 2,_x select 2];
	_marker setMarkerShape "ELLIPSE";
	private _currentZoneIndex = _forEachIndex;
	private _overlaps = [];
	{
		private _otherZone = _x;
		private _otherZoneIndex = _forEachIndex;
		
		if((_otherZoneIndex != _currentZoneIndex) && [_currentZone,_otherZone] call _doOverlap)then{
			_overlaps pushBack _otherZoneIndex;
			private _inBetween = [(((_currentZone select 0) select 0) + ((_otherZone select 0) select 0))/2,(((_currentZone select 0) select 1) + ((_otherZone select 0) select 1))/2];
			[_inBetween,120,"ColorGrey"] call smm_fnc_createDebugMarker;
		};
		
	}forEach _this;
	_out set [_currentZoneIndex,_overlaps];
}forEach _this;
_out