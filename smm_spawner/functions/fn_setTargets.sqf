private _side = _this select 0;
private _data = _this select 1;
assert(typeName _side == "SIDE");
assert(typeName _data == "ARRAY");
private _playerSideIndex = smm_spawner_all_factions find (_side);
activeTargets set [_playerSideIndex,_data];