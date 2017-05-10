_spawnLocs     = _this;
_spawnCount    = count _this;
_zonesToDelete = [];
for[{_i=0},{_i < _spawnCount},{_i= _i +1}]do{
        if(_i>= (count _spawnLocs))exitWith{true};
        _curZone = _spawnLocs select _i;
        _curPos  = _curZone select 0;
        _curSize = _curZone select 2;
        _curHash = _curZone select 1;
        {
            scopeName "checkLoop";
            _innerHash = _x select 1;
             _innerPos  = _x select 0;
              _innerSize = _x select 2;
              if!(_innerPos isEqualTo _curPos)then{
               
               
                _distance  = _innerPos distance _curPos;
                _size      = _innerSize + _curSize;
                _size      = _size *1.5; // add some tolerance
                if(_distance < _size)then{
                    _zonesToDelete pushBack _i;
                    diag_log ("Removed zone no "+ (str _i));
                    breakOut "checkLoop";
                };
            };
        
        }forEach _spawnLocs;
};
_newSpawnLocs = [];
{
    if(_forEachIndex in _zonesToDelete)then{
    
    }else{
        _newSpawnLocs pushBack _x;
    };
}forEach spawnLocs;
_newSpawnLocs