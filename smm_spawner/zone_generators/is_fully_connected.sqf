_spawnLocs = _this select 0;
_currentNodeNum = _this select 1;
_reset = (count _this) < 3;
_currentNode = _spawnLocs select _currentNodeNum;
diag_log "Starting fully connected check for:";
diag_log _spawnLocs;
if(_reset)then{
tsnum = 0; //tiefensuchnummer
};

if(_reset)then{
    tsarray = [];
    {
    tsarray append [-1];
    }forEach _spawnLocs;
};
//do depth-first-search
if((tsarray select _currentNodeNum)==-1)then{
    tsarray set [_currentNodeNum,tsnum];
    tsnum = tsnum + 1;
    _nbs = _currentNode select 4;
    {
    [_spawnLocs,_x,true] call smm_spawner_is_fully_connected;
    
    }forEach _nbs;
};

_ret = true;
{
    _ret = _ret && (_x > -1); 
}forEach tsarray;

_ret