class ZonesManager:OOType{
    isSingleton = 1;
    class Zones:OOVar{
        typeName="[Zone]";
    };
    class GetZone:OOFunction{
        code = "([_this select 0] call ZonesManager_get_Zones) select (_this select 1)";
    };

};

class Zone:OOType{

    class ID:OOVar{
        typeName="SCALAR";
        typeCheck = "_this >= 0";
    };

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

class ZoneState:OOType{
    class ZoneID:OOVar{
        typeName = "SCALAR";
    };
    class Units:OOVar{
        typeName="[OBJECT]";
    };
    class Vehicles:OOVar{
        typeName="[OBJECT]";
    };
    class Buildings:OOVar{
        typeName="[OBJECT]";
    };
    class Marker:OOVar{
        typeName="STRING";
    };
};
