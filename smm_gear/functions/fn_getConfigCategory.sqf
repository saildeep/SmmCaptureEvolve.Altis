_return = configFile;
_type = _this select 1;
_itm = _this select 0;
if(_type == sav_weapons)then{
    _return  = configFile >> "CfgWeapons";
};

if(_type == sav_magazines)then{
    _return  = configFile >> "CfgMagazines";
};

if(_type == sav_items)then{
    _return  = configFile >> "CfgWeapons";
};

if(_type == sav_backpacks)then{
    _return  = configFile >> "CfgVehicles";
};
if(_type == sav_vehicles)then{
    _return = configFile >> "CfgVehicles";
};
_return