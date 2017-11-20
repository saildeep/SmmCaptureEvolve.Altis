private _prefix = "[INIT] ";
west setFriend [east,0];
west setFriend [independent,0];
east setFriend [west,0];
east setFriend [independent,0];
independent setFriend [west,0];
independent setFriend [east,0];
if(isServer)then{
    
    private _zones = [];
    if(smm_load)then{
        private _loaded = sav_centers call smm_fnc_get;
        _zones = _loaded;
    }else{
		private _generated = [] call smm_fnc_advancedZoneGenerator;
        //transfer spawnLocs to new ZonesManager
    
        {
            //[position,hash,size,owner,connections,name]
            private _index = _forEachIndex;
            private _position = _x select 0;
            private _hash = _x select 1;
            private _size = _x select 2;
            private _owner = _x select 3;
            private _connections = _x select 4;
            private _name = _x select 5;
            private _items = _x select 6;
            diag_log(_prefix + " processing " + (str _x) );
            private _zone = [_index,_position,_hash,_size,_owner,_connections,_name,_items] call Zone_create;
            _zones pushBack _zone;
        }forEach _generated;

       
        
    };
    [[_zones] call ZonesManager_create,true] call ZonesManager_SetInstance;
    
    {
        [_x] call Zone_fnc_UpdateMarkers;
    }forEach ([call ZonesManager_GetInstance] call ZonesManager_get_Zones);
    missionNamespace setVariable["spawnLocs",nil];
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
