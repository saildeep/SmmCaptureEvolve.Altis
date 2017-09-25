params["_zoneid","_zonesideid"];
diag_log ( (str _zoneid) + " seized by " + (str _zonesideid)  );
[call ZoneStatesManager_GetInstance,_zoneid,_zonesideid] call ZoneStatesManager_fnc_SeizeZone;