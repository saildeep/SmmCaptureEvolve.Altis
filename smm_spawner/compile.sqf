zoneNoToVehicle = [];
//indexing according to allFactions
//always contains the areas the current faction can attack, not those that are owned by the faction

get_multiple_random = {
    private _num = _this select 0;
    assert (typeName _num == "SCALAR");
    private _array = _this select 1;
    assert (typeName _array == "ARRAY");
    private _randItem = selectRandom _array;
    private _out = [_randItem];
    assert (typeName _out == "ARRAY");
    if(_num > 1)then{
    _newarray = _array - _out;
    assert (typeName _newarray == "ARRAY");
    _newnum = _num -1;
    _newout = _out + ([_newnum,_newarray] call get_multiple_random);
    _out= + _newout;
    };
    assert (typeName _out == "ARRAY");
    _out
};

zoneEquals = {
    ((_this select 0) call getHash) == ((_this select 1) call getHash)
};

getPosition = {
    private _zone = _this call getZone;
    (_zone select 0)
};
getSize = {
    private _zone = _this call getZone;
    (_zone select 2)
};
getSide = {
    private _zone = _this call getZone;
    (_zone select 3)
};
getHash = {
    private _zone = _this call getZone;
    (_zone select 1)
};
getNeighbours = {
    private _zone = _this call getZone;
    (_zone select 4)
};

getNeighboursFromMultiple = {
    diag_log "@Deprecated";
};

filterZonesForSide = {
    diag_log "@Deprecated";
};
smm_hash = {
    private ["_res"];
    _res = "";
    {
    _res = str(floor(_x)) + ';;;' + _res;
    }forEach _this;
    _res
};
smm_change_owner = {
    private ["_no","_side","_zone","_hash"];
    _no = _this select 0;
    _side = _this select 1;
    _zone = spawnLocs select _no;
    _zone set [3,_side];
    _hash = _zone select 1;
    _hash setMarkerColor (_side call getColor);
    private _markerName = "respawn_" + (_side call smm_get_side_name) + "_" + (_zone select 1);
    {
        //delete respawn markers from other teams
        private _mn = "respawn_" + (_x call smm_get_side_name) + "_" + (_zone select 1);
        if (getMarkerColor _mn == "") then {
            deleteMarker _mn;
        };
    }forEach smm_spawner_all_factions;
    if(_side in smm_spawner_player_factions)then{
        private _marker = createMarker [_markerName,_zone select 0 ];
    }else{
        deleteMarker _markerName;
    };
    [] call smm_spawner_update_targets;
    [] remoteExec ["smm_spawner_update_marker_alpha",0,false];
    
    //send only to all
    publicVariable "spawnLocs";
};

smm_get_side_name = {
    private _side = _this;
    private _out = "";
    if(_side == east)then{
        _out = "east";
    };
    if(_side == west)then{
        _out = "west";
    };
    if(_side == independent)then{
        _out = "guerrila";
    };
    if(_side == civilian)then{
        _out = "civilian";
    };
    _out
};

smm_get_neighbour = {
    private ["_side","_zoneNo","_zone","_out","_otherZone","_distNow","_newDist","_bestDist"];
    _zoneNo = _this select 0;
    _side = _this select 1;
    _zone = _zoneNo call getZone;
    _out = -1;
    _bestDist = 22222222; 
    {
        _otherZone = _x call getZone;
        if((_otherZone select 3) == _side) then{
        _newDist = (_zone select 0) distance (_otherZone select 0);
            if(_newDist < _bestDist)then{
                _out = _x;
                _bestDist = _newDist;
            };
        };
    }forEach (_zone select 4);
    _out
};

if(isNil "activeTargets")then{
    activeTargets   = [[],[],[],[]];
};
smm_get_targets = {
    assert (typeName _this == "SIDE");
    private _playerSideIndex = smm_spawner_all_factions find (_this);
    activeTargets select _playerSideIndex
};

smm_set_targets = {
    private _side = _this select 0;
    private _data = _this select 1;
    assert(typeName _side == "SIDE");
    assert(typeName _data == "ARRAY");
    private _playerSideIndex = smm_spawner_all_factions find (_side);
    activeTargets set [_playerSideIndex,_data];
};

smm_is_target = {
    private _out = false;
    private _zoneNo = _this select 0;
    private _side = _this select 1;
    assert(typeName _zoneNo == "SCALAR");
    assert (typeName _side =="SIDE");
    {
        if(_x == _side)then{
         _out = _out || (_zoneNo in (activeTargets select _forEachIndex));
        };
       
    }forEach smm_spawner_all_factions;
    _out
};

smm_get_armed_vehicle = {
    
    private _maxPrice = _this + 1;
    private _veh = "";
    private _counter = 0;
    while{(_counter < 50) && (_veh == "")}do {
        private _entry = selectRandom ai_vehicles_armed;
        if((_entry select 1)<_maxPrice )then{
            _veh = _entry select 0;
        };
        _counter = _counter + 1;
    };
    
    _veh
};

smm_get_transport_vehicle = {
    private _cur = ["",0];
    private _maxPrice = _this;
    {
         private _classname = _x select 0;
         private _price = _x select 1;
         if(_price <= _maxPrice && _price > (_cur select 1))then{
         _cur = _x;
         };
    
    }forEach ai_vehicles_transport;
    (_cur select 0)
};

smm_remove_vehicle = {
        private _no = _this;
        private _vehs = zoneNoToVehicle select _no;
        {
        deleteVehicle _x;
        }forEach _vehs;
        zoneNoToVehicle set [_no,[]];
};
smm_add_vehicle = {
        private _veh = _this select 1;
        private _zone = _this select 0;
        (zoneNoToVehicle select _zone) append [_veh];
};

smm_is_air = {
    private _vehClassname = _this;
    private _cfgEntry = configFile >> "CfgVehicles" >> _vehClassname;
    private _result = false;
    if((getText(_cfgEntry >> "vehicleClass"))=="Air")then{
        _result = true;
    };
    _result
};

smm_create_vehicle = {
    private _vehType = _this select 0;
    private _pos = _this select 1;
    private _range = 100;
    private _numPlaces = 0;
    private _spawnPos = [];
    private _isAir = _vehType call smm_is_air;
    private _randomPos = [_pos,_range] call getPosNear;
    private _dir = 0;
    if(_isAir) then{
        _spawnPos = [_randomPos select 0,(_randomPos select 1) + 500,_randomPos select 2];
    }else{
    //  _spawnPos = [(sizeOf _vehType) min 10,_randomPos,0,100,1,0.5,0,false] call getVehiclePos;
    
    };
    
    //fallback 1
    if((count _spawnPos) == 0)then{
        _spawnPos = _randomPos findEmptyPosition [0,_range,_vehType];
    };
    
    //fallback 2
    if((count _spawnPos)== 0)then{
        _spawnPos = [_pos,_range] call getPosNear;
    };
    
    private _veh = if(_isAir)then{
        createVehicle [_vehType,_spawnPos,[],0,"FLY"];
    }else{
        createVehicle [_vehType,_spawnPos,[],0,"NONE"];
    };
    _veh setDir _dir;
    _veh spawn spawnSafe;
    _veh
    
    
};
smm_get_random_unit = {
    private _side = _this select 0;
    private _group = _this select 1;
    private _sideNo = _side call macros_to_config_side;
    private _type = (selectRandom (ai_infantry select _sideNo)) select 0;
    _type createUnit [smm_spawner_center,_group,"newUnit = this",smm_skill,"PRIVATE"];
    private _unit = newUnit;
    _unit call smm_spawner_set_skill;

    _unit
    
};

smm_fill_vehicle = {
    private _side = _this select 0;
    private _units = [];
    private _unit = [];
    private _veh = _this select 1;
    private _group = _this select 2;
    if((_veh emptyPositions "Driver")>0)then{
        _unit = [_side,_group] call smm_get_random_unit;
        _unit moveInDriver _veh;
        _unit assignAsDriver _veh;
        _units pushBack _unit;
    };
    if((_veh emptyPositions "Gunner")>0)then{
        _unit = [_side,_group] call smm_get_random_unit;
        _unit moveInGunner _veh;
        _unit assignAsGunner _veh;
        _units pushBack _unit;
    };
    if((_veh emptyPositions "Commander")>0)then{
        _unit = [_side,_group] call smm_get_random_unit;
        _unit moveInCommander _veh;
        _unit assignAsCommander _veh;
        _units pushBack _unit;
    };
    _units
};
smm_spawner_conquer = {
    private _zone = _this select 3;
    private _zoneSide = _zone call getSide;
    if!([_zone,playerSide] call smm_is_target)exitWith{hint str_no_permission};
    if(_zoneSide == (playerSide))then{
        hint str_own_zone;
    }else{
        if(_zoneSide == civilian)then{
            [_zone,playerSide] remoteExec ["smm_change_owner",2,false];
            private _money =  (_zone call getSize)*4;
            [_money,playerSide] call smm_add_money_side;
        }else{
            hint str_no_permission;
        };
    };
    
};
smm_spawner_update_marker_alpha = {
    if(!hasInterface)exitWith{};
    private _targetZones = ((playerSide)call smm_get_targets);
    if(!(isNil "spawner_init_finished"))then{
        {
            //zonemarkers
            private _isVisible = (_x call getSide) == (playerSide);
            _isVisible = _isVisible || (([_x,playerSide] call smm_get_neighbour) != -1);
            if(_isVisible)then{
                
                private _isTarget = false;
                private _nb = _x;
                {
                    _isTarget = _isTarget || ([_x,_nb] call zoneEquals);
                }forEach _targetZones;
                
                if(_isTarget)then{
                    (_x call getHash) setMarkerBrushLocal "SolidBorder";
                    (_x call getHash) setMarkerAlphaLocal 1;
                }else{
                (_x call getHash) setMarkerBrushLocal "GRID";
                (_x call getHash) setMarkerAlphaLocal 0.3;
                };
            }else{
                (_x call getHash) setMarkerAlphaLocal 0;
            };
            private _currentZoneNo = _forEachIndex;
            private _nbs = _x call getNeighbours;
            //connection
            {
                if(_x <  _currentZoneNo)then{
                    private _markerName = (_x call getHash) + "_" +(_currentZoneNo call getHash);
                    if(((_x call getSide) == (playerSide))|| ((_currentZoneNo call getSide) == (playerSide)) )then{
                            _markerName setMarkerAlphaLocal 1;
                    }else{
                            _markerName setMarkerAlphaLocal 0;
                    };
                };
            }forEach _nbs;
            
        }forEach spawnLocs;
    };
};

smm_spawner_set_skill = {
    private _unit = _this;
    _unit setSkill ["aimingAccuracy",0.7];
    _unit setSkill ["aimingShake",0.8];
    _unit setSkill ["aimingSpeed",0.8];
    _unit setSkill ["commanding",0.7];
    _unit setSkill ["courage",0.8];
    _unit setSkill ["reloadSpeed",0.9];
    _unit setSkill ["spotDistance",0.7];
    _unit setSkill ["spotTime",0.8];
    _unit
};

smm_spawner_patrol = {
    private _zone = _this select 0;
    private _grp = _this select 1;
    private _units = units _grp;
    while{(_grp getVariable ["urban",false]) && !(isNull _grp)}do{
        private _building = (selectRandom (zoneNoToBuildings select _zone)) select 0;
        private _wp = _grp addWaypoint[getPos _building,10];
        _wp setWaypointType "HOLD";
        _wp waypointAttachObject _building;
        _wp setWaypointHousePosition 1;
        _grp setCurrentWaypoint _wp;
        sleep (random [60,200,300]);
    };
    if!(isNull _grp)then{
        private _defWP = _grp addWaypoint[_zone call getPosition,10];
        _defWP setWaypointType "HOLD";
        _grp setCurrentWaypoint _defWP;
    };
    
};
smm_spawner_cleanup_targets = {
    diag_log "@Deprecated";
};

smm_spawner_determine_possible_targets = {
    assert (typeName _this == "ARRAY");
    private _side = _this select 0;
    private _targets = ([_side,spawnLocs] call smm_fnc_filterZonesFromSide);
    private _targetnb = _targets call smm_fnc_getNeighboursFromMultiple;
    private _possibleTargets = [];
    private _foreignFactions = smm_spawner_all_factions - [_side];
    {
        _possibleTargets append ([_x,_targetnb] call smm_fnc_filterZonesFromSide);
    }forEach _foreignFactions;
    _possibleTargets
};

smm_spawner_update_targets = {
    {
        if(isNil "spawner_init_finished")exitWith{false};
        [] call smm_fnc_cleanupTargets;
        private _currentSide = _x;
        private _maxTargets = smm_spawner_max_targets select _forEachIndex;
        private _currentTargets = (_currentSide call smm_get_targets);
       assert (typeName _currentSide == "SIDE");
       assert(typeName _maxTargets == "SCALAR");
       assert(typeName _currentTargets == "ARRAY");
       private _ccand = [_currentSide] call smm_spawner_determine_possible_targets;
       private _cand = _ccand - _currentTargets;
       private _neededTargets = _maxTargets - (count _currentTargets);
       _cand resize _neededTargets;
       [_currentSide, _currentTargets + _cand] call smm_set_targets;
        
    }forEach smm_spawner_all_factions;
    publicVariable "activeTargets";
    [] remoteExec ["smm_spawner_update_marker_alpha",0,false];
};



call compile preprocessFile "smm_spawner\zone_generators\compile.sqf";
onZoneEnter = compileFinal preprocessFile "smm_spawner\on_zone_enter.sqf";
onZoneLeave = compileFinal preprocessFile "smm_spawner\on_zone_leave.sqf";
onAiKilled = compileFinal preprocessFile "smm_spawner\on_ai_killed.sqf";
onGroupWiped = compileFinal preprocessFile "smm_spawner\on_group_wiped.sqf";
getVehicles = compileFinal preprocessFile "smm_spawner\get_vehicles.sqf";
getZone = compileFinal preprocessFile "smm_spawner\get_zone.sqf";
getVehiclePos = compileFinal preprocessFile "smm_spawner\get_safe_vehicle_pos.sqf";
spawnSafe = compileFinal preprocessFile "smm_spawner\spawn_safe.sqf";
doParadrop = compileFinal preprocessFile "smm_spawner\do_paradrop.sqf";
