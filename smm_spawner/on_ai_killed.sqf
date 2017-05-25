_unit = _this select 0;
_killer = _this select 1;
_zoneNo = _unit getVariable "zone";
_isCounterAttack = _unit getVariable "counter";
_group = group _unit;
_killerSide = side _killer;
_money = floor (random 9);
[_money,_killerSide] call smm_fnc_addMoneySide;

_countAlive = 0;
_units = zoneNoToUnits select _zoneNo;
{
    if(alive _x )then{
        _countAlive = _countAlive +1;
    };
}forEach _units;
zoneNoToUnits set [_zoneNo, _units  - [_unit]];
if(_countAlive> 0 && _countAlive == smm_spawner_patroling_threshold)then{
    {
        (group _x) setVariable ["urban",false];
    
    }forEach (zoneNoToUnits select _zoneNo);

};
//diag_log (str(_unit) + " was killed in zone " + str(_zoneNo) + " with group " + str(_group) + " where " + str(_countAlive) + " were still alive");
if(_countAlive == 0)then{
    [_zoneNo,_isCounterAttack] spawn onGroupWiped;
};
_zoneCenter = interaction_points select _zoneNo;
if(_countAlive < 10)then{
    {
        _wp = (group _x) addWaypoint [_zoneCenter,0];
        (group _x) setCurrentWaypoint _wp;
        _wp setWaypointType "HOLD";
    }forEach (zoneNoToUnits select _zoneNo);
};