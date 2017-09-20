class Zone:OOType{
    class Position:OOVar{
        typeName = "ARRAY";
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
        typeName = "ARRAY";
    };
    class DisplayName:OOVar{
        typeName = "STRING";
    };
};

#include "smm_config\types.hpp"