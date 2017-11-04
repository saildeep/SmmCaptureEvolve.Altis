
openCuratorInterface;
	
findDisplay 46 displayAddEventHandler ["KeyDown", {
	if (inputAction "CuratorInterface" > 0) then {
		unassignCurator getAssignedCuratorLogic player;
	};
	false
}];
