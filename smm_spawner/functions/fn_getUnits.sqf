/**

Input :[money,side]
Returns an array of [unit,price,script] objects, which should be spawned for the specific amount of money


*/

private _side = _this select 1;
private _sideNo = _side call smm_fnc_macrosToConfigSide;
private _allUnits = ai_infantry select _sideNo; //TOTEST

private _money = floor((_this select 0)*2);
private _counter = 0;
private _retUnits = [];
//determine minimum unit price
private _minPrice = 1000000000;
{
	if((_x select 1)<_minPrice)then{
		_minPrice = _x select 1;
	};
}forEach _allUnits;
while {_counter < 10000} do
{
    _counter = _counter + 1;
	private _randomUnitTuple = selectRandom _allUnits;
	private _unit = _randomUnitTuple;
	private _price = _randomUnitTuple select 1;
	//calculate probability to spawn expensive units less often
	private _propability = _minPrice / _price;
	if(_money >= _price && (random 1) <= _propability)then{
		_retUnits append [_unit];
		_money = _money - _price;
	};
};
_retUnits