_out = _this;
//TODO change type
_spawnLocs = nearestLocations [smm_spawner_center, smm_spawner_types, smm_spawner_range];
{
	_c =_x;
	_pos = _c select 0;
	_index = _forEachIndex;
	_neighbours = [];
	{
		_nb = _x;
		//TODO remove error
		_nbpos = _x select 0;
		_dist = _nbpos distance _pos;
		if((_forEachIndex != _index) && (_dist< smm_spawner_neighbour_range))then{
			_neighbours append [_forEachIndex];
		};
	}forEach _out;
	_c append [_neighbours];
	_zoneName = text ((nearestLocations [_pos,smm_spawner_types,5000]) select 0); 
	_c append [_zoneName];
}forEach _out;
diag_log ("Created connections with result:" + (str _out));
_out