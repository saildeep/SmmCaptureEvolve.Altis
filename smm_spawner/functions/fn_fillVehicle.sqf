private _side = _this select 0;
private _units = [];
private _unit = [];
private _veh = _this select 1;
private _group = _this select 2;
if((_veh emptyPositions "Driver")>0)then{
	_unit = [_side,_group] call smm_fnc_getRandomUnit;
	_unit moveInDriver _veh;
	_unit assignAsDriver _veh;
	_units pushBack _unit;
};
if((_veh emptyPositions "Gunner")>0)then{
	_unit = [_side,_group] call smm_fnc_getRandomUnit;
	_unit moveInGunner _veh;
	_unit assignAsGunner _veh;
	_units pushBack _unit;
};
if((_veh emptyPositions "Commander")>0)then{
	_unit = [_side,_group] call smm_fnc_getRandomUnit;
	_unit moveInCommander _veh;
	_unit assignAsCommander _veh;
	_units pushBack _unit;
};
_units