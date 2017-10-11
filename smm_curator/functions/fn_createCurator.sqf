
_object = _this select 0;
_position = _this select 1;
_radius = _this select 2;

curatorGroup = createGroup sideLogic;
_curator = curatorGroup createunit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
_curator setvariable ["owner", "dummy"];
unassignCurator _curator;
removeAllCuratorAddons _curator;
_curator addCuratorEditingArea [0, _position , 0]; //hack to disable editing of units
_curator addCuratorCameraArea [0, _position, _radius];
_curator setCuratorCameraAreaCeiling smm_curator_cameraCeiling;
[_curator, "object", ["UnitPos"]] call BIS_fnc_setCuratorAttributes;
_curator addCuratorPoints -1;
_curator setCuratorWaypointCost 0;
_curator setCuratorCoef ["Place", -1];
_curator setCuratorCoef ["Edit", -1];
_curator setCuratorCoef ["Delete", -1];
_curator setCuratorCoef ["Destroy", -1];
_curator setCuratorCoef ["Group", 0];
_curator setCuratorCoef ["Synchronize", -1];

_curator setVariable ["radius", _radius];
_curator setVariable ["position", _position];

_activateCurator = {
	_caller = _this select 1;
	_curator = _this select 3;
	
	unassignCurator _curator;
	_caller assignCurator _curator;
	openCuratorInterface;
	
	findDisplay 46 displayAddEventHandler ["KeyDown", {
		if (inputAction "CuratorInterface" > 0) then {
			unassignCurator getAssignedCuratorLogic player;
		};
		false
	}];
};

_activateCuratorAction = _object addAction ["Take command", _activateCurator, _curator];
_onWaypointEditedHandler = _curator addEventHandler ["CuratorWaypointEdited", {_this call smm_fnc_checkWaypoint}];
_onWaypointPlacedHandler = _curator addEventHandler ["CuratorWaypointPlaced", {_this call smm_fnc_checkWaypoint}];

_curator
