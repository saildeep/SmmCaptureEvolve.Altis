_type = _this select 1; // use variables: sav_weapons ,sav_magazines ,sav_items ,sav_backpacks 
_classname = _this select 0; 
_return = getText (((_this call smm_fnc_getConfigCategory)>>_classname) >> "displayName");
_return