private _em = call EventManager_GetInstance;
[_em,"OnZoneActivated",smm_fnc_visualizeZoneActivated] call EventManager_fnc_AddListener;
[_em,"OnZoneDeactivated",smm_fnc_visualizeZoneDeactivated] call EventManager_fnc_AddListener;