assert (typeName _this == "ARRAY");
private _side = _this select 0;
private _targets = ([_side,spawnLocs] call smm_fnc_filterZonesFromSide);
private _targetnb = _targets call smm_fnc_getNeighboursFromMultiple;
private _possibleTargets = [];
private _foreignFactions = smm_spawner_all_factions - [_side];
{
	_possibleTargets append ([_x,_targetnb] call smm_fnc_filterZonesFromSide);
}forEach _foreignFactions;
_possibleTargets