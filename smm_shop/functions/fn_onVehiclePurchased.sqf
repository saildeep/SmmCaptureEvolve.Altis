params ["_vehicleObject","_price","_classname"];
_handle = [_vehicleObject,playerSide call smm_fnc_getSideName,_price,_classname,getPlayerUID player] remoteExec ['smm_fnc_onVehiclePurchasedServer',2,false];

diag_log ("On " + _classname + " purchased on client for " + (str _price) + "$ is now " + (str _vehicleObject) + " and remote Handle " + (str _handle));
assert (!isNil "_handle");
_vehicleObject setVehicleReportOwnPosition true;
_vehicleObject setVehicleReportRemoteTargets true;
_vehicleObject setVehicleReceiveRemoteTargets true;

//equip fries/fastropting
if(smm_ace)then{
	private _config = configFile >> "CfgVehicles" >> typeof _vehicleObject;
	if(isNumber (_config >> "ace_fastroping_enabled"))then{
		[_vehicleObject] call ace_fastroping_fnc_equipFRIES;
	};
};