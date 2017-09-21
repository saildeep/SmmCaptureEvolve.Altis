
//SERVER OWNER
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

//HC OWNER
class ZoneStatesManager:OOType{
    isSingleton = 1;
    class ZoneStates:OOVar{
        typeName = "[ZoneState]";
    };
    class GetZoneState:OOFunction{
        code = "([_this select 0] call ZoneStatesManager_get_ZoneStates) select (_this select 1)";
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
    class InteractionPoint:OOVar{
        typeName="OBJECT";
    };
    class SeizeTriggers:OOVar{
        typeName="TriggerCollection";
    };

};

class TriggerCollection:OOType{
    class TriggerBLUFOR:OOVar{
        typeName = "OBJECT";
    };
    class TriggerOPFOR:OOVar{
        typeName = "OBJECT";
    };
    class TriggerINDEPENDENT:OOVar{
        typeName = "OBJECT";
    };
   
};