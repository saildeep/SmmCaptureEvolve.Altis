
class EventDistributor:OOType{
    class Name:OOVar{
        typeName="STRING";
    };

    class EventListenersCall:OOVar{
        typeName="[CODE]";
    };

    class EventListenersSpawn:OOVar{
        typeName="[CODE]";
    };
    class AddEventListenerCall:OOFunction{
        code = "([_this select 0] call EventDistributor_get_EventListenersCall) pushBack (_this select 1);";
    };
    class AddEventListenerSpawn:OOFunction{
        code = "([_this select 0] call EventDistributor_get_EventListenersSpawn) pushBack (_this select 1);";
    };
    class Trigger:OOFunction{
        code = "params['_object','_params'];{ _params call _x; }forEach ([_object] call EventDistributor_get_EventListenersCall);{ _params spawn _x; }forEach ([_object] call EventDistributor_get_EventListenersSpawn);"
    };
};

class EventManager:OOType{
    class Events:OOVar{
        typeName="[EventDistributor]";
    };
    class AddListener:OOFunction{
        file="smm_oo\EventManager\AddListener.sqf";
    };
    class Trigger:OOFunction{
        file="smm_oo\EventManager\Trigger.sqf";
    };
};
