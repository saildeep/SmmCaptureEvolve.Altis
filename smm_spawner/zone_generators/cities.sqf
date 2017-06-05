
_out = [];//todo change to smm_spawner_types
_spawnLocs = nearestLocations [smm_spawner_center, smm_spawner_types, smm_spawner_range];
_numLocs = count _spawnLocs;
//generate cities
{
	_pos = getPos(_x);
	_hash = (_pos call smm_fnc_hash);
	_numHouses =count( nearestObjects [_pos, ["House","Building"], smm_spawner_zone_scan_size]) + 1;
	_size = smm_spawner_max_zone_size min (_numHouses * smm_spawner_house_influence);
	if(_size < smm_spawner_min_zone_size)then{
		_size =floor( random [smm_spawner_min_zone_size,(smm_spawner_max_zone_size + smm_spawner_min_zone_size) / 2,smm_spawner_max_zone_size]);
	};
	_owner = smm_spawner_default_owner;
	_c =  [_pos,_hash,_size,_owner];
	_out append [_c];
}forEach _spawnLocs;
_out
