
class EventDistributor:OOType{
    class Name:OOVar{
        typeName="STRING";
    };

    class EventListeners:OOVar{
        typeName="[EventListener]";
    };
    class AddEventListener:OOFunction{
        code = "([_this select 0] call EventDistributor_get_EventListeners) pushBack (_this select 1);";
    };
};

class EventListener:OOType{};


#include "smm_config\types.hpp"
#include "smm_spawner\types.hpp"