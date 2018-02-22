#include "..\constants.hpp"
params["_tent","_player","_actionid","_zoneid"];
vote_map_click_eh = addMissionEventHandler ["MapSingleClick",{
	params["_selectedUnits","_position","_altPressed","_shiftPressed"];
	removeMissionEventHandler["MapSingleClick",vote_map_click_eh];
	openMap [false,false];
	if(!_altPressed)then{
		
		player setVariable[VOTE_POSITION_KEY,_position,true];
		if(getMarkerColor VOTE_MARKER_NAME == "")then{
			createMarkerLocal [VOTE_MARKER_NAME,_position];
		};
		VOTE_MARKER_NAME setMarkerPosLocal _position;
		VOTE_MARKER_NAME setMarkerShapeLocal "ICON";
		VOTE_MARKER_NAME setMarkerTypeLocal "hd_flag";
		VOTE_MARKER_NAME setMarkerColorLocal (playerSide call getColor);

	}else{
		player setVariable[VOTE_POSITION_KEY,VOTE_POSITION_UNSET,true];
		if(getMarkerColor VOTE_MARKER_NAME != "")then{
			deleteMarkerLocal VOTE_MARKER_NAME;
		};
	};
}];
openMap [true,true];
hint str_vote_target_hint;
