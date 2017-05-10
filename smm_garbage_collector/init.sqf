if(isServer)then{
    [] spawn{
        while{true}do
        {
            sleep 120;
            _weaponHolders = nearestObjects [[0,0,0],["WeaponHolderSimulated","GroundWeaponHolder"],100000000];
            {
                _timeout = _x getVariable ["timeout",-1];
                if(!(_x call smm_garbage_collector_has_timeout))then{
                    _x call smm_garbage_collector_reset;
                }else{
                    _x call smm_garbage_collector_delete;
                };
            }forEach _weaponHolders;
            
            
            _allVehicles = vehicles;
            {
                if(_x call smm_garbage_collector_has_timeout)then{
                    if((count(crew _x)) == 0)then
                    {
                        
                        _x call smm_garbage_collector_delete;
                    
                    }else{
                        _x call smm_garbage_collector_reset_vehicle;
                    };  
                };  
            }forEach _allVehicles;
            
        };
    };
};