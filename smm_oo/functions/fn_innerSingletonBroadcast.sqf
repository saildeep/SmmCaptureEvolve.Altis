#include "values.hpp"
params["_tn"];
publicVariable TYPE_SINGLETON_NAME(_tn);
//call local registered EH as they are not call by addPublicVariableEventHandler
if(! (isNil TYPE_SINGLETON_BROADCAST_LISTENER_COLLECTION(_tn)) )then{
	private _ehs = (OO_NAMESPACE getVariable TYPE_SINGLETON_BROADCAST_LISTENER_COLLECTION(_tn) );
	{
		call _x;
	}forEach _ehs;
};