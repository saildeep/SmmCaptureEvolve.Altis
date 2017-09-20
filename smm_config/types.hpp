class PurchasableVehicle:OOType{
    class ClassName: OOVar{
        typeName="STRING";
        typeCheck = "isClass (configFile >> 'CfgVehicles' >> _this)";
    };
    class Price: OOVar{
        typeName="SCALAR";
        typeCheck = "_this > 0";
    };
};