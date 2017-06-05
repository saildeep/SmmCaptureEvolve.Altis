    private _maxPrice = _this + 1;
    private _veh = "";
    private _counter = 0;
    while{(_counter < 50) && (_veh == "")}do {
        private _entry = selectRandom ai_vehicles_armed;
        if((_entry select 1)<_maxPrice )then{
            _veh = _entry select 0;
        };
        _counter = _counter + 1;
    };
    _veh