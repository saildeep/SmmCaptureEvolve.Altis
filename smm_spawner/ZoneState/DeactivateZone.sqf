params["_object"];
private _units = [_object] call ZoneState_get_Units;
{
	deleteVehicle _x;
} forEach _units;
[_object,[]] call ZoneState_set_Units;
private _vehicles = [_object] call ZoneState_get_Vehicles;
{
	deleteVehicle _x;
}forEach _vehicles;
[_object,[]] call ZoneState_set_Vehicles;