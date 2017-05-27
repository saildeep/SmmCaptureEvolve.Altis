/*
macros_isgood = {
(getNumber (_this >> "scope") == 2)
};

macros_isweapon = {
("Rifle_Base_F" in ([_this,true] call BIS_fnc_returnParents)) or ("Pistol_Base_F" in ([_this,true] call BIS_fnc_returnParents)) or ("Launcher_Base_F" in ([_this,true] call BIS_fnc_returnParents))
};
macros_to_config_side = {
	private _side = _this;
	private _out = 0;
	switch (_side) do {
		case east : {_out = 0;};
		case west : {_out = 1;};
		case independent : {_out = 2;};
		case civilian : {_out = 3;};
	};
	_out
};
macros_from_config_side = {
	private _sideNum = _this;
	private _side = west;
	if(_sideNum == 0)then{
		_side = east;
	};
	if(_sideNum == 1)then{
		_side = west;
	};
	if(_sideNum == 2)then{
		_side = independent;
	};
	if(_sideNum == 3)then{
		_side = civilian;
	};
	_side

};
macros_isitem = {
("ItemCore" in ([_this,true] call BIS_fnc_returnParents))
};
macros_ismagazine = {
("CA_Magazine" in ([_this,true] call BIS_fnc_returnParents)) and !("VehicleMagazine" in ([_this,true] call BIS_fnc_returnParents))
};
macros_isbackpack = {
("Bag_Base" in ([_this,true] call BIS_fnc_returnParents) && (getText (_this >> "vehicleClass") == "Backpacks")) 
};
macros_isunit = {
("CAManBase" in ([_this,true] call BIS_fnc_returnParents)) 
};
macros_isside = {
	private _unit = _this select 0;
	private _sideNo = _this select 1;
	((getNumber (_unit >> "side")) == _sideNo)
};

macros_has_acceptable_scope = {
	
	private _weapon = _this;
	if((typeName _this)=="STRING")then{
		_weapon = configClasses >> "CfgWeapons" >> _this;
	};
	private _linkedItems = _weapon >> "LinkedItems" ;
	_out = true;
	if(isClass _linkedItems)then{
		private _subclasses = "true" configClasses _linkedItems;
		{
			_out = _out && ((getText (_x>>"item")) call smm_is_not_thermal);
		}forEach _subclasses;
		
	};
	_out
};
macros_weapons = {
	private _candidates = "(_x call macros_isgood) and (_x call macros_isweapon) and (_x call macros_has_acceptable_scope)" configClasses (configFile >> "CfgWeapons");
	private _out = [];
	{
		private _classname = configName _x;
		private _start =  [_classname, 0, 3] call BIS_fnc_trimString;
		_out append [_classname];
		
	}forEach _candidates;
	_out
};



macros_mod_weapons = {
	private _candidates = "(_x call macros_isgood) and (_x call macros_isweapon) and (_x call macros_has_acceptable_scope)" configClasses (configFile >> "CfgWeapons");
	private _out = [];
	{
		private _classname = configName _x;
		private _start =  [_classname, 0, 3] call BIS_fnc_trimString;
		if((_start == "CUP_"))then{
			_out append [_classname];
		};
	}forEach _candidates;
	_out
};

macros_items = {
	private _candidates = "(_x call macros_isgood) and (_x call macros_isitem) and (_x call smm_is_not_thermal)" configClasses (configFile >> "CfgWeapons");
	private _out = [];
	{
		private _classname = configName _x;
		private _start =  [_classname, 0, 2] call BIS_fnc_trimString;
		_out append [_classname];
		
	}forEach _candidates;
	_out
	
};

macros_mod_items = {
	private _candidates = "(_x call macros_isgood) and (_x call macros_isitem) and (_x call smm_is_not_thermal)" configClasses (configFile >> "CfgWeapons");
	private _out = [];
	{
		private _classname = configName _x;
		private _start =  [_classname, 0, 2] call BIS_fnc_trimString;
		if(_start == "CUP" or _start == "tf_")then{
			_out append [_classname];
		};
	}forEach _candidates;
	_out
	
};

macros_ace_items = {
	private _candidates = "(_x call macros_isgood) and (_x call macros_isitem) and (_x call smm_is_not_thermal)" configClasses (configFile >> "CfgWeapons");
	private _out = [];
	{
		private _classname = configName _x;
		private _start =  [_classname, 0, 2] call BIS_fnc_trimString;
		if(_start == "ACE")then{
			_out append [_classname];
		};
	}forEach _candidates;
	_out
	
};

macros_magazines = {
	private _candidates = "(_x call macros_isgood) and (_x call macros_ismagazine)" configClasses (configFile >> "CfgMagazines");
	private _out = [];
	{
		private _classname = configName _x;
		private _start =  [_classname, 0, 3] call BIS_fnc_trimString;
		_out append [_classname];
		
	}forEach _candidates;
	_out
	
};

macros_mod_magazines = {
	private _candidates = "(_x call macros_isgood) and (_x call macros_ismagazine)" configClasses (configFile >> "CfgMagazines");
	private _out = [];
	{
		private _classname = configName _x;
		private _start =  [_classname, 0, 3] call BIS_fnc_trimString;
		if(_start == "CUP_" or _start == "ACE_")then{
			_out append [_classname];
		};
	}forEach _candidates;
	_out
	
};

macros_backpacks = {
	private _candidates = "(_x call macros_isgood) and (_x call macros_isbackpack)" configClasses (configFile >> "CfgVehicles");
	private _out = [];
	{
		private _classname = configName _x;
		private _start =  [_classname, 0, 2] call BIS_fnc_trimString;
		_out append [_classname];
	
	}forEach _candidates;
	_out
	
};

macros_mod_backpacks = {
	private _candidates = "(_x call macros_isgood) and (_x call macros_isbackpack)" configClasses (configFile >> "CfgVehicles");
	private _out = [];
	{
		private _classname = configName _x;
		private _start =  [_classname, 0, 2] call BIS_fnc_trimString;
		if(_start == "CUP" or _start == "ACE" or _start == "tf_")then{
			_out append [_classname];
		};
	}forEach _candidates;
	_out
	
};

macros_units = {
	private _side = _this;
	private _sideNo = _side call macros_to_config_side;
	private _candidates =  "(_x call macros_isgood) and (_x call macros_isunit) and ([_x," + (str _sideNo)+ "] call macros_isside)" configClasses (configFile >> "CfgVehicles");
	private _out = [];
	{
	private _classname = configName _x;
	private _start =  [_classname, 0, 3] call BIS_fnc_trimString;
	
			private _cost = 10 + (_forEachIndex % 20 );
			_out append [[_classname,_cost]];
		
	
	
	}forEach _candidates;
	_out
};

macros_mod_units = {
	private _side = _this;
	private _sideNo = _side call macros_to_config_side;
	private _candidates =  "(_x call macros_isgood) and (_x call macros_isunit) and ([_x," + (str _sideNo)+ "] call macros_isside)" configClasses (configFile >> "CfgVehicles");
	private _out = [];
	{
	private _classname = configName _x;
	private _start =  [_classname, 0, 3] call BIS_fnc_trimString;
		if(_start == "CUP_")then{
			private _cost = 10 + (_forEachIndex % 20 );
			_out append [[_classname,_cost]];
		};
	
	
	}forEach _candidates;
	_out
};
*/