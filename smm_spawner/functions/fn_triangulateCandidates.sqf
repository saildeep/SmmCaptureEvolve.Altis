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
Generate initial triangulation

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
//initialy the current triangulation state is stored here
private _triangles = [];


// do not use _x or _forEachIndex as this is remapped through order
{
	private _index = _x select 0;
	private _nextElementIndex = (_sorted select ((_forEachIndex + 1) mod (count _this) )) select 0;
	//in case the next element is the middle element take this on for connecting
	private _nextAfterNextElementIndex = (_sorted select ((_forEachIndex + 2) mod (count _this) )) select 0;
	private _realX = _x select 1;
	//skip middle candidate
	if(_index != _middleCandidateIndex)then{
	
		private _connectTo = if(_nextElementIndex == _middleCandidateIndex)then{_nextAfterNextElementIndex}else{_nextElementIndex};
		_triangles pushBack [_middleCandidateIndex,_index,_connectTo];
	};
}forEach _sorted;

/**
Setup debug drawing of triangulation
*/

private _drawTriangulation = {
/**
Input: [candidates,connections,color (optional)]
*/
	private _candidates = _this select 0;
	private _triangles = _this select 1;
	private _color = "ColorOrange";
	if((count _this) > 2)then{
		_color = _this select 2;
	};
	private _markers = [];
	{
		//get positions of triangle edges
		private _vertices = _x apply {(_candidates select _x) select 0};
		//create triangle edge markers
		_markers append (_vertices apply {[_x,20,_color] call smm_fnc_createDebugMarker});
		private _edges = [
		[_vertices select 0, _vertices select 1],
		[_vertices select 1, _vertices select 2],
		[_vertices select 2, _vertices select 0]
		];
		
		_markers append (_edges apply {[_x select 0, _x select 1,20,_color] call smm_fnc_createDebugLine});
		
	}forEach _triangles;
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

/**
Setup helper methods for generating a delauny triangulation from the existing one
*/

private _getTrianglesWithCommonEdge={
/**
Get all triangles that have exactly one edge in common with the given one
Input :[alltriangles,triangle]
Output: Array of [triangle,nonCommonVerticeIndex] tuples;
*/
	private _triangles = _this select 0;
	private _triangleToSearchFor = _this select 1;
	private _out = [];
	{
		//check if they have 1 vertice that is not common between the two triangles
		private _differenceSet = _x - _triangleToSearchFor;
		if((count _differenceSet)==1)then{
			_out pushBack [_x,_differenceSet select 0];
		};
	}forEach _triangles;
	_out
};

private _getPerimeter={
/**
Gets the perimeter of a specific triangle
https://de.wikipedia.org/wiki/Umkreis
Has Problems with certain triangles
Input:[candidates,triangle]
Output:[center,radius]
*/
	private _candidates = _this select 0;
	private _triangle = _this select 1;
	
	private _vertices = _triangle apply {(_candidates select _x)select 0};
	private _edgeSizes = [
	(_vertices select 1) distance (_vertices select 2),
	(_vertices select 0) distance (_vertices select 2),
	(_vertices select 0) distance (_vertices select 1)
	];
	//calculate area as described in https://de.wikipedia.org/wiki/Satz_des_Heron
	private _s = ((_edgeSizes select 0) + (_edgeSizes select 1) + (_edgeSizes select 2)) / 2;
	private _A = sqrt ( _s * (_s - (_edgeSizes select 0)) * (_s - (_edgeSizes select 1))* (_s - (_edgeSizes select 2)));
	
	
	if(_A == 0)then{
	diag_log "Warning: Perimeter calculation failed due to _A=0";
	diag_log ("S: " + (str _s));
	diag_log ("Edge sizes: " + (str _edgeSizes));
	diag_log ("Vertices: " + (str _vertices));
	diag_log ("Triangle:" + (str _triangle));
	_A = 0.000001;
	};
	//calculate perimeter radius from area
	private _R = (_edgeSizes select 0) * (_edgeSizes select 1) * (_edgeSizes select 2) / (4 * _A);
	
	//calculate center of perimeter according to https://de.wikipedia.org/wiki/Umkreis
	private _x1 = (_vertices select 0) select 0;
	private _x2 = (_vertices select 1) select 0;
	private _x3 = (_vertices select 2) select 0;
	
	private _y1 = (_vertices select 0) select 1;
	private _y2 = (_vertices select 1) select 1;
	private _y3 = (_vertices select 2) select 1;
	
	private _d = 2 * (_x1 * (_y2 -_y3) + _x2 * (_y3 - _y1) + _x3 * (_y1 - _y2));
	private _centerx = ((_x1 * _x1 + _y1 * _y1) * (_y2 -_y3) + (_x2 * _x2 + _y2 * _y2) * (_y3 - _y1) + (_x3 * _x3 + _y3 * _y3) * (_y1 -_y2))/_d;
	private _centery = ((_x1 * _x1 + _y1 * _y1) * (_x3 -_x2) + (_x2 * _x2 + _y2 * _y2) * (_x1 - _x3) + (_x3 * _x3 + _y3 * _y3) * (_x2 -_x1))/_d;
	
	[[_centerx,_centery],_R]
};

private _isInPerimter = {
/**
 Checks if a given index is in a given perimter
 Input:[candidates,perimeter,index]
*/
	private _position = ((_this select 0) select (_this select 2)) select 0;
	private _perimeterRadius = (_this select 1) select 1;
	private _perimeterCenter = (_this select 1) select 0;
	(_position distance _perimeterCenter) < _perimeterRadius

};

private _flip = {
/**
 flips two given triangles in the given array, assumes they have exactly one edge in common
 Input:[allTriangles,triangle 1, triangle 2]
 
 BEFORE:
 common[0] *----* t1lonley
           |\   |
	t2	   | \  |  t1
           |  \ |
		   |   \|
  t2lonley *----* common [1]
  
 AFTER:
 common[0] *----* t1lonley
           |   /|
	t2	   |  / | t1
           | /  |
		   |/
  t2lonley *----* common [1]
*/
	private _allTriangles = _this select 0;
	private _t1 = _this select 1;
	private _t2 = _this select 2;
	private _t1Index = _allTriangles find _t1;
	private _t2Index = _allTriangles find _t2;
	
	//now get t1 and t2 from real array
	_t1 = _allTriangles select _t1Index;
	_t2 = _allTriangles select _t2Index;
	
	
	//get vertices that do not are on the common edge, but keep them in a single element array
	private _t1Lonley = _t1 - _t2;
	private _t2Lonley = _t2 - _t1;
	
	private _common = _t1 - _t1Lonley;
	_t1 set [_t1 find (_common select 0),_t2Lonley select 0]; //replace common0 in t1 with t2lonley
	_t2 set [_t2 find (_common select 1),_t1Lonley select 0]; //places common 1 in t2 with t1lonley
};

/**
Draw one triangle with perimter for debug
*/

private _randomTriangleSet = [selectRandom _triangles];
private _drawing = [_this,_randomTriangleSet,"ColorGreen"] call _drawTriangulation;
private _testPerimeter = [_this,_randomTriangleSet select 0] call _getPerimeter;
private _perimterMarker = [_testPerimeter select 0,20,"ColorRed"] call smm_fnc_createDebugMarker;
_perimterMarker setMarkerSize [_testPerimeter select 1, _testPerimeter select 1];
_perimterMarker setMarkerShape "ELLIPSE";
sleep 5;
deleteMarker _perimterMarker;
_drawing call _removeDrawing;


/**Do delauny stuff with flip algorithm

*/

private _runsWithoutFlip = 0;
private _i = 0;
private _currentTriangleDrawing = [_this,[_triangles select _i],"ColorRed"] call _drawTriangulation;
while{_runsWithoutFlip < (count _triangles)}do{
	private _currentTriangle = _triangles select _i;
	private _perimeter = [_this,_currentTriangle] call _getPerimeter;
	private _commonEdges = [_triangles,_currentTriangle] call _getTrianglesWithCommonEdge;
	//track wether a triangle was flipped. If it was stay at the current triangle
	private _continue = true;
	{
		if(_continue)then{
			private _otherTriangle = _x select 0;
			private _otherVertex = _x select 1;
			private _otherVertexInPerimeter = [_this,_perimeter,_otherVertex] call _isInPerimter;
			if(_otherVertexInPerimeter)then{
				[_triangles,_currentTriangle,_otherTriangle] call _flip;
				
				_continue = false;
				_runsWithoutFlip = 0;
			};
		
		};
	}forEach _commonEdges;
	if(_continue)then{
		if(_i mod 3 == 0)then{
		_drawing call _removeDrawing;
		_drawing = [_this,_triangles] call _drawTriangulation;
		};
		_i = _i + 1 mod (count _triangles);
		_runsWithoutFlip = _runsWithoutFlip +1;
		diag_log ("Delauny switching to triangle " + (str _i));
		_currentTriangleDrawing call _removeDrawing;
		_currentTriangleDrawing = [_this,[_triangles select _i],"ColorRed"] call _drawTriangulation;
	};
	
	
	
};



diag_log "Finished triangulation";