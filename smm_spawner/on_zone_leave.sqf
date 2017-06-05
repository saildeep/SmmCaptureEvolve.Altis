_no = _this;
if(zoneActive select _no) then {
    zoneActive set [_no,false];
    _zone = _no call getZone;
    _marker = _zone call smm_fnc_getHash;
    // _marker setMarkerBrush "Solid";
    diag_log ("Leaving Zone " + str(_zone));
    _units = zoneNoToUnits select _no;
    {
        deleteVehicle _x;
    }forEach _units;
    zoneNoToUnits set [_no,[]];
    
    
    _no call smm_fnc_removeVehicle;
};