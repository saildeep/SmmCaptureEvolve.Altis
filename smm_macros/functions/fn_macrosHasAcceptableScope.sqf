private _weapon = _this;
if((typeName _this)=="STRING")then{
	_weapon = configClasses >> "CfgWeapons" >> _this;
};
private _linkedItems = _weapon >> "LinkedItems" ;
_out = true;
if(isClass _linkedItems)then{
	private _subclasses = "true" configClasses _linkedItems;
	{
		_out = _out && ((getText (_x>>"item")) call smm_is_not_thermal);
	}forEach _subclasses;
	
};
_out