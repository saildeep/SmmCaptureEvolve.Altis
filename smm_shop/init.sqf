[] spawn{
    {
        private _ip = [_x] call ZoneState_get_InteractionPoint;
        _ip addAction [str_shop,smm_shop_open,[_x] call ZoneState_get_ZoneID];
        if(smm_ace)then{
            _ip addAction [str_ammo_box_shop,'createDialog "RscDisplayAmmobox"',[_x] call ZoneState_get_ZoneID,3,false,false,"","[player,'VEHICLE_AMMO'] call smm_fnc_hasPerk"];
        };
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);
};

if(smm_ace)then{
    private _actionChildren = {
        params["_target","_player","_params"];
        private _actions = [];
        private _vehicles = (getPos _player) nearObjects ["AllVehicles",20];
        {   
            if(_x != _target)then{
                private _childStatement = {
                    params ["_target","_player","_params"];
                    diag_log format["Rearming vehicle:%1",_params];
                    _params call ace_rearm_fnc_rearmEntireVehicle;
                };
                private _childAction = [typeOf _x,typeOf _x,"",_childStatement,{true},{},[_target,_player,_x]]  call ace_interact_menu_fnc_createAction;
                _actions pushBack  [_childAction, [], _target];
            };
        }forEach _vehicles;

        _actions
    };

    private _action = ["RearmVehicle", "Fully rearm vehicle","",{},{true},_actionChildren,[],"",4] call ace_interact_menu_fnc_createAction;
    ["Box_NATO_AmmoVeh_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
};
