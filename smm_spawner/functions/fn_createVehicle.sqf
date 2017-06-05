private _vehType = _this select 0;
private _pos = _this select 1;
private _range = 100;
private _numPlaces = 0;
private _spawnPos = [];
private _isAir = _vehType call smm_fnc_isAir;
private _randomPos = [_pos,_range] call getPosNear;
private _dir = 0;
if(_isAir) then{
	_spawnPos = [_randomPos select 0,(_randomPos select 1) + 500,_randomPos select 2];
}else{
//  _spawnPos = [(sizeOf _vehType) min 10,_randomPos,0,100,1,0.5,0,false] call getVehiclePos;

};

//fallback 1
if((count _spawnPos) == 0)then{
	_spawnPos = _randomPos findEmptyPosition [0,_range,_vehType];
};

//fallback 2
if((count _spawnPos)== 0)then{
	_spawnPos = [_pos,_range] call getPosNear;
};

private _veh = if(_isAir)then{
	createVehicle [_vehType,_spawnPos,[],0,"FLY"];
}else{
	createVehicle [_vehType,_spawnPos,[],0,"NONE"];
};
_veh setDir _dir;
_veh spawn spawnSafe;
_veh