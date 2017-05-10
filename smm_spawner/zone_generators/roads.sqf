_numZones = _this select 0;
assert (typeName _numZones == "SCALAR");
_size        = getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize");
_sizeHalf    = _size/2;
_keySelected = "WalkedByZoneGenerator";
diag_log "Starting road zone generator";
 _counter   = 0;
 _allHashes = [];
 _markers   = [];
 for [{_angle = 0},{_angle<360},{_angle = _angle +45}]do{
   // _startPos     = [(_sizeHalf * sin _angle) + _sizeHalf,(_sizeHalf * cos _angle) + _sizeHalf,0];
    _startPos     = [random _size,random _size,0];
    _startRoad    = [_startPos,1000000,[]] call BIS_fnc_nearestRoad;
    _currentRoads = [_startRoad];
    _hasChanged   = true;
     for [{_i=1},{_hasChanged},{_i=_i+1}] do {
        _nextRoads = [];
      
        _hasChanged = false;
        {
            _connectedRoads = roadsConnectedTo _x;
            {
               private _hash = _keySelected + (toString (getPos _x));
               _allHashes pushBack _hash;
               if(!(missionNamespace getVariable [_hash,false]))then{
                   missionNamespace setVariable[_hash,true];
                    _nextRoads pushBackUnique _x;
                    _markerName = str( _counter);
                    if((_counter % 5) == 1)then{
                    createMarker[_markerName,getPos _x];
                    _markerName setMarkerShape "ICON";
                    _markerName setMarkerType "mil_dot";
                     //diag_log "Adding road:";
                     //diag_log  _counter;
                     //diag_log "at";
                     //diag_log (getPos _x);
                     _markers pushBack _markerName;
                 };
                    _counter    = _counter +1; 
                    _hasChanged = true;
                    
                };
            }forEach _connectedRoads;
        }forEach _currentRoads;
        _currentRoads = _nextRoads;
    };
};
//TODO adjust numer
_zoneMarkers = [];
_mod         = floor((count _markers) / _numZones);
{
    if((_forEachIndex % _mod) == 1)then{
        _zoneMarkers pushBack _x;
        _x setMarkerType "mil_triangle";
        _x setMarkerColor "ColorGreen";
    };
}forEach _markers;
_zoneSizeVariety = smm_spawner_max_zone_size  - smm_spawner_min_zone_size;
_out             = [];
{
    _num   = _forEachIndex;
    _pos   = getMarkerPos _x;
    _hash  = _pos call smm_hash;
    _size  = (random [0,0.25,1]) * _zoneSizeVariety + smm_spawner_min_zone_size;
    _owner = smm_spawner_default_owner;
    _c     = [_pos,_hash,_size,_owner];
    _out pushBack _c;
}forEach _zoneMarkers;
{
    deleteMarker _x;
}forEach _markers;
{
    missionNamespace setVariable [_x,false,false];
}forEach _allHashes;
diag_log ("Finished roadGen with " + (str _out));
if(true)exitWith{_out};
_out