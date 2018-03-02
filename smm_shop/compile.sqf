#define smm_shop_dialog_name "shop_dialog"
#define smm_shop_vehicle_handle 1500
smm_shop_chest = player; //set as default unit init is loaded

smm_shop_string = {
	private["_out"];
	_out =( str(_this select 0 ) + "$   " + (_this select 1));
	_out
};
smm_shop_create_vehicle = {
	private _classname = _this select 0;
	private _searchPos = (getPos player);
	if((count _this) > 1)then{
		_searchPos = _this select 1;
	};
	private _pos = _searchPos findEmptyPosition [0,100,_classname];
	if((count _pos) == 0)then{
		_pos = _searchPos;
	};
	
	private _veh = createVehicle [_classname,_pos,[],0,"NONE"];
	//clear all vehicles despite ammo boxes
	if(!(_veh isKindOf "ReammoBox_F"))then{
		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearItemCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
	};
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
		private _index = 0;
		{
			//_classname = _x select 0; 
			private _classname = [_x] call PurchasableVehicle_get_Classname;
			private _price = [_x] call PurchasableVehicle_get_Price;
			private _name = [_x] call PurchasableVehicle_fnc_GetName;
			private _icon =[_x] call PurchasableVehicle_fnc_GetIcon;
			private _perk = [_x] call PurchasableVehicle_get_Perk;
			private _displayText = [_price,_name] call smm_shop_string;
			
			if([player,_perk] call smm_fnc_hasPerk)then{
				private _color = [0.9,0.9,0,1];
				if((call smm_fnc_getBalance) >= _price) then{
					_color = [0,0.2,0.9,1];
				};
				
				lbAdd [smm_shop_vehicle_handle ,_displayText];
				lbSetData [smm_shop_vehicle_handle,_index,str _forEachIndex];
				lbSetValue [smm_shop_vehicle_handle,_index,_price]; //set price as value
				if(!(_icon in ["pictureThing"]) )then{
					lbSetPicture [smm_shop_vehicle_handle,_index,_icon];
					lbSetPictureColor [smm_shop_vehicle_handle, _index, _color];
				};
				
				lbSetColor [smm_shop_vehicle_handle,_index,_color];
				_index = _index +1;
			};
		}forEach buy_units;

		

	}else{
		hint str_no_permission;
	};

	
};

smm_shop_on_vehicle = {
	private _curSelId = lbCurSel smm_shop_vehicle_handle;
	private _out = false;
	private _isInRange = [getPos player] call smm_fnc_positionInPlayerOwnedZone;
	if(_isInRange)then{
		if(_curSelId>-1)then{
			
			private _price = lbValue [smm_shop_vehicle_handle,_curSelId];
			private _index = parseNumber (lbData [smm_shop_vehicle_handle,_curSelId]);
			private _element = buy_units select _index;
			private _classname = [_element] call PurchasableVehicle_get_Classname;
			private _fn = [_element] call PurchasableVehicle_get_PostSpawnFunction;
			if(_price call smm_fnc_buy) then {
				private _veh = [_classname] call smm_shop_create_vehicle;
				assert !(isNil "_veh");
				[_veh,_price,_classname] spawn smm_fnc_onVehiclePurchased;
				_veh spawn _fn;
				
			}else{
				_out = true;
			};
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
		private _index = parseNumber( lbData [smm_shop_vehicle_handle,_curSelId]);
		private _element = buy_units select _index;

		private _fn = [_element] call PurchasableVehicle_get_PostSpawnFunction;
		private _classname 		= [_element] call PurchasableVehicle_get_Classname;
		smm_shop_on_vehicle_pos_price 		= _price;
		smm_shop_on_vehicle_pos_classname 	= _classname;
		smm_shop_on_vehicle_pos_fn 			= _fn;
		
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
	private _isInRange 	= [_clickpos] call smm_fnc_positionInPlayerOwnedZone;
	private _price 		= smm_shop_on_vehicle_pos_price;
	private _classname	= smm_shop_on_vehicle_pos_classname; 	 
	
	
	if(_isInRange)then{
		if(_price call smm_fnc_buy)then{
			private _veh = [_classname,_clickpos] call smm_shop_create_vehicle;
			assert !(isNil "_veh");
			[_veh,_price,_classname] spawn smm_fnc_onVehiclePurchased;
			_veh spawn smm_shop_on_vehicle_pos_fn;
		}else {
			titleText [str_insufficient, "PLAIN"];
		};
	}else{
		titleText [str_out_of_range,"PLAIN"];
	};


};




