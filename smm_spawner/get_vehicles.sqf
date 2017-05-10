_side = _this select 1;
_sideNo = _side call macros_to_config_side;
_allVehicles = ai_vehicles select _sideNo; //TOTEST
_money = floor((_this select 0)*2);
_counter = 0;
_retVehicles = [];
while {_counter < 1000} do
{
    _counter = _counter + 1;
	_randomVehicleTuple = selectRandom _allVehicles;
	_unit = _randomVehicleTuple select 0;
	_price = _randomVehicleTuple select 1;
	if(_money >= _price)then{
		_retVehicles pushBack _unit;
		_money = _money - _price;
	};
};
_retVehicles