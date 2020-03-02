#include "constants.hpp"
params["_unit",["_perk","INVALID PERK"]];
if(_perk in ALLOWED_PERKS)then{
	(_perk in (_unit getVariable [KEY_PERKS,[]]))
}else{
	diag_log (format ["ERROR:Tried to check invalid perk %1 on %2",_perk,_unit]);
	false
}