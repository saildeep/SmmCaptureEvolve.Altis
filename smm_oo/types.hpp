
class EventDistributor:OOType{
    class Name:OOVar{
        typeName="STRING";
    };

    class EventListenersCall:OOVar{
        typeName="[EventListener]";
    };

    class EventListenersSpawn:OOVar{
        typeName="[EventListener]";
    };
    class AddEventListenerCall:OOFunction{
        code = "([_this select 0] call EventDistributor_get_EventListenersCall) pushBack (_this select 1);";
    };
    class AddEventListenerSpawn:OOFunction{
        code = "([_this select 0] call EventDistributor_get_EventListenersSpawn) pushBack (_this select 1);";
    };
};

class EventManager:OOType{
    class Events:OOVar{
        typeName="[EventDistributor]";
    };
    class AddListener:OOFunction{
        file="smm_oo\EventManager\AddListener.sqf";
    };
};

class EventListener:OOType{
    class Function:OOVar{
        typeName="CODE";
    };
};
