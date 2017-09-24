class PurchasableVehicle:OOType{
    class ClassName: OOVar{
        typeName="STRING";
        typeCheck = "isClass (configFile >> 'CfgVehicles' >> _this)";
    };
    class Price: OOVar{
        typeName="SCALAR";
        typeCheck = "_this > 0";
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