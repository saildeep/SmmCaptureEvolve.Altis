smm_shop_dialog_name = "shop_dialog";
smm_shop_vehicle_handle = 1500;
smm_shop_pack_handle = 1501;
smm_shop_chest = player; //set as default unit init is loaded
smm_has_permission = {
		private _zone = _this;
		private _zoneReal = _zone call getZone;
		private _side = _zoneReal select 3;
		_side == (playerSide)
};
smm_get_box = {
	private _zoneSide = ((_this select 3) call getZone)select 3;
	if(_zoneSide == (playerSide))then{
	smm_shop_chest setPos ([getPos player,2] call getPosNear);
	}else{
	hint str_no_permission;
	};

};
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
	_veh spawn smm_garbage_collector_observe_vehicle_client;
	
	//Create crew for UAV
	if(getNumber(configFile >> "CfgVehicles" >> typeof _veh >> "isUav")==1) then {
		createVehicleCrew _veh; 	
	};
	_veh
};
smm_shop_open = {
smm_shop_dialog_handle = createDialog smm_shop_dialog_name;
	private ["_classname","_price","_name","_displayText"];
	private _zone = _this select 3;
	smm_shop_last_zone_point = _zone;
	private _showEquipment = false;
	private _showVehicles = false;
	if(_zone <0)then{
		_showEquipment = true;
		_showVehicles = true;
	}else{
		private _zoneReal = _zone call getZone;
		private _side = _zoneReal select 3;
		
		if(_side == (playerSide))then{
		_showEquipment = true;
		_showVehicles = true;
		};
	
	};
	
	if(_showVehicles)then{
		_ownVehicles = 4 call smm_fnc_getGear;
		//draw vehicles
		{
		_classname = _x select 0;
		_price = _x select 1;
		_name = getText(configFile >> "CfgVehicles" >> _classname >> "displayName");
		_icon = getText(configFile >> "CfgVehicles" >> _classname >> "picture");
		if(_classname in _ownVehicles)then{
			_name = "[x]"  + _name ;
			_price = ceil (_price/8);
		}else{
			_name = "[ ]" + _name;
		};
		_displayText = [_price,_name] call smm_shop_string;
		lbAdd [smm_shop_vehicle_handle ,_displayText];
		lbSetData [smm_shop_vehicle_handle,_forEachIndex,_classname];
		lbSetValue [smm_shop_vehicle_handle,_forEachIndex,_price]; //set price as value
		lbSetPicture [smm_shop_vehicle_handle,_forEachIndex,_icon];
		lbSetPictureColor [smm_shop_vehicle_handle,_forEachIndex, [1,1,1,1]];
		}forEach buy_units;
	};
	
	if(_showEquipment)then{
		{
			_name = _x select 0;
			_price = _x select 1;
			_displayText = [_price,_name] call smm_shop_string;
			lbAdd [smm_shop_pack_handle,_displayText];
			lbSetValue[smm_shop_pack_handle,_forEachIndex,_forEachIndex]; //set index as value;
		}forEach buy_packs;
	};
};

smm_shop_on_vehicle = {
	private _curSelId = lbCurSel smm_shop_vehicle_handle;
	private _out = false;
	if(_curSelId>-1)then{
		
		private _price = lbValue [smm_shop_vehicle_handle,_curSelId];
		private _classname = lbData [smm_shop_vehicle_handle,_curSelId];
		if(_price call smm_fnc_buy) then {
			if(_classname in (4 call smm_fnc_getGear))then{
				private _veh = [_classname] call smm_shop_create_vehicle;
				assert !(isNil "_veh");
				[_veh,_price,_classname] spawn smm_fnc_onVehiclePurchased;
			}else{
				[_classname,sav_vehicles] call smm_fnc_addItem;
				closeDialog 2;
				_out = false;
			};
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
		if(_classname in (4 call smm_fnc_getGear))then{
		// select pos
			closeDialog 2;
			hint str_hint_buy_and_place;
			openMap [true,true];
			handle1 = addMissionEventHandler ["MapSingleClick",{diag_log "click map";(_this select 1) call smm_shop_on_vehicle_pos_place ;openMap [false,false];removeMissionEventHandler ["MapSingleClick", handle1];}];
			
		}else{
			if(_price call smm_fnc_buy) then {
				[_classname,sav_vehicles] call smm_fnc_addItem;
				closeDialog 2;
				_out = false;
			}else{
				_out = true;
			};
		};	
	};
	_out
};
smm_shop_on_vehicle_pos_place = {
	private _clickpos 	= _this;
	private _tentpos  	= smm_shop_last_zone_point call getPosition;
	private _range 		= smm_shop_last_zone_point call getSize;
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


getRandWeapons = {
	private _out = [];
	for [{private _i=0}, {_i<_this}, {_i=_i+1}] do
	{
		_out append [selectRandom (rand_weapons - (1 call smm_fnc_getGear))];
	};
	_out
};

getRandMagazines = {
	private _out = [];
	for [{private _i=0}, {_i<_this}, {_i=_i+1}] do
	{
		_out append [selectRandom (rand_magazines - (2 call smm_fnc_getGear))];
	};
	_out
};

getRandItemsTier1 = {
	private _out = [];
	for [{private _i=0}, {_i<_this}, {_i=_i+1}] do
	{
		_out append [selectRandom (rand_items_one - (0 call smm_fnc_getGear))];
	};
	_out
};

getRandItemsTier2 = {
	private _out = [];
	for [{private _i=0}, {_i<_this}, {_i=_i+1}] do
	{
		_out append [selectRandom (rand_items_two - (0 call smm_fnc_getGear))];
	};
	_out
};

getRandBackpacks = {
	private _out = [];
	for [{private _i=0}, {_i<_this}, {_i=_i+1}] do
	{
		_out append [selectRandom (rand_backpacks- (3 call smm_fnc_getGear))];
	};
	_out
};

smm_shop_on_pack = {
	private _curId = lbCurSel smm_shop_pack_handle;
	private _out = false;
	if(_curId> -1)then{
	private _pack = buy_packs select ( lbValue [smm_shop_pack_handle,_curId]);
	private _price = _pack select 1;
	private _set = _pack select 2;
	
	if(_price call smm_fnc_buy) then {
		private _weps = (_set select 0) call getRandWeapons;
		private _mags = (_set select 1) call getRandMagazines;
		private _itms1 = (_set select 2) call getRandItemsTier1;
		private _bps = (_set select 3) call getRandBackpacks;
		private _itms2 = (_set select 4) call getRandItemsTier2;
		{
		
			[_x,sav_weapons] call smm_fnc_addItem;
		}forEach _weps;
		{
			
			[_x,sav_magazines] call smm_fnc_addItem;
		}forEach _mags;
		{
			
			[_x,sav_items] call smm_fnc_addItem;
		
		}forEach _itms1;
		{
			
			[_x,sav_backpacks] call smm_fnc_addItem;
			
		}forEach _bps;
		{
		
			[_x,sav_items] call smm_fnc_addItem;
			
		}forEach _itms2;
	}else{
		_out = true;
	};
	};
	
	_out
};



