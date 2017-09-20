class Zone:OOType{
    class Position:OOVar{
        typeName = "[SCALAR]";
        typeCheck = "(count _this) == 3";
    };
    class Hash:OOVar{
        typeName="STRING";
        typeCheck = "(count _this) > 0";
    };
    class Size:OOVar{
        typeName="SCALAR";
        typeCheck = "_this > 0";
    };
    class Owner:OOVar{
        typeName = "SIDE";
    };
    class Neighbours:OOVar{
        typeName = "[SCALAR]";
    };
    class DisplayName:OOVar{
        typeName = "STRING";
    };
};
