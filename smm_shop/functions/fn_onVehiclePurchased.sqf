params ["_vehicleObject","_price","_classname"];
_handle = [_vehicleObject,playerSide call smm_get_side_name,_price,_classname] remoteExec ['smm_fnc_onVehiclePurchasedServer',2,false];

diag_log ("On " + _classname + " purchased on client for " + (str _price) + "$ is now " + (str _vehicleObject) + " and remote Handle " + (str _handle));
assert (!isNil "_handle");
_vehicleObject setVehicleReportOwnPosition true;
_vehicleObject setVehicleReportRemoteTargets true;
_vehicleObject setVehicleReceiveRemoteTargets true;
