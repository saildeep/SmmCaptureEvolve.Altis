#include "constants.hpp"
params["_units","_zoneid"];

private _zm = call ZonesManager_GetInstance;
private _zone = [_zm,_zoneid] call ZonesManager_fnc_GetZone;
private _zoneRadius = [_zone] call Zone_get_Size;
private _zoneCenter = [_zone] call Zone_get_Position;


private _groups = [];
{
	_groups pushBackUnique (group _x);
	_x setVariable[KEY_ZONEID,_zoneid];
	_x setVariable[KEY_ZONECENTER,_zoneCenter];
	_x setVariable[KEY_ZONERADIUS,_zoneRadius];
	
	//_x disableAI "AUTOCOMBAT";
	_x setCombatMode "RED";
	_x setBehaviour "AWARE";

// allow fleewing still necessary?
	_x allowFleeing 0;
// set skill. 
	_x setSkill smm_skill; 
	_y=_x;
	{
		_y setSkill [_x,missionnamespace getVariable [("smm_aiSubSkill_"+_x), smm_skill]];
	}forEach ["aimingAccuracy","aimingShake","aimingSpeed","spotDistance","spotTime","reloadSpeed","commanding","general"];

	if(smm_debug_ai)then{
		[_x,(str _forEachIndex) + "_forzone_"+ (str _zoneid)] spawn smm_fnc_debugTrackUnit;
	};
}forEach _units;
{
	
	_x setVariable[KEY_ZONEID,_zoneid];
	_x setVariable[KEY_ZONECENTER,_zoneCenter];
	_x setVariable[KEY_ZONERADIUS,_zoneRadius];
	[_x,_groups,_zoneid] spawn smm_fnc_loopGroup;
}forEach _groups;