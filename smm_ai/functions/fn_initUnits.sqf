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


	if(smm_debug_ai)then{
		[_x,(str _forEachIndex) + "_forzone_"+ (str _zoneid)] spawn smm_fnc_debugTrackUnit;
	};
}forEach _units;

{
	
	_x setVariable[KEY_ZONEID,_zoneid];
	_x setVariable[KEY_ZONECENTER,_zoneCenter];
	_x setVariable[KEY_ZONERADIUS,_zoneRadius];
	[_x] spawn smm_fnc_loopGroup;
}forEach _groups;