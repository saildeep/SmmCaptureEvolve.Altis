private ["_side","_zoneNo","_zone","_out","_otherZone","_distNow","_newDist","_bestDist"];
_zoneNo = _this select 0;
_side = _this select 1;
_zone = _zoneNo call getZone;
_out = -1;
_bestDist = 22222222; 
{
	_otherZone = _x call getZone;
	if((_otherZone select 3) == _side) then{
	_newDist = (_zone select 0) distance (_otherZone select 0);
		if(_newDist < _bestDist)then{
			_out = _x;
			_bestDist = _newDist;
		};
	};
}forEach (_zone select 4);
_out
