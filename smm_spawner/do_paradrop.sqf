_unit = _this select 0;
_target = _this select 1;
[_unit,[_unit,"inv"]] call BIS_fnc_saveInventory;
sleep 1;
_unit addBackpack smm_spawner_ai_parachute;
//get position to jump
_newPos = [_target,smm_spawner_ai_parachute_distance] call getPosNear;
sleep 1;
_newPos set [2,smm_spawner_ai_parachute_height];
_unit allowDamage false;
_unit setPos _newPos;

waitUntil{(isTouchingGround _unit) || ((position _unit) select 2) < 1 };
sleep 5;
_unit allowDamage true;
sleep 1;
[_unit,[_unit,"inv"]] call BIS_fnc_loadInventory;