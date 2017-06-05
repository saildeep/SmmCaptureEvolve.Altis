private _no = _this;
private _vehs = zoneNoToVehicle select _no;
{
deleteVehicle _x;
}forEach _vehs;
zoneNoToVehicle set [_no,[]];