smm_shop_dialog_name = "shop_dialog";
smm_shop_vehicle_handle = 1500;
smm_shop_chest = player; //set as default unit init is loaded

smm_shop_string = {
	private["_out"];
	_out =( str(_this select 0 ) + "$   " + (_this select 1));
	_out
};
smm_shop_create_vehicle = {
	private _classname = _this select 0;
	private _pos = (getPos player) findEmptyPosition [0,100,_classname];
	if((count _this) > 1)then{
		_pos = _this select 1;
	};
	private _veh = createVehicle [_classname,_pos,[],0,"NONE"];
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh;
	clearItemCargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	_veh disableTIEquipment true;
	_veh spawn smm_fnc_garbageCollectorObserveVehicleClient;
	
	//Create crew for UAV
	if(getNumber(configFile >> "CfgVehicles" >> typeof _veh >> "isUav")==1) then {
		createVehicleCrew _veh; 	
	};
	_veh
};
smm_shop_open = {
	params["_attachedobj","_caller","_actionid","_arguments"];
	private _zoneid = _arguments;
	smm_shop_last_zone_id = _zoneid;
	private _zone = [call ZonesManager_GetInstance,_zoneid] call ZonesManager_fnc_GetZone;
	private _side = [_zone] call Zone_get_Owner;
	if(_side == playerSide)then{
		smm_shop_dialog_handle = createDialog smm_shop_dialog_name;

		//draw vehicles
		{
			//_classname = _x select 0; 
			private _classname = [_x] call PurchasableVehicle_get_Classname;
			private _price = [_x] call PurchasableVehicle_get_Price;
			private _name = [_x] call PurchasableVehicle_fnc_GetName;
			private _icon =[_x] call PurchasableVehicle_fnc_GetIcon;
			private _perk = [_x] call PurchasableVehicle_get_Perk;
			private _displayText = [_price,_name] call smm_shop_string;
			if([player,_perk] call smm_fnc_hasPerk)then{
				lbAdd [smm_shop_vehicle_handle ,_displayText];
				lbSetData [smm_shop_vehicle_handle,_forEachIndex,_classname];
				lbSetValue [smm_shop_vehicle_handle,_forEachIndex,_price]; //set price as value
				if(!(_icon in ["pictureThing"] )then{
					lbSetPicture [smm_shop_vehicle_handle,_forEachIndex,_icon];
				};
				lbSetPictureColor [smm_shop_vehicle_handle,_forEachIndex, [1,1,1,1]];
			};
		}forEach buy_units;

		

	}else{
		hint str_no_permission;
	};

	
};

smm_shop_on_vehicle = {
	private _curSelId = lbCurSel smm_shop_vehicle_handle;
	private _out = false;
	if(_curSelId>-1)then{
		
		private _price = lbValue [smm_shop_vehicle_handle,_curSelId];
		private _classname = lbData [smm_shop_vehicle_handle,_curSelId];
		if(_price call smm_fnc_buy) then {
			private _veh = [_classname] call smm_shop_create_vehicle;
			assert !(isNil "_veh");
			[_veh,_price,_classname] spawn smm_fnc_onVehiclePurchased;
			
		}else{
			_out = true;
		};
	};
	_out
};

// buy vehicle and manual position it 

smm_shop_on_vehicle_pos = {
	
	private _curSelId 			= lbCurSel smm_shop_vehicle_handle;
	private _out 				= false;
	
	diag_log "Clicked Button for vehicle pos";
	
	if(_curSelId>-1)then{
		
		private _price			= lbValue [smm_shop_vehicle_handle,_curSelId];
		private _classname 		= lbData [smm_shop_vehicle_handle,_curSelId];
		smm_shop_on_vehicle_pos_price 		= _price;
		smm_shop_on_vehicle_pos_classname 	= _classname;
		
		// select pos
			closeDialog 2;
			hint str_hint_buy_and_place;
			openMap [true,true];
			handle1 = addMissionEventHandler ["MapSingleClick",{diag_log "click map";(_this select 1) call smm_shop_on_vehicle_pos_place ;openMap [false,false];removeMissionEventHandler ["MapSingleClick", handle1];}];
			
		
	};
	_out
};
smm_shop_on_vehicle_pos_place = {
	private _clickpos 	= _this;
	private _zonesManager = call ZonesManager_GetInstance;
	private _zone = [_zonesManager,smm_shop_last_zone_id] call ZonesManager_fnc_GetZone;
	private _tentpos  	= [_zone] call Zone_get_Position;
	private _range 		= [_zone] call Zone_get_Size;
	private _isInRange 	= (_clickpos distance _tentpos) < _range;
	private _price 		= smm_shop_on_vehicle_pos_price;
	private _classname	= smm_shop_on_vehicle_pos_classname; 	 
	
	
	if(_isInRange)then{
		if(_price call smm_fnc_buy)then{
			private _veh = [_classname,_clickpos] call smm_shop_create_vehicle;
			assert !(isNil "_veh");
			[_veh,_price,_classname] spawn smm_fnc_onVehiclePurchased;
		}else {
			titleText [str_insufficient, "PLAIN"];
		};
	}else{
		titleText [str_out_of_range,"PLAIN"];
	};


};



