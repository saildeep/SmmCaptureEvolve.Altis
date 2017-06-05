assert(typeName _this == "ARRAY");
    private _out = [];
    {
        private _newNBS = _x call smm_fnc_getNeighbours;
        {
            _out pushBackUnique _x;
        }forEach _newNBS;
    }forEach _this;
    _out