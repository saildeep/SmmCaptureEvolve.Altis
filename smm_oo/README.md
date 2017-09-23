# Object oriented framework


## Setup
Allows to declare custom types with typed variables and functions.
Each module using types needs to route to its types.hpp from the root types.hpp by including
```
#include "[module_name]\types.hpp"
```
in the root types.hpp.

## Usage
Setup your own types in the types.hpp like the following
```
class CustomType:OOType{
    isSingleton = 1;
    singletonParams = "["SampleCar", [100,200,300]]";

    class VehicleType:OOVar{
        typeName = "STRING";
        typeCheck = "isClass (configFile >> 'CfgVehicles' >> _this)";
    };

    class PriceClasses:OOVar{
        typeName= "[SCALAR]";
    };

    class RandomPrice:OOFunction{
        code = "selectRandom([_this select 0] call CustomType_get_PriceClasses)";
    };

    class AdvancedPrice:OOFunction{
        file ="MYMODULEDIR\CustomType\AdvancedPrice.sqf";
    };

};
```

### OOType
Base class for your own type.
Created functions:

Parameters | Returns | Function 
-----------| --------| -----
[var1,var2,..] | object | CustomType_create
[object] | Nothing |CustomType_check

If `isSingleton = 1` the following functions are also generated

Parameters | Returns | Function 
-----------| --------| -----
Nothing|object|CustomType_GetInstance
[object,broadcast]|Nothing|CustomType_SetInstance
Nothing|Nothing|CustomType_BroadcastInstance

If `singletonParameters != ""` the singleton is automatically initialized by calling the constructor with `singletonParameters`

### OOVar
Create classes of this type in any `OOType`.
You can define the following childs:

Name | default | meaning
-----|---------|--------
typeName||Type of the variable. Use native type from [here](https://community.bistudio.com/wiki/typeName) or each custom type. To create arrays wrap the type in `[TYPE]`.
typeCheck| "true"| Function for custom type checking. Does not override standard typechecking.

For each variable, the following Functions are generated:

Parameters | Returns | Function 
-----------| --------| -----
[object] | value | CustomType_get_Varname
[object,value] | Nothing |CustomType_set_Varname
[object] |Nothing|CustomType_check_Varname

### OOFunction
Used to create class functions.
Define your function either directly with `code="somafancycode";` or with `file="functionfilename.sqf";`
*The first parameter of your function is always the object itself*.