private _sideNum = _this;
private _side = west;
if(_sideNum == 0)then{
	_side = east;
};
if(_sideNum == 1)then{
	_side = west;
};
if(_sideNum == 2)then{
	_side = independent;
};
if(_sideNum == 3)then{
	_side = civilian;
};
_side