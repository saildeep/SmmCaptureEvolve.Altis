private _vehicle = _this;
_vehicle call smm_fnc_garbageCollectorResetVehicle;
_vehicle addEventHandler ["GetIn","_this call smm_fnc_garbageCollectorResetVehicle"];
_vehicle addEventHandler ["Getout","_this call smm_fnc_garbageCollectorResetVehicle"];