zoneNoToVehicle = [];
//indexing according to allFactions
//always contains the areas the current faction can attack, not those that are owned by the faction

/*
smm_fnc_getMultipleRandom = {
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
    _newout = _out + ([_newnum,_newarray] call smm_fnc_getMultipleRandom);
    _out= + _newout;
    };
    assert (typeName _out == "ARRAY");
    _out
};

smm_fnc_zoneEquals = {
    ((_this select 0) call smm_fnc_getHash) == ((_this select 1) call smm_fnc_getHash)
};

smm_fnc_getPosition = {
    private _zone = _this call getZone;
    (_zone select 0)
};

smm_fnc_getSize = {
    private _zone = _this call getZone;
    (_zone select 2)
};
smm_fnc_getSide = {
    private _zone = _this call getZone;
    (_zone select 3)
};

smm_fnc_getHash = {
    private _zone = _this call getZone;
    (_zone select 1)
};

smm_fnc_getNeighbours = {
    private _zone = _this call getZone;
    (_zone select 4)
};
*/
getNeighboursFromMultiple = {
    diag_log "@Deprecated";
};

filterZonesForSide = {
    diag_log "@Deprecated";
};
/*


smm_fnc_hash = {
    private ["_res"];
    _res = "";
    {
    _res = str(floor(_x)) + ';;;' + _res;
    }forEach _this;
    _res
};


smm_fnc_changeOwner = {
    private ["_no","_side","_zone","_hash"];
    _no = _this select 0;
    _side = _this select 1;
    _zone = spawnLocs select _no;
    _zone set [3,_side];
    _hash = _zone select 1;
    _hash setMarkerColor (_side call getColor);
    private _markerName = "respawn_" + (_side call smm_fnc_getSideName) + "_" + (_zone select 1);
    {
        //delete respawn markers from other teams
        private _mn = "respawn_" + (_x call smm_fnc_getSideName) + "_" + (_zone select 1);
        if (getMarkerColor _mn == "") then {
            deleteMarker _mn;
        };
    }forEach smm_spawner_all_factions;
    if(_side in smm_spawner_player_factions)then{
        private _marker = createMarker [_markerName,_zone select 0 ];
    }else{
        deleteMarker _markerName;
    };
    [] call smm_fnc_spawnerUpdateTargets;
    [] remoteExec ["smm_fnc_spawnerUpdateMarkerAlpha",0,false];
    
    //send only to all
    publicVariable "spawnLocs";
};


smm_fnc_getSideName = {
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

smm_fnc_getNeighbour = {
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
*/

if(isNil "activeTargets")then{
    activeTargets   = [[],[],[],[]];
};

/*
smm_fnc_getTargets = {
    assert (typeName _this == "SIDE");
    private _playerSideIndex = smm_spawner_all_factions find (_this);
    activeTargets select _playerSideIndex
};

smm_fnc_setTargets = {
    private _side = _this select 0;
    private _data = _this select 1;
    assert(typeName _side == "SIDE");
    assert(typeName _data == "ARRAY");
    private _playerSideIndex = smm_spawner_all_factions find (_side);
    activeTargets set [_playerSideIndex,_data];
};

smm_fnc_isTarget = {
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

smm_fnc_removeVehicle = {
        private _no = _this;
        private _vehs = zoneNoToVehicle select _no;
        {
        deleteVehicle _x;
        }forEach _vehs;
        zoneNoToVehicle set [_no,[]];
};

smm_fnc_addVehicle = {
        private _veh = _this select 1;
        private _zone = _this select 0;
        (zoneNoToVehicle select _zone) append [_veh];
};

smm_fnc_isAir = {
    private _vehClassname = _this;
    private _cfgEntry = configFile >> "CfgVehicles" >> _vehClassname;
    private _result = false;
    if((getText(_cfgEntry >> "vehicleClass"))=="Air")then{
        _result = true;
    };
    _result
};

smm_fnc_createVehicle = {
    private _vehType = _this select 0;
    private _pos = _this select 1;
    private _range = 100;
    private _numPlaces = 0;
    private _spawnPos = [];
    private _isAir = _vehType call smm_fnc_isAir;
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


smm_fnc_getRandomUnit = {
    private _side = _this select 0;
    private _group = _this select 1;
    private _sideNo = _side call smm_fnc_macrosToConfigSide;
	private _unitWrappedType = ([10000,_side] call smm_fnc_getUnits) select 0;
    private _type = _unitWrappedType select 0;
    _type createUnit [smm_spawner_center,_group,"newUnit = this",smm_skill,"PRIVATE"];
    private _unit = newUnit;
	if((count _unitWrappedType) > 2)then{
		_unit spawn (_unitWrappedType select 2);
	};
    _unit call smm_fnc_spawnerSetSkill;

    _unit
    
};


smm_fnc_fillVehicle = {
    private _side = _this select 0;
    private _units = [];
    private _unit = [];
    private _veh = _this select 1;
    private _group = _this select 2;
    if((_veh emptyPositions "Driver")>0)then{
        _unit = [_side,_group] call smm_fnc_getRandomUnit;
        _unit moveInDriver _veh;
        _unit assignAsDriver _veh;
        _units pushBack _unit;
    };
    if((_veh emptyPositions "Gunner")>0)then{
        _unit = [_side,_group] call smm_fnc_getRandomUnit;
        _unit moveInGunner _veh;
        _unit assignAsGunner _veh;
        _units pushBack _unit;
    };
    if((_veh emptyPositions "Commander")>0)then{
        _unit = [_side,_group] call smm_fnc_getRandomUnit;
        _unit moveInCommander _veh;
        _unit assignAsCommander _veh;
        _units pushBack _unit;
    };
    _units
};



smm_fnc_spawnerConquer = {
    private _zone = _this select 3;
    private _zoneSide = _zone call smm_fnc_getSide;
    if!([_zone,playerSide] call smm_fnc_isTarget)exitWith{hint str_no_permission};
    if(_zoneSide == (playerSide))then{
        hint str_own_zone;
    }else{
        if(_zoneSide == civilian)then{
            [_zone,playerSide] remoteExec ["smm_fnc_changeOwner",2,false];
            private _money =  (_zone call smm_fnc_getSize)*4;
            [_money,playerSide] call smm_fnc_addMoneySide;
        }else{
            hint str_no_permission;
        };
    };
    
};



smm_fnc_spawnerUpdateMarkerAlpha = {
    if(!hasInterface)exitWith{};
    private _targetZones = ((playerSide)call smm_fnc_getTargets);
    if(!(isNil "spawner_init_finished"))then{
        {
            //zonemarkers
            private _isVisible = (_x call smm_fnc_getSide) == (playerSide);
            _isVisible = _isVisible || (([_x,playerSide] call smm_fnc_getNeighbour) != -1);
            if(_isVisible)then{
                
                private _isTarget = false;
                private _nb = _x;
                {
                    _isTarget = _isTarget || ([_x,_nb] call smm_fnc_zoneEquals);
                }forEach _targetZones;
                
                if(_isTarget)then{
                    (_x call smm_fnc_getHash) setMarkerBrushLocal "SolidBorder";
                    (_x call smm_fnc_getHash) setMarkerAlphaLocal 1;
                }else{
                (_x call smm_fnc_getHash) setMarkerBrushLocal "GRID";
                (_x call smm_fnc_getHash) setMarkerAlphaLocal 0.3;
                };
            }else{
                (_x call smm_fnc_getHash) setMarkerAlphaLocal 0;
            };
            private _currentZoneNo = _forEachIndex;
            private _nbs = _x call smm_fnc_getNeighbours;
            //connection
            {
                if(_x <  _currentZoneNo)then{
                    private _markerName = (_x call smm_fnc_getHash) + "_" +(_currentZoneNo call smm_fnc_getHash);
                    if(((_x call smm_fnc_getSide) == (playerSide))|| ((_currentZoneNo call smm_fnc_getSide) == (playerSide)) )then{
                            _markerName setMarkerAlphaLocal 1;
                    }else{
                            _markerName setMarkerAlphaLocal 0;
                    };
                };
            }forEach _nbs;
            
        }forEach spawnLocs;
    };
};

smm_fnc_spawnerSetSkill = {
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
        private _defWP = _grp addWaypoint[_zone call smm_fnc_getPosition,10];
        _defWP setWaypointType "HOLD";
        _grp setCurrentWaypoint _defWP;
    };
    
};
*/

smm_spawner_cleanup_targets = {
    diag_log "@Deprecated";
};
/*


smm_fnc_SpawnerDeterminePossibleTargets = {
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

smm_fnc_spawnerUpdateTargets = {
    {
        if(isNil "spawner_init_finished")exitWith{false};
        [] call smm_fnc_cleanupTargets;
        private _currentSide = _x;
        private _maxTargets = smm_spawner_max_targets select _forEachIndex;
        private _currentTargets = (_currentSide call smm_fnc_getTargets);
       assert (typeName _currentSide == "SIDE");
       assert(typeName _maxTargets == "SCALAR");
       assert(typeName _currentTargets == "ARRAY");
       private _ccand = [_currentSide] call smm_fnc_SpawnerDeterminePossibleTargets;
       private _cand = _ccand - _currentTargets;
       private _neededTargets = _maxTargets - (count _currentTargets);
       _cand resize _neededTargets;
       [_currentSide, _currentTargets + _cand] call smm_fnc_setTargets;
        
    }forEach smm_spawner_all_factions;
    publicVariable "activeTargets";
    [] remoteExec ["smm_fnc_spawnerUpdateMarkerAlpha",0,false];
};
*/


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
