_no =_this select 0;
_sideEntered = (_this select 1) call smm_fnc_macrosFromConfigSide;

//return if zone is not a target
if!([_no,_sideEntered] call smm_fnc_isTarget) exitWith {};

//only activate inactive zones
if!(zoneActive select _no) then{
    diag_log (format ["Inactive Zone %1 was entered by %2",_no,_sideEntered]);
    [_no,_sideEntered] spawn {
        _no          = _this select 0;
        _sideEntered = _this select 1;
        _zone        = _no call getZone;
        
        _pos = _zone call smm_fnc_getPosition;
        _size = _zone call smm_fnc_getSize;
        _zoneSide = _zone call smm_fnc_getSide;
        if(_zoneSide != _sideEntered && _zoneSide != civilian )then{
            zoneActive set [_no,true];
            _marker = _no call smm_fnc_getHash;
            
            //modify size according to player count
			//use player count for scalability
			_justPlayers = call BIS_fnc_listPlayers;
			_money =floor( _size * (sqrt (count _justPlayers)));
			_vehicleMoney = _money;
            //Creating infantry units
			diag_log ("Spawning  units in zone " + (str _no) +" with " + (str _money) + "$ and " + (str _size ) + " size");
            private _units = [_money,_zoneSide] call smm_fnc_getUnits;
            
            
            diag_log (str _units);
            
            _allGroups = [];
            _allUnits = [];
            //will get deleted anyway
            _currentGroup = createGroup _zoneSide;
			[_pos,60,"ColorBlue"] call smm_fnc_createDebugMarker;
            _randGroupPos = [_pos,(_size * 2)/3] call getPosNear;
            {
                if((_forEachIndex % smm_spawner_units_per_group) == 0)then{
                    _currentGroup = createGroup _zoneSide;
                    _currentGroup setVariable  ["ace_headless_blacklist", true, true];
                    _allGroups pushBack _currentGroup;
                   _randGroupPos = [_pos,_size] call getPosNear;
				   [_randGroupPos,60,"ColorGreen"] call smm_fnc_createDebugMarker; 
                };
				_randPos = [_randGroupPos,_size/3] call getPosNear;
				[_randPos,60,"ColorRed"] call smm_fnc_createDebugMarker;
				diag_log (format ["Spawning %1 at %2 in group %3",_x,_randPos,_currentGroup]);
				
				// this "createUnit" function return "Nothing", ... 
				(_x select 0) createUnit [_randPos,_currentGroup,"newUnit = this",smm_skill,"PRIVATE"];
				// ... so the last createUnit must select manually
				_unit =  (( units _currentGroup )select ((count (units _currentGroup))-1)) ;
				
				// set Unit Pos on surface
				[_unit,_randPos] call smm_fnc_setPosAGLS;
				
				// kill Unit which spawn near the origin of the map
				if( (_unit distance [0,0]) < 100)then{
					diag_log (format ["Unit %1 spawn in origin of the map, setDamage 1",_x]);
					_unit setDamage 1;
				};
			
                _unit = newUnit;
                
				//if units has script, which should be executed after spawning, execute it now
				if((count _x) > 2)then{
					_unit spawn (_x select 2); 
				};
				_allUnits pushBack _unit;
            }forEach _units;
			
			diag_log "Finished generating infantry";
			
            //Finished creating infantry
			
            _buildings = (zoneNoToBuildings select _no);
            if((count _buildings)> (count _allGroups) )then{
            {
                _building = _x select 0;
                _buildingPos = _x select 1;
                if(_forEachIndex < (count _allGroups))then{
                    _currentGroup = _allGroups select _forEachIndex;
                    _units = units _currentGroup;
                    _currentGroup setVariable ["urban",true];
                    _positions = [count _units,_buildingPos] call smm_fnc_getMultipleRandom;
                    {
                            _unit = _units select _forEachIndex;
                            _unit setPos (_x);
                        //  _unit disableAI "move";
                        //  _unit setUnitPos "UP";
                            _unit setDir (random 360);
                    }forEach _positions;
                    [_no,_currentGroup] spawn smm_fnc_spawnerPatrol;
                };
                
            }forEach (zoneNoToBuildings select _no);
            };
			
            //Create vehicles
			diag_log ("Getting vehicles for zone " + (str _no) + " from side " + (str _zoneSide) + " for " + (str _vehicleMoney) + "$");
            _vehicles = [_vehicleMoney,_zoneSide] call getVehicles;
            diag_log ("Spawning  vehicles in zone " + (str _no) +":");
            diag_log (str _vehicles);
            _allVehicles = [];
            {
                if((_forEachIndex % smm_spawner_vehicles_per_group) == 0)then{
                    _currentGroup = createGroup _zoneSide;
                    _currentGroup setVariable  ["ace_headless_blacklist", true, true];
                    _allGroups pushBack _currentGroup;
                };
                _randPos = [_pos,_size] call getPosNear;
                _veh = [_x,_randPos] call smm_fnc_createVehicle;
				[_veh,_randPos] call smm_fnc_setPosAGLS;
                [_no,_veh] call smm_fnc_addVehicle;
                _vehUnits = [_zoneSide,_veh,_currentGroup] call smm_fnc_fillVehicle;
                _allUnits append _vehUnits;
                _allVehicles pushBack _veh;
            }forEach _vehicles;
            
            //Finished creating vehicles
            
            //Creating waypoints
            
            {
            _x setSpeedMode "FULL";
            _x setVariable ["zone",_no,false];
            _grp = _x;
            _startWP = _x addWaypoint [_pos,0];
            _startWP setWaypointType "MOVE";
            _startWP setWaypointSpeed "LIMITED";
            _startWP setWaypointBehaviour "SAFE";
            _startWP setWaypointFormation "STAG COLUMN";
            if!(_grp getVariable ["is_static",false])then{
            {
                 _wpPos = [_pos,_size] call getPosNear;
                 _nextWp = _grp addWaypoint [_wpPos,0];
                 _nextWp setWaypointType "MOVE";
                }forEach [1,2,3,4,5,6,7,8,9];
                
                _endWP = _grp addWaypoint [_pos,0];
                _endWP setWaypointType "CYCLE";
            };
            }forEach _allGroups;
            
            
            {
                 _x setVariable["zone",_no,false];
                 _x setVariable["counter",false,false];
                 _x addEventHandler ["killed", "_this spawn onAiKilled"];
                 _x call smm_fnc_spawnerSetSkill;
            }forEach _allUnits;
            zoneNoToUnits set [_no,_allUnits];
                
        };
    };
};


