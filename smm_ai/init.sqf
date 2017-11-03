private _em = call EventManager_GetInstance;
[_em, "OnInfantrySpawned", {_this call smm_fnc_initUnits}] call EventManager_fnc_AddListener;