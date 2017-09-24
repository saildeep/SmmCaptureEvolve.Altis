#define OO_CONFIGFILE missionConfigFile
#define OO_NAMESPACE missionNamespace

class OOVar{
    
    typeName = "ARRAY";
    get="_this";
    set="_this";
    typeCheck = "true";//use _v
};

class OOFunction{
    code = "";
    file= "";
};

class OOType{
    isSingleton = 0;
    singletonParams = "";
    class OnInit:OOFunction{};
};

