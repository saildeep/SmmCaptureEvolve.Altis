_returnValue = false;
if(hasInterface)then{
	if(!isNil "officer")then{
		if(player == officer)then{
			_returnValue = true;
		};
	};
};//return true for all
_returnValue;
true