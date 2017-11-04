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
			   
			   class smm_fnc_buyServer
			   {
					allowedTargets = 2;
					jip = 0;
			   };
			   
			   class smm_fnc_addMoneyServer
			   {
					allowedTargets = 2;
					jip = 0;
			   };
			   class bis_fnc_arsenal
			   {
					allowedTargets = 0;
					jip = 0;
			   };
			   class smm_fnc_garbageCollectorObserveVehicleServer
			   {
					allowedTargets = 2;
					jip = 0;
			   };
			   class smm_fnc_registerUid
			   {
					allowedTargets = 2;
					jip = 0;
			   };
			   class smm_fnc_addServer
			   {
				  allowedTargets = 2;
				  jip = 0; 
			   };
			   class smm_fnc_getNeighbour
			   {
				    allowedTargets = 2;
					jip = 0; 
			   };
			   class smm_fnc_addMoneySide
			   {
				    allowedTargets = 2;
					jip = 0; 
			   };
			   class smm_fnc_spawnerUpdateMarkerAlpha
			   {
				   allowedTargets = 0;
				   jip = 0;
				   
			   };
			   class smm_fnc_moneyTransferServer
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

			   class smm_fnc_changeOwnerOnServer
			   {
				    allowedTargets = 2;
					jip = 0; 
			   };

			   class smm_fnc_updateTargetsOnHC{
				   allowedTargets = 0;
				   jip = 0;
			   };

			   class smm_fnc_visualizeZoneActivatedLocal{
					allowedTargets = 0;
				   	jip = 1;
			   };
			   class smm_fnc_visualizeZoneDeactivatedLocal{
					allowedTargets = 0;
				   	jip = 1;
			   };
			   
			   class smm_fnc_assignCurator
			   {
				   allowedTargets = 2;
				   jip = 0;
			   };
			   
			   class smm_fnc_onAssignCurator
			   {
				   allowedTargets = 1;
				   jip = 0;
			   };
			   