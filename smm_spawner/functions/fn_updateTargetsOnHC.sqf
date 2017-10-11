//first sleep some time, to wait for new Zones to arrive
sleep (1 + ( random 1));
[call ZoneStatesManager_GetInstance] call ZoneStatesManager_fnc_UpdateTargets;