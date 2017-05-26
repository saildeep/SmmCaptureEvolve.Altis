if(isServer)then{
    [] spawn{
        while{true}do
        {
            sleep 120;
            _weaponHolders = nearestObjects [[0,0,0],["WeaponHolderSimulated","GroundWeaponHolder"],100000000];
            {
                _timeout = _x getVariable ["timeout",-1];
                if(!(_x call smm_fnc_garbageCollectorHasTimeout))then{
                    _x call smm_fnc_garbageCollectorReset;
                }else{
                    _x call smm_fnc_garbageCollectorDelete;
                };
            }forEach _weaponHolders;
            
            
            _allVehicles = vehicles;
            {
                if(_x call smm_fnc_garbageCollectorHasTimeout)then{
                    if((count(crew _x)) == 0)then
                    {
                        
                        _x call smm_fnc_garbageCollectorDelete;
                    
                    }else{
                        _x call smm_fnc_garbageCollectorResetVehicle;
                    };  
                };  
            }forEach _allVehicles;
            
        };
    };
};