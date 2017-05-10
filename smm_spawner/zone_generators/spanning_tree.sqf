_spawnLocs      = _this;
_addedNodes     = [0];
_otherNodes     = [];
_outConnections = [];
diag_log "Starting spanning tree algorithm with:";
diag_log _spawnLocs;
{
    _outConnections pushBack [];
    if(!(_forEachIndex in _addedNodes) )then{
        _otherNodes pushBack _forEachIndex;
    }
}forEach _spawnLocs;

while{(count _otherNodes)>0}do{
    // are always in format [nodeId,nodeId, distance]
    _nbs = [];
    {
        _node    = _x;
        _nodepos = (_spawnLocs select _node) select 0;
        _nodenbs = (_spawnLocs select _node) select 4;
        {
            if((_x != _node) && (_x in _otherNodes))then{
            _innerpos = (_spawnLocs select _x) select 0;
            _nbs pushBackUnique [_node,_x, _innerpos distance _nodepos];
            };
        }forEach _nodenbs;
    }forEach _addedNodes;
    _sortednbs = [_nbs,[],{_x select 2},"ASCEND"] call BIS_fnc_sortBy;
    if((count _sortednbs) <1 )exitWith {false};
    _addEntry       = _sortednbs select 0;
    _addedNode      = _addEntry select 1;
    _connectionNode = _addEntry select 0;
    (_outConnections select _addedNode) pushBack _connectionNode;
    (_outConnections select _connectionNode) pushBack _addedNode;
    _otherNodes = _otherNodes - [_addedNode];
    _addedNodes pushBack _addedNode;
};

{
    _x set[4,_outConnections select _forEachIndex];
}forEach _spawnLocs;
_spawnLocs