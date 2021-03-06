
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


class Position:OOType{
    class X:OOVar{
        typeName="SCALAR";
    };
    class Y:OOVar{
        typeName="SCALAR";
    };
    class ToArray:OOFunction{
        code="[[_this select 0] call Position_get_X,[_this select 0] call Position_get_Y]";
    };
};

class Position3D:OOType{
    class X:OOVar{
        typeName="SCALAR";
    };
    class Y:OOVar{
        typeName="SCALAR";
    };
    class Z:OOVar{
        typeName="SCALAR";
    };
    class ToArray:OOFunction{
        code="[[_this select 0] call Position3D_get_X,[_this select 0] call Position3D_get_Y,[_this select 0] call Position3D_get_Z]";
    };
}

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
    class ItemIDs:OOVar{
        typeName = "[SCALAR]";
    };
    class LandingSpots:OOVar{
        typeName = "[Position]";
    };
    class CarrierSpots:OOVar{
        typeName = "[Position3D]";
    };

    class GetMarkerName:OOFunction{
        code = "'ZoneMarker_' + ([_this select 0] call Zone_get_Hash)";
    };

    class GetRespawnMarkerName:OOFunction{
        file="smm_spawner\Zone\GetRespawnMarkerName.sqf";
    };

    class OnInit:OOFunction{
        file = "smm_spawner\Zone\OnInit.sqf";
    };

    class UpdateMarkers:OOFunction{
        file = "smm_spawner\Zone\UpdateMarkers.sqf";
    };

    class GetZoneReward:OOFunction{
        file = "smm_spawner\Zone\GetZoneReward.sqf";
    };
};

//HC OWNER
//Singleton on hc for collecting data about the current state of the zones including spawned units
class ZoneStatesManager:OOType{
    isSingleton = 1;
    class ZoneStates:OOVar{
        typeName = "[ZoneState]";
    };

    class Targets:OOVar{
        typeName = "TargetCollection";
    };

    class GetZoneState:OOFunction{
        code = "([_this select 0] call ZoneStatesManager_get_ZoneStates) select (_this select 1)";
    };

    class UpdateTargets:OOFunction{
        file = "smm_spawner\ZoneStatesManager\UpdateTargets.sqf";
    };

    class SeizeZone:OOFunction{
        file = "smm_spawner\ZoneStatesManager\SeizeZone.sqf";
    };
};

class TargetCollection:OOType{
    class TargetsBLUFOR:OOVar{
        typeName = "[SCALAR]";
    };
    class TargetsOPFOR:OOVar{
        typeName = "[SCALAR]";
    };
    class TargetsINDEPENDENT:OOVar{
        typeName = "[SCALAR]";
    };

    class GetAllTargets:OOFunction{
        code = "params['_object'];[[_object] call TargetCollection_get_TargetsBLUFOR,[_object] call TargetCollection_get_TargetsOPFOR,[_object] call TargetCollection_get_TargetsINDEPENDENT ]";
    };

    class GetAllTargetsFlat:OOFunction{
        code = "params['_object'];([_object] call TargetCollection_get_TargetsBLUFOR)+([_object] call TargetCollection_get_TargetsOPFOR)+([_object] call TargetCollection_get_TargetsINDEPENDENT)";
    };

    class GetTargetsForSide:OOFunction{
        file = "smm_spawner\TargetCollection\GetTargetsForSide.sqf";
    };

    class GetSides:OOFunction{
        code = "[west,east,independent]";
    }


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
    class InteractionPoints:OOVar{
        typeName="[OBJECT]";
    };
    class SeizeTriggers:OOVar{
        typeName="TriggerCollection";
    };
    class LastReinforcement:OOVar{
        typeName = "SCALAR";
    };
    class Objectives:OOVar{
        typeName = "[OBJECT]";
    };
   
    class ActivateZone:OOFunction{
        file = "smm_spawner\ZoneState\ActivateZone.sqf";
    };
    class DeactivateZone:OOFunction{
        file = "smm_spawner\ZoneState\DeactivateZone.sqf";
    };

    class GetSpawnInfantry:OOFunction{
        file = "smm_spawner\ZoneState\GetSpawnInfantry.sqf";
    };

    class GetSpawnVehicles:OOFunction{
        file = "smm_spawner\ZoneState\GetSpawnVehicles.sqf";
    };
    class GetMoney:OOFunction{
        file = "smm_spawner\ZoneState\GetMoney.sqf";
    };
    class GetNormalizedBuildingDensity:OOFunction{    
        file = "smm_spawner\ZoneState\GetNormalizedBuildingDensity.sqf";
    };
    class GetNormalizedTreeDensity:OOFunction{    
        file = "smm_spawner\ZoneState\GetNormalizedTreeDensity.sqf";
    };
    class ReinforceZone:OOFunction{
        file = "smm_spawner\ZoneState\ReinforceZone.sqf";
    };
    class GetReinforceCooldown:OOFunction{
        file = "smm_spawner\ZoneState\GetReinforceCooldown.sqf";
    };
    class InitUnit:OOFunction{
        file = "smm_spawner\ZoneState\InitUnit.sqf";
    };
    class InitVehicle:OOFunction{
        file = "smm_spawner\ZoneState\InitVehicle.sqf";
    };
    class ObjectiveStrength:OOFunction{
        file = "smm_spawner\ZoneState\ObjectiveStrength.sqf";
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