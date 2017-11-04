diag_log "curator init started";
if (isServer) then {
	diag_log "curator init server";
	{

		private _curator = _x;
		_curator addCuratorEditingArea [0, [0, 0,0] , 0]; //hack to disable editing of units
		_curator setCuratorCameraAreaCeiling smm_curator_cameraCeiling;
		[_curator, "object", ["UnitPos"]] call BIS_fnc_setCuratorAttributes;
		_curator addCuratorPoints -1;
		_curator setCuratorWaypointCost 0;
		_curator setCuratorCoef ["Place", -1];
		_curator setCuratorCoef ["Edit", -1];
		_curator setCuratorCoef ["Delete", -1];
		_curator setCuratorCoef ["Destroy", -1];
		_curator setCuratorCoef ["Group", 0];
		_curator setCuratorCoef ["Synchronize", -1];
		
	} forEach allCurators;
};

if (hasInterface) then {
	{
		private _zoneID = [_x] call ZoneState_get_ZoneID;
		private _object = [_x] call ZoneState_get_InteractionPoint;
		_object addAction ["Take command", {_this remoteExec ["smm_fnc_assignCurator", 2]}, _zoneID];
		
	} forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};
diag_log "curator init done";