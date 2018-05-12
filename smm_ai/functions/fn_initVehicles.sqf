#include "constants.hpp"
params["_vehicle","_VehicleCrew","_zoneid"];

private _zm = call ZonesManager_GetInstance;
private _zone = [_zm,_zoneid] call ZonesManager_fnc_GetZone;
private _zoneRadius = [_zone] call Zone_get_Size;
private _zoneCenter = [_zone] call Zone_get_Position;

{
	_x setVariable[KEY_ZONEID,_zoneid];
	_x setVariable[KEY_ZONECENTER,_zoneCenter];
	_x setVariable[KEY_ZONERADIUS,_zoneRadius];

// allow fleewing still necessary?
	_x allowFleeing 0;
// set skill.
/* crew is default skilled
	_x setSkill smm_skill; 
	_y=_x;
	{
		_y setSkill [_x,missionnamespace getVariable [("smm_aiSubSkill_"+_x), smm_skill]];
	}forEach ["aimingAccuracy","aimingShake","aimingSpeed","spotDistance","spotTime","reloadSpeed","commanding","general"];
*/
}forEach _VehicleCrew;

{	
	_x setVariable[KEY_ZONEID,_zoneid];
	_x setVariable[KEY_ZONECENTER,_zoneCenter];
	_x setVariable[KEY_ZONERADIUS,_zoneRadius];
	[_x,_vehicle,_VehicleCrew,_zoneid] spawn smm_fnc_loopVehicle;
	[_x,_vehicle,_VehicleCrew,_zoneid] spawn smm_fnc_revealRoutineVehicle;
}forEach _vehicle;