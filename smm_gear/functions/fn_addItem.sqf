_classname = _this select 0;
	if!(isNil "_classname")then{
		[_this select 0,_this select 1, getPlayerUID player] remoteExec ["smm_fnc_addServer",2,false];
		private _name = _this call smm_fnc_getDisplayName;
		titleText [(format [str_receivied_item,_name]),"PLAIN"];
	};