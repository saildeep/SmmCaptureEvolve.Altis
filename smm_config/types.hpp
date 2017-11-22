class PurchasableVehicle:OOType{
    class ClassName: OOVar{
        typeName="STRING";
        typeCheck = "isClass (configFile >> 'CfgVehicles' >> _this)";
    };
    class Price: OOVar{
        typeName="SCALAR";
        typeCheck = "_this > 0";
    };
    class PostSpawnFunction: OOVar{
        typeName = "CODE";
    };
    class Perk:OOVar{
        typeName="STRING";
        typeCheck = "_this in (call smm_fnc_allowedPerks)";
    };
	class GetIcon: OOFunction{
		code = "getText(configFile >> 'CfgVehicles' >> ([_this select 0] call PurchasableVehicle_get_ClassName) >> 'picture')";
		//code = "([_this select 0] call PurchasableVehicle_get_ClassName) ";
		
		
	};
	class GetName: OOFunction{
		code = "getText(configFile >> 'CfgVehicles' >> ([_this select 0] call PurchasableVehicle_get_ClassName) >> 'displayName')";
		
    };

    
};
class SpawnableInfantry: OOType{
    class ClassName:OOVar{
        typeName= "STRING";
        typeCheck = "isClass (configFile >> 'CfgVehicles' >> _this)";
    };

    class Price: OOVar{
        typeName="SCALAR";
        typeCheck = "_this > 0";
    };
    class PostSpawnFunction: OOVar{
        typeName = "CODE";
    };
};

class SpawnableVehicle:OOType{
    class ClassName:OOVar{
        typeName= "STRING";
        typeCheck = "isClass (configFile >> 'CfgVehicles' >> _this)";
        
    };
    class Price: OOVar{
        typeName="SCALAR";
        typeCheck = "_this > 0";
    };
    class PostSpawnFunction: OOVar{
        typeName = "CODE";
    };

};


class PurchasableItem:OOType{
    class ConfigFile:OOVar{
        typeName="STRING";
        typeCheck="_this in ['CfgItems','CfgMagazines','CfgWeapons','CfgVehicles']";
    };

    class ClassName:OOVar{
        typeName="STRING";
        typeCheck = "isClass (configFile >> 'CfgItems' >> _this) ||isClass (configFile >> 'CfgMagazines' >> _this) || isClass (configFile >> 'CfgVehicles' >> _this) || isClass (configFile >> 'CfgWeapons' >> _this)";
    };

    class Perk:OOVar{
        typeName="STRING";
        typeCheck = "_this in (call smm_fnc_allowedPerks)";
    };

    class Price:OOVar{
        typeName="SCALAR";
        typeCheck="_this >= 0 ";
    };

    class Default:OOVar{
        typeName="BOOL";
    };

    class ConfigText:OOFunction{
        file = "smm_config\PurchasableItem\ConfigText.sqf";
    };
};