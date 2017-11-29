private _out = [];

private _zm = call ZonesManager_GetInstance;
private _zones = [_zm] call ZonesManager_get_Zones;
private _heldZones = _zones select {([_x] call Zone_get_Owner) == playerSide};
private _nestedGearIDS = _heldZones apply {[_x] call Zone_get_ItemIDs};


//give items by conquered zones
{
	private _innerGear = _x;
	{
		private _item = allItems select _x;
		private _perk = [_item] call PurchasableItem_get_Perk;
		if([player,_perk] call smm_fnc_hasPerk)then{
			_out pushBack _item;
		};

	}forEach _innerGear;

}forEach _nestedGearIDS;

//give default items

{
	private _perk = [_x] call PurchasableItem_get_Perk;
	if( ([_x] call PurchasableItem_get_Default) && ([player,_perk] call smm_fnc_hasPerk) )then{
		_out pushBack _x;
	};

}forEach allItems;

_out