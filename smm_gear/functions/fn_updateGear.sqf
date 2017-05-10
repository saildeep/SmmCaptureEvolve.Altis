smm_gear_string = "bis_addvirtualweaponcargo_cargo";

	private _uid = getPlayerUID player;
	private _gear = missionNamespace getVariable [_uid call smm_fnc_getGearString,call smm_fnc_getStartGear];
	private _items = _gear select 0;
	private _weapons = _gear select 1;
	private _mags = _gear select 2;
	private _bps = _gear select 3;
	private _vehicles = _gear select 4;
	private _finalGear = [
	[_items, smm_is_not_thermal] call filter,
	_weapons,
	_mags,
	_bps,
	_vehicles
	];
	missionNamespace setVariable [smm_gear_string,_finalGear,false];
