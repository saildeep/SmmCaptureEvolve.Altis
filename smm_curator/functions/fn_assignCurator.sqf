diag_log "assignCurator started";

params  ["_target", "_unit", "_ID", "_zoneID"];

// determine curator
private "_curator";
private _side = side _unit;

switch (_side) do {
	case blufor:
	{_curator = curator_blufor;};
	case opfor:
	{_curator = curator_opfor;};
	case independent:
	{_curator = curator_independent;};
	default
	{};
};

diag_log format ["assignCurator: zoneID %1, curator %2, unit %3", _zoneID,_curator, _unit];

// curator clean up
_curator removeCuratorEditableObjects [(curatorEditableObjects _curator), true];
removeAllCuratorEditingAreas _curator ;
removeAllCuratorCameraAreas _curator ;

// adjust curator to the new zone
// add camera area
private _zoneState = ([call ZoneStatesManager_GetInstance, _zoneID] call ZoneStatesManager_fnc_GetZoneState);
private _interactionPoint = ([_zoneState] call  ZoneState_get_InteractionPoint);
private _radius = ([([call ZonesManager_GetInstance, _zoneID] call ZonesManager_fnc_GetZone)] call  Zone_get_Size);
_curator addCuratorCameraArea [0, position _interactionPoint, _radius];
// register units
//private _spawnedInfantry = ([_zoneState] call ZoneState_fnc_GetSpawnInfantry);
//private _spawnedVehicles = ([_zoneState] call ZoneState_fnc_GetSpawnVehicles);
//diag_log format ["spawned units %1", (_spawnedInfantry + _spawnedVehicles)];
//_curator addCuratorEditableObjects [(_spawnedInfantry + _spawnedVehicles), true];

_unit assignCurator _curator;

[] remoteExec ["smm_fnc_onAssignCurator", _unit];

diag_log "assignCurator done";