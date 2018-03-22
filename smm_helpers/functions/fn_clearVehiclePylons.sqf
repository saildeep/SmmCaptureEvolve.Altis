/**
	Author: Jonas Körner

	Removes all pylon weapons from a vehicle
*/
params["_vehicle",["_onlyace",false]];
private _doRemove = true;
if(_onlyace && {!smm_ace})then{
	_doRemove = false;
};
private _success = false;
if(_doRemove)then{
	diag_log (format ["Removing pylons from %1",_vehicle]);
	private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
	if(isClass _config)then{
		private _pylonComponent = _config >> "Components" >> "TransportPylonsComponent" >> "Pylons";
		if(isClass _pylonComponent)then{

			{
				_vehicle setPylonLoadOut [configName _x, ""];
				_success = true;
			} forEach ("true" configClasses (_pylonComponent ));//get all pylons
		};
	};

};
_success


