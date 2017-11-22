params["_zoneid","_sides"];

if(hasInterface)then{
	if(playerSide in _sides)then{
		diag_log "Received creating task for params:";
		diag_log _this;
		private _zone = [call ZonesManager_GetInstance,_zoneid] call ZonesManager_fnc_GetZone;
		private _title = format [str_task_title,[_zone] call Zone_get_DisplayName];
		private _t = player createSimpleTask [_title];
		_t setSimpleTaskDestination ([_zone] call Zone_get_Position);
		_t setsimpletaskType "attack";
		_t setTaskState "Assigned";
		//build task descriptiom
		private _d = str_task_description;
		diag_log "Getting item ids for:";
		diag_log _zone;
		private _itemids = [_zone] call Zone_get_ItemIDs;
		private _hasItems = false;
		{
			private _item = allItems select _x;
			diag_log "Checking perk for :";
			diag_log _item;
			private _perk = [_item] call PurchasableItem_get_Perk;
			diag_log "Sucessfully got perk";
			diag_log _perk;
			if([player,_perk] call smm_fnc_hasPerk)then{
				diag_log "Adding item to task :";
				diag_log _item;
				if(!_hasItems)then{
					_d = _d + str_task_description_items;
				};
				_hasItems = true;

				private _picture = [_item,"_picture"] call PurchasableItem_fnc_ConfigText;
				private _displayName = [_item,"displayName"] call PurchasableItem_fnc_ConfigText;

				_d = _d + format[str_task_description_item,_picture,_displayName];
			};
		}forEach _itemids;
		_t setSimpleTaskDescription[_d,_title,_title];

		private _tm = call TasksManager_GetInstance;
		[_tm,_zoneid,_t] call TasksManager_fnc_AddTask;
	};
};