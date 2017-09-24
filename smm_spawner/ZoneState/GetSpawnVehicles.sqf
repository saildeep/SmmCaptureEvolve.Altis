params["_object"];
private _budget = [_object] call ZoneState_fnc_GetMoney;
private _zoneID = [_object] call ZoneState_get_ZoneID;
private _zone = [call ZonesManager_GetInstance, _zoneID] call ZonesManager_fnc_GetZone;
private _owner = [_zone] call Zone_get_Owner;
private _pool = [];
private _out = [];
diag_log ("getting vehicles for side "+(str _owner));
if(_owner == east) then {
 	_pool = ai_vehicles select 0;
};
if(_owner == west) then {
	_pool = ai_vehicles select 1;
};
if (_owner == independent) then {
	_pool = ai_vehicles select 2;
};
diag_log("pool "+(str _pool));

for "_i" from 1 to 20 do {

	private _candidate = selectRandom _pool;
	if(_budget >= ([_candidate] call SpawnableVehicle_get_Price) )  then {
		_out pushBack _candidate;
		_budget = _budget- ([_candidate] call SpawnableVehicle_get_Price);

	};

};
_out
