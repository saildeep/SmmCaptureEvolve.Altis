private _object = _this select 0;
private _command = _this select 1;
private _name = _this select 2;
private _out = "";
if(smm_ace)then{
	private _isSelf = 0;
	private _objectName = "";
	if((typeName _object)=="OBJECT")then{
		_isSelf = if(_object == player)then{1}else{0};
		_objectName = typeOf _object;
	}else{
	_objectName = _object;
	};
	private _parent = if(_isSelf == 1)then{ ["ACE_SelfActions"]}else{ ["ACE_MainActions"]};
	
	[_objectName,_isSelf] call ace_interact_menu_fnc_addMainAction;
	private _action = [_name,_name,"",_command,{true}]  call ace_interact_menu_fnc_createAction;
	if(smm_debug)then{
		systemChat (str _action);
	};
	[_objectName,_isSelf,_parent,_action] call ace_interact_menu_fnc_addActionToClass;
}else{
	_object addAction [_name,_command];
};
