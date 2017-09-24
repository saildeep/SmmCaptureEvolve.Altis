params["_object","_side"];
private _sidestr = "civilian";
if(_side == west)then{
	_sidestr = "west";
};
if(_side == east)then{
	_sidestr = "east";
};
if(_side == independent)then{
	_sidestr = "guerilla";
};

('respawn_' + _sidestr + '_' +  ([_this select 0] call Zone_get_Hash) )