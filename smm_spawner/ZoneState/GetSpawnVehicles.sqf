params["_object"];
private _budget = [_object] call ZoneState_fnc_GetMoney;
diag_log("budget "+(str _budget));
private _zoneID = [_object] call ZoneState_get_ZoneID;
private _zone = [call ZonesManager_GetInstance, _zoneID] call ZonesManager_fnc_GetZone;
private _owner = [_zone] call Zone_get_Owner;
private _pool = [];
private _out = [];
private _density = ([_object] call ZoneState_fnc_GetNormalizedBuildingDensity) max ([_object] call ZoneState_fnc_GetNormalizedTreeDensity);
_density = sqrt _density;
_budget = _budget * (2-_density) + 300;

if(_owner == east) then {
 	_pool = ai_vehicles select 0;
};
if(_owner == west) then {
	_pool = ai_vehicles select 1;
};
if (_owner == independent) then {
	_pool = ai_vehicles select 2;
};


for "_i" from 1 to 20 do {
	diag_log("budget "+(str _budget));
	private _candidate = selectRandom _pool;
	if(_budget >= ([_candidate] call SpawnableVehicle_get_Price) )  then {
		_out pushBack _candidate;
		_budget = _budget- ([_candidate] call SpawnableVehicle_get_Price);
		

	};

};
_out
