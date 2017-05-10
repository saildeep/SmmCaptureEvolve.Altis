  // State of remoteExec: 0-turned off, 1-turned on, taking whitelist into account, 2-turned on, however, ignoring whitelists (default because of backward compatibility)
               mode = 1;
               // Ability to send jip messages: 0-disabled, 1-enabled (default)
               jip = 1;
               /*your functions here*/
               class smm_gear_research_server
               {
                      allowedTargets=2; // can target server (default)
                      jip = 0; // sending jip messages is disabled for this function (overrides settings in the Functions class)
               };
			   class smm_gear_research_notify
               {
                      allowedTargets=0; // can target all (default)
                      jip = 0; 
               };
			
			   class smm_save_do_server
               {
                      allowedTargets=2; // can target server (default)
                      jip = 0; // sending jip messages is disabled for this function (overrides settings in the Functions class)
               };
			   
			   class smm_notify
			   {
					 allowedTargets=0; // can target all (default)
                      jip = 0; 
			   };
			   
			   class smm_buy_server
			   {
					allowedTargets = 2;
					jip = 0;
			   };
			   
			   class smm_add_money_server
			   {
					allowedTargets = 2;
					jip = 0;
			   };
			   class bis_fnc_arsenal
			   {
					allowedTargets = 0;
					jip = 0;
			   };
			   class smm_garbage_collector_observe_vehicle_server
			   {
					allowedTargets = 2;
					jip = 0;
			   };
			   class smm_register_uid
			   {
					allowedTargets = 2;
					jip = 0;
			   };
			   class smm_fnc_addServer
			   {
				  allowedTargets = 2;
				  jip = 0; 
			   };
			   class smm_get_neighbour
			   {
				    allowedTargets = 2;
					jip = 0; 
			   };
			   class smm_change_owner
			   {
				    allowedTargets = 2;
					jip = 0; 
			   };
			   class smm_add_money_side
			   {
				    allowedTargets = 2;
					jip = 0; 
			   };
			   class smm_spawner_update_marker_alpha
			   {
				   allowedTargets = 0;
				   jip = 0;
				   
			   };
			   class smm_money_transfer_server
			   {
				   allowedTargets = 2;
				   jip = 0;
				   
			   };
			   class bis_fnc_reviveinitaddplayer
			   {
				   allowedTargets = 0;
				   jip = 1;
			   };
			   class bis_fnc_objectvar
			   {
					allowedTargets = 0;
					jip = 1;
			   };
			   class smm_fnc_onVehiclePurchasedServer
			   {
				   allowedTargets = 2;
				   jip = 0;
			   };