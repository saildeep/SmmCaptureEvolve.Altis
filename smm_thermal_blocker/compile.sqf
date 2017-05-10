smm_is_thermal = {
    private _currentEntry = _this; //provide config entry not className
    if((typeName _currentEntry)=="STRING")then{
        _currentEntry = configFile >> "CfgWeapons" >> _currentEntry;
    };
    
    private _hasMode = isArray (_currentEntry >> "visionMode");
    _out = false;
    if(_hasMode)then{
        private _array = getArray (_currentEntry >> "visionMode");
        _out = "Ti" in _array;
    }else{
        private _childs = "true" configClasses _currentEntry;
        {
            _out = _out || (_x call smm_is_thermal);
        }forEach _childs;
    };
    _out
};

smm_is_not_thermal = {
    !(_this call smm_is_thermal)
};