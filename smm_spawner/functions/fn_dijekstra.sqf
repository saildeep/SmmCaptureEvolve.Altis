/**
	Performs a dijekstra algorithm on a given set of points and a starting index
	Input:[candidates with [position,name,...],startIndex]
	Output: Array of arrays of indeces to connect to
*/ 


private _spawnLocs      = _this select 0;
private _addedNodes     = [_this select 1];
private _otherNodes     = [];
private _outConnections = [];
diag_log ("Starting spanning tree algorithm at " + (str _addedNodes));
private _allIndexes = [];
{
    _outConnections pushBack [];
    if(!(_forEachIndex in _addedNodes) )then{
        _otherNodes pushBack _forEachIndex;
    };
	_allIndexes pushBack _forEachIndex;
	
}forEach _spawnLocs;

while{(count _otherNodes)>0}do{
	diag_log ("Running dijekstra with _otherNodes size:" + (str (count _otherNodes)));
    // are always in format [nodeId,nodeId, distance]
    private _nbs = [];
    {
        private _node    = _x;
        private _nodepos = (_spawnLocs select _node) select 0;
        private _nodenbs = _otherNodes;
        {
            if((_x != _node) && (_x in _otherNodes))then{
            private _innerpos = (_spawnLocs select _x) select 0;
            _nbs pushBackUnique [_node,_x, _innerpos distance _nodepos];
            };
        }forEach _nodenbs;
    }forEach _addedNodes;
    private _sortednbs = [_nbs,[],{_x select 2},"ASCEND"] call BIS_fnc_sortBy;
    if((count _sortednbs) <1 )exitWith {false};
    private _addEntry       = _sortednbs select 0;
    private _addedNode      = _addEntry select 1;
    private _connectionNode = _addEntry select 0;
    (_outConnections select _addedNode) pushBackUnique _connectionNode;
    (_outConnections select _connectionNode) pushBackUnique _addedNode;
    _otherNodes = _otherNodes - [_addedNode];
    _addedNodes pushBack _addedNode;
};
_outConnections