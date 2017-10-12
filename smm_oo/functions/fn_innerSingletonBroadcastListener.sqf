#include "values.hpp"
params["_tn", "_code"];
assert((typeName _code) == "CODE");
if(isNil TYPE_SINGLETON_BROADCAST_LISTENER_COLLECTION(_tn))then{
	OO_NAMESPACE setVariable [TYPE_SINGLETON_BROADCAST_LISTENER_COLLECTION(_tn),[_code],false];
}else{
	(OO_NAMESPACE getVariable TYPE_SINGLETON_BROADCAST_LISTENER_COLLECTION(_tn))pushBack _code;
};

TYPE_SINGLETON_NAME(_tn) addPublicVariableEventHandler _code;