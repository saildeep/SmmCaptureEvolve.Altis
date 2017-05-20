/**
	Performs a dijekstra algorithm on a given set of points and a starting index
	Input:[candidates with [position,name,...],startIndex,neighbourlist]
	Output: Array of arrays of indeces to connect to
*/ 


private _spawnLocs      = _this select 0;
private _initNodeIndex  = _this select 1;
private _addedNodes     = [_initNodeIndex];
private _neighbours     = _this select 2;

private _distances = [];
{
	if(_forEachIndex == _initNodeIndex)then{
		_distances pushBack 0;
	}else{
		_distances pushBack 10000000000;
	};
}forEach _spawnLocs;

private _precessors = [];
{
	_precessors pushBack (-1);
}forEach _spawnLocs;

private _openList = [];
{
	_openList pushBack _forEachIndex;
}forEach _spawnLocs;

while{(count _openList) > 0}do{
	//get index with lowest distance value
	private _lowestDistanceIndex = _openList select 0;
	private _lowestDistance = 10000000000000;
	{
		private _myDistance = _distances select _x;
		if(_myDistance < _lowestDistance)then{
			_lowestDistance = _myDistance;
			_lowestDistanceIndex = _x;
		};
	}forEach _openList;
	//remove lowest distance index from open list
	_openList = _openList - [_lowestDistanceIndex];
	private _lowestDistancePosition = (_spawnLocs select _lowestDistanceIndex) select 0;
	//foreach neighbour
	{
		if(_x in _openList)then{
			private _neighbourPosition = (_spawnLocs select _x) select 0;
			private _distanceToNeighbour = _lowestDistancePosition distance _neighbourPosition;
			private _distanceToNeighbour = _distanceToNeighbour * (sqrt _distanceToNeighbour);
			private _alternativeDistance = _distanceToNeighbour + (_distances select _lowestDistanceIndex);
			if(_alternativeDistance < (_distances select _x))then{
				_distances set[_x,_alternativeDistance];
				_precessors set [_x,_lowestDistanceIndex];
			};
		};
	
	}forEach (_neighbours select _lowestDistanceIndex);
	
	
};

private _connections = [];
{
	_connections pushBack [];
}forEach _spawnLocs;

{
	private _myIndex = _forEachIndex;
	
	if((_precessors select _forEachIndex) != -1)then{
		private _precessorIndex = (_precessors select _forEachIndex);
		(_connections select _myIndex) pushBackUnique _precessorIndex;
		(_connections select _precessorIndex) pushBackUnique _myIndex;
		
	};
}forEach _spawnLocs;
_connections