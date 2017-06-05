private _cur = ["",0];
private _maxPrice = _this;
{
	 private _classname = _x select 0;
	 private _price = _x select 1;
	 if(_price <= _maxPrice && _price > (_cur select 1))then{
	 _cur = _x;
	 };
}forEach ai_vehicles_transport;
(_cur select 0)