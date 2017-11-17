#include "constants.hpp"
params["_unit","_perks"];
if((local _unit) )then{
	private _currentPerks = _unit getVariable [KEY_PERKS,[]];
	{
		assert(_x in ALLOWED_PERKS);
		_currentPerks pushBackUnique _x;
	}forEach _perks;
	_unit setVariable [KEY_PERKS,_currentPerks,true];
};