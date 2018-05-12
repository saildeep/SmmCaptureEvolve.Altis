#include "constants.hpp"
params["_vehicle","_allZoneGroups","_VehicleCrew","_zoneid"];

private _crew = _VehicleCrew;
private _run = true;

while{_run}do{

if({alive _x} count _crew == 0)exitWith{_run = false};

private _allZoneUnits = [[call ZoneStatesManager_GetInstance,_zoneid] call ZoneStatesManager_fnc_GetZoneState] call ZoneState_get_Units;
{
	private _vehicleunit = _x;
	{
		private _entity = _x;		
		private _unitKnowsAboutLevel = (_vehicleunit knowsAbout (_entity select 4));	
		if( (_entity select 3)>0 && _unitKnowsAboutLevel >0.5)then{
			{
				_x reveal [(_entity select 4), _unitKnowsAboutLevel];
			}forEach (_allZoneUnits);
		};
	} forEach (_vehicleunit nearTargets 500);
} forEach (_crew);

sleep 60; 

}