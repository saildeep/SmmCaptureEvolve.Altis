west setFriend [east,0];
west setFriend [independent,0];
east setFriend [west,0];
east setFriend [independent,0];
independent setFriend [west,0];
independent setFriend [east,0];
if(isServer)then{
    spawnLocs = [];
    if(smm_load)then{
        spawnLocs = sav_centers call smm_get;
    }else{
        _desiredNumZones = smm_spawner_k;
		
		if(smm_spawner_use_roads || smm_spawner_use_cities)then{
			//initial creation
			if(smm_spawner_use_roads)then{
				spawnLocs = [_desiredNumZones] call compile preprocessFileLineNumbers "smm_spawner\zone_generators\roads.sqf";
			}else{
			spawnLocs = [] call compile preprocessFileLineNumbers "smm_spawner\zone_generators\cities.sqf";
			
			};
		//      spawnLocs = spawnLocs call BIS_fnc_arrayShuffle;
			spawnLocs = spawnLocs call compile preprocessFileLineNumbers "smm_spawner\zone_generators\overlapping_zones_cleaner.sqf";
			spawnLocs = spawnLocs call compile preprocessFileLineNumbers "smm_spawner\zone_generators\simple_connection_creator.sqf";
			if(smm_spawner_connection_cleaner_use_angle)then{
			spawnLocs = spawnLocs call compile preprocessFileLineNumbers "smm_spawner\zone_generators\connection_cleaner.sqf";
			}else{
			spawnLocs = spawnLocs call compile preprocessFileLineNumbers "smm_spawner\zone_generators\spanning_tree.sqf";
			};
			while{!([spawnLocs,0] call smm_spawner_is_fully_connected)}do{
			_desiredNumZones                         = _desiredNumZones + 5;
			smm_spawner_neighbour_range              = smm_spawner_neighbour_range    *1.2;
			smm_spawner_connection_cleaner_max_angle = smm_spawner_connection_cleaner_max_angle/1.2;
			if(smm_spawner_use_roads)then{
				spawnLocs = [_desiredNumZones] call compile preprocessFileLineNumbers "smm_spawner\zone_generators\roads.sqf";
			}else{
				spawnLocs = call compile preprocessFile "smm_spawner\zone_generators\cities.sqf";
			
			};
			spawnLocs = spawnLocs call compile preprocessFileLineNumbers "smm_spawner\zone_generators\overlapping_zones_cleaner.sqf";
			spawnLocs = spawnLocs call compile preprocessFile "smm_spawner\zone_generators\simple_connection_creator.sqf";
			//  spawnLocs = spawnLocs call compile preprocessFile "smm_spawner\zone_generators\connection_cleaner.sqf";
			
			};
        }else{
			spawnLocs = [] call smm_fnc_advancedZoneGenerator;
		};
    };
    publicVariable "spawnLocs";
};
if(autodetectHeadless)then{
    if(isServer)then{
        _allHCs = entities "HeadlessClient_F";
        if((count _allHCs)>0 )then{
            useHeadless = true;
        }else{
            useHeadless = false;
        };
    }else{
        if(!hasInterface)then{
        //this gets executed on headless client
        useHeadless = true;
        publicVariable "useHeadless";
        };
    };


};
if(useHeadless)then{
    if!(isServer or hasInterface)then{
        [] execVM "smm_spawner\init_hc.sqf";
    };
    
}else{
    if (isServer) then{
        [] execVM "smm_spawner\init_hc.sqf";
    };
};
if(isServer)then{
diag_log ("Started spawner with autodetectHeadless=" + (str autodetectHeadless)+ " and useHeadless=" + (str useHeadless));
};
[]spawn{  
    waitUntil{!isNil "activeTargets"};
    waitUntil{!isNil "interaction_points"};
    waitUntil{!isNil "spawnLocs"};
    waitUntil{!isNil "spawner_init_finished"};
    waitUntil{alive player};
    sleep 30;
    {
        _x addAction [str_conquer,smm_spawner_conquer,_forEachIndex];
    }forEach interaction_points;
    [] call smm_spawner_update_marker_alpha;
};
