
#include "defines.hpp"

private _fncName = "isValidLoadout"; LOGFNCCALL

private _unsortedInv = _this select 0;
private _valid = true;
private _validItems = [] call smm_fnc_virtualshop_getPurchasableItems;
private _currentInvalidItems = [];
{	
	private _y = toLower _x;
	private _in = false;
	{
		_x = toLower _x;
		// is validItem name in invItem name
		// necessary because tfar iterates on their item names in inventory
		private _temp = toString((toArray _x)arrayIntersect(toArray _x)) isEqualTo toString((toArray _x)arrayIntersect(toArray _y));
		//private _temp = _y == _x;
		_in = _in || _temp;
	} forEach _validItems;
	
	if (!_in) then {
		_valid = false;
		if !(_x in _currentInvalidItems) then {
			_currentInvalidItems append [_x];
		};
	};
} forEach _unsortedInv;

_currentInvalidItems
