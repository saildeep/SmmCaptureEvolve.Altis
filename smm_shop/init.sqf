[] spawn{
    waitUntil{! (isNil "interaction_points")};
    {
        _x addAction [str_shop,smm_shop_open,_forEachIndex];
    }forEach interaction_points;
};
[ missionNamespace, "arsenalOpened", {
    disableSerialization;
    _display = _this select 0;
    {
        ( _display displayCtrl _x ) ctrlSetText "Disabled";
        ( _display displayCtrl _x ) ctrlSetTextColor [ 1, 0, 0, 0.5 ];
        ( _display displayCtrl _x ) ctrlRemoveAllEventHandlers "buttonclick";
    }forEach [ 44146, 44147 ];
} ] call BIS_fnc_addScriptedEventHandler;