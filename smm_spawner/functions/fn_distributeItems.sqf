//	gets an array of elements in format [position,hash,size,owner,connections,name]
//	and distributes all items id's to id, returning an array of arrays of ids


//first get all items by perk, which should be distributed (are not default)
diag_log "Distributing items now";
private _perks = [];
private _ids = [];
private _distributeNumTimes = 2;
{
	if(! ([_x] call PurchasableItem_get_Default) )then{
		private _perk = [_x] call PurchasableItem_get_Perk;
		if(!(_perk in _perks))then{
			_perks pushBack _perk;
			_ids pushBack [];
		};

		private _perkIndex = _perks find _perk;
		(_ids select _perkIndex) pushBack _forEachIndex;
		
	};

}forEach allItems;
diag_log "Collected perks";
diag_log _perks;
diag_log "With ids";
diag_log _ids;




//distribute uniformly to targetArray
private _targetArray = _this apply {[]};
 for [{private _i=0}, {_i < _distributeNumTimes}, {_i = _i + 1}]do {
	{
		private _idList = _x;
		{
			private _targetZoneIndex = floor ( random (count _this) );
			(_targetArray select _targetZoneIndex) pushBackUnique _x;
		}forEach _idList;


		
	}forEach _ids;//distribute for each perk seperately
};
private _out = [];
{
	diag_log ("Distributed Items: " + ( str ( _targetArray select _forEachIndex)) );
	_out pushBack ( _x  + [_targetArray select _forEachIndex] );
}forEach _this;
_out