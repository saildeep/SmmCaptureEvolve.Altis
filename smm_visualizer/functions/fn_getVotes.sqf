/**
Get the votes in [0,0,1,2,...] format for a list of zone objects and a given side
*/
params["_zones","_side"];
#include "..\constants.hpp"
//initialize with zero votes
private _out = [];{_out pushBack 0;} forEach _zones;

{
	//only care about players on the requested side
	if((side _x) == _side)then{
		private _votedPosition = _x getVariable [VOTE_POSITION_KEY,VOTE_POSITION_UNSET];
		//only continue of vote is set
		if((count _votedPosition) > 1)then{
			private _argmin = -1;
			private _distmin = 100000000;
			{
				private _zonePosition =  [_x] call Zone_get_Position;
				private _dist = _zonePosition distance _votedPosition;
				if(_dist<_distmin)then{
					_argmin = _forEachIndex;
					_distmin = _dist;
				};

			}forEach _zones;
			if((count _zones) > 0)then{
				_out set [_argmin,(_out select _argmin) + 1];
			};
		};
	};
}forEach allPlayers;
_out