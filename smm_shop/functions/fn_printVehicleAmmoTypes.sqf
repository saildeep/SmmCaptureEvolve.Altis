private _veh = vehicle player;
private _magObjs = magazinesAllTurrets _veh;
private _outStr = "";
private _types = [];
{
	private _magClassname = _x select 0;
	private _displayName = getText(configFile >> "CfgMagazines" >> _magClassname >> "displayName");
	_types pushBackUnique _displayName;
	_outStr = _outStr + ", " + _displayName;
} forEach _magObjs;
{
	if(_forEachIndex > 0)then{
		_outStr = _outStr + ",";
	};
	_outStr = _outStr + _x;
}forEach _types;

hint (format [str_ammo_types_list,_outStr]);