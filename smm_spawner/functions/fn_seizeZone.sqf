params["_zoneid","_zonesideid"];
diag_log ( (str _zoneid) + " seized by " + (str _zonesideid)  );
private _singleton = call ZoneStatesManager_GetInstance;
diag_log ("Zones state manager is " + (str _singleton));
[_singleton,_zoneid,_zonesideid] call ZoneStatesManager_fnc_SeizeZone;