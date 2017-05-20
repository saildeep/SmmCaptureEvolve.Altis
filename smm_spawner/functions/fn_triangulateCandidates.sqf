/**
Connects the zones
	
Input: Array of candidates in format [position,name,size,importance]
Output: Array of array of connected indicies	
*/

private _connections = [];
{
	_connections pushBack [];
}forEach _this;


/*

pregenerate, which zones may be connected to which
simply use distance based method here
to get allowed neighbour distance, first get max distance between two zones
*/
private _maxDistance = 0;
{
	private _currentPos = _x select 0;
	private _currentIndex = _forEachIndex;
	{
		private _otherPos = _x select 0;
		if((_currentIndex != _forEachIndex) && ((_currentPos distance _otherPos) > _maxDistance) )then{
			_maxDistance = _currentPos distance _otherPos;
		};
	}forEach _this;
}forEach _this;

private _maxConnectionDistance = _maxDistance / 3;
//generate neighbourhood
private _neighbours = [];
{
	private _myNeighbours = [];
	private _myPos = _x select 0;
	private _myIndex = _forEachIndex;
	{
		private _otherPos = _x select 0;
		if(_forEachIndex != _myIndex &&  ((_otherPos distance _myPos) < _maxConnectionDistance))then{
			_myNeighbours pushBack _forEachIndex;
		};
	
	}forEach _this;
	_neighbours pushBack _myNeighbours;
}forEach _this;

private _iterations = 10;
for [{_i=0}, {_i < _iterations}, {_i = _i + 1}] do {
	diag_log "Starting dijekstra iteration";
	//do dijekstra for random point
	private _startIndex = floor (random (count _this));
	private _tempConnections = [_this, floor (random (count _this)),_neighbours] call smm_fnc_dijekstra;

	//merge with the existing connections
	{
		private _bigIndex = _forEachIndex;
		{
			(_connections select _bigIndex) pushBackUnique _x;
		}forEach _x;
	
	}forEach _tempConnections;
	
};

//draw connections
if(smm_debug)then{
	{
		private _outerPos = (_this select _forEachIndex)select 0;
		{
			private _innerPos = (_this select _x) select 0;
			[_outerPos,_innerPos,30,"ColorGreen"] call smm_fnc_createDebugLine;
		}forEach _x;
	}forEach _connections;

};
_connections