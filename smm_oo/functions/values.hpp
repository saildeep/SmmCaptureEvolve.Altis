#define OO_NAMESPACE missionNamespace
#define TYPE_CONSTRUCTOR_NAME(TYPE) TYPE +"_create"
#define TYPE_CHECK_NAME(TYPE) TYPE + "_check"
#define TYPE_VAR_GETTER_NAME(TYPE,VARNAME) TYPE+"_get_"+VARNAME
#define TYPE_VAR_SETTER_NAME(TYPE,VARNAME) TYPE+"_set_"+VARNAME
#define TYPE_VAR_CHECK_NAME(TYPE,VARNAME) TYPE+"_check_"+VARNAME
#define TYPE_FUNCTION_NAME(TYPE,FUNCTION) TYPE+"_fnc_"+FUNCTION