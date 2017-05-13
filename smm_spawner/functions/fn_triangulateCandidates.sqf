/**
Calculates a valid triangulation from a set of candidates
Mainly based on:http://fuzzy.cs.ovgu.de/studium/graph/txt/ernst.pdf
	
Input: Array of candidates in format [position,name,size,importance]
	
*/
diag_log "Starting triangulation";
//determine map center by taking average position from all points
private _mapCenterX =0;
private _mapCenterY =0;
{
	_mapCenterX = _mapCenterX + ((_x select 0) select 0);
	_mapCenterY = _mapCenterY + ((_x select 0) select 1);
}forEach _this;

private _mapCenter = [_mapCenterX / (count _this),_mapCenterY/(count _this),0];
diag_log ("Determined candidates center: " + (str _mapCenter));
private _centerMarker = [_mapCenter,120,"ColorOrange"] call smm_fnc_createDebugMarker;
_centerMarker setMarkerText "Center";

//search for candidate that is the nearest from the center of all points
private _middleCandidateIndex = 0;
private _shortestFoundDistance = worldSize;
{
	private _candidatePos = _x select 0;
	private _distanceToCenter = _mapCenter distance _candidatePos;
	if(_distanceToCenter < _shortestFoundDistance)then{
		_middleCandidateIndex = _forEachIndex;
		_shortestFoundDistance = _distanceToCenter;
	};
}forEach _this;
private _middlePos = (_this select _middleCandidateIndex)select 0;
private _middleElementMarker = [_middlePos,120,"ColorOrange"] call smm_fnc_createDebugMarker; 
_middleElementMarker setMarkerText "Middle";


/**
make connection from middle to each other in clockwise orientation and connect the "outer circle".
Comparable to https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/K4_planar.svg/220px-K4_planar.svg.png
Therefore sort them by direction, but first get the directions.
Be carefull, the middle element has also a direction to itself, which is always 0
*/

//stores the directions in format [originalIndex, direction]
private _directions = [];
{
	_directions set [_forEachIndex,[_forEachIndex,_middlePos getDir (_x select 0)]];
}forEach _this;
diag_log ("Directions are " + (str _directions));
private _sorted = [_directions,[],{_x select 1},"ASCEND"] call BIS_fnc_sortBy;
diag_log ("Sorted is " + (str _sorted));
//initialy fill connections array
private _connections = [];
{
	_connections set [_forEachIndex,[]];
}forEach _this;


// do not use _x or _forEachIndex as this is remapped through order
{
	private _index = _x select 0;
	private _nextElementIndex = (_sorted select ((_forEachIndex + 1) mod (count _this) )) select 0;
	//in case the next element is the middle element take this on for connecting
	private _nextAfterNextElementIndex = (_sorted select ((_forEachIndex + 2) mod (count _this) )) select 0;
	private _realX = _x select 1;
	//skip middle candidate
	if(_index != _middleCandidateIndex)then{
		//connect to middle 
		(_connections select _index) pushBack _middleCandidateIndex;
		(_connections select _middleCandidateIndex) pushBack _index;
		
		//if next element is not middle, connect to it, otherwise connect to the next after next
		private _connectTo = if(_nextElementIndex == _middleCandidateIndex)then{_nextAfterNextElementIndex}else{_nextElementIndex};
		(_connections select _index) pushBack _connectTo;
		(_connections select _connectTo) pushBack _index;
	};
}forEach _sorted;

/**
Setup debug drawing of triangulation
*/

private _drawTriangulation = {
/**
Input: [candidates,connections]
*/
	private _candidates = _this select 0;
	private _connections = _this select 1;
	private _markers = [];
	{
		//draw marker for zone
		[_x select 0,30,"ColorOrange"] call smm_fnc_createDebugMarker;
		private _cConnections = _connections select _forEachIndex;
		private _currentCandidate = _x;
		{
			private _otherCandidate = _candidates select _x;
			_markers pushBack ([_currentCandidate select 0, _otherCandidate select 0,30,"ColorOrange"] call smm_fnc_createDebugLine);
		}forEach _cConnections;
	}forEach _candidates;
	_markers
};

private _removeDrawing = {
/**
Input marker array
*/
	{
		deleteMarker _x;
	}forEach _this;
};

private _drawing = [_this,_connections] call _drawTriangulation;




diag_log "Finished triangulation";