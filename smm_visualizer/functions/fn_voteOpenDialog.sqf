#include "..\constants.hpp"
params["_tent","_player","_actionid","_zoneid"];
vote_map_click_eh = addMissionEventHandler ["MapSingleClick",{
	params["_selectedUnits","_position","_altPressed","_shiftPressed"];
	removeMissionEventHandler["MapSingleClick",vote_map_click_eh];
	openMap [false,false];
	if(!_altPressed)then{
		player setVariable[VOTE_POSITION_KEY,_position,true];
	}else{
		player setVariable[VOTE_POSITION_KEY,VOTE_POSITION_UNSET,true];
	};
}];
openMap [true,true];
hint str_vote_target_hint;
