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

class EventDistributor:OOType{
    class EventListeners:OOVar{
        typeName="[EventListener]";
    };
    class AddEventListener:OOFunction{
        code = "([_this select 0] call EventDistributor_get_EventListeners) append (_this select 1);";
    };
};

class EventListener:OOType{};

class RandomDataset:OOType{
    class Data:OOVar{
        typeName = "[SCALAR]";
    };
    class Add:OOFunction{
        code = "([_this select 0] call RandomDataset_get_Data) pushBack (random 1);";
    };
};

#include "smm_config\types.hpp"