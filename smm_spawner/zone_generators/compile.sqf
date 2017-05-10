getDistanceAngleZone = {
private _currentZoneNum = _this select 0;
private _spawnLocs = _this select 1;
private _currentZone = (_spawnLocs select _currentZoneNum);
private _nbs = (_currentZone select 4);
//Formate nbs to: [distance,angle,zoneID,still needs to be processed]
private _out = [];
{
    private _curNb = _spawnLocs select _x;
    private _posCurNb = _curNb select 0;
    private _dist = (_currentZone select 0) distance _posCurNb;
    private _angle = (_currentZone select 0) getDir _posCurNb;
    _out append [[_dist,_angle,_x,true]];
}forEach _nbs;
_out = [_out,[],{_x select 1},"ASCEND"] call BIS_fnc_sortBy;
_out
};

removeNeighbour = {
    private _nb1 = _this select 0;
    private _nb2 = _this select 1;
    private _spawnLocs = _this select 2;
    (_spawnLocs select _nb1) set [4,((_spawnLocs select _nb1) select 4) - [_nb2]];
    (_spawnLocs select _nb2) set [4,((_spawnLocs select _nb2) select 4) - [_nb1]];
    _spawnLocs
};
smm_spawner_is_fully_connected = compileFinal preprocessFile "smm_spawner\zone_generators\is_fully_connected.sqf";
smm_overlapping_zones_cleaner  = compileFinal preprocessFile "smm_spawner\zone_generators\overlapping_zones_cleaner.sqf";
