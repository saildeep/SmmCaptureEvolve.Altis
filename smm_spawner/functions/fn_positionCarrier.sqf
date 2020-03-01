/**
	Author: Jonas Körner

	Params:
	- Carrier
	- Designated position
	- Array of tuples of (pos, type, stringindex) for bis_carrierParts finding
 */
 params["_carrier","_carrierPos","_searchArray"];
 diag_log ("Updating carrier position of " + str(_carrier) + " to " + str(_carrierPos));
 
 [_carrier,_carrierPos,_searchArray] spawn {
	 	params["_carrier","_carrierPos","_searchArray"];
		// Clients wait for carrier
		sleep 5;
		_carrier setVectorDirAndUp [[0,1,0],[0,0,1]];
        _carrier setPosWorld _carrierPos;
		diag_log ("Carrier has variables " + (str (_carrier getVariable ["bis_carrierParts",[]])));
		
		private _restored = _searchArray apply {
			private _nearest = nearestObject [_x select 0, _x select 1];
			private _out = [_nearest,_x select 2];
			_out
		};
		diag_log ("Carrier part list restored to " + str(_restored));
		_carrier setVariable ["bis_carrierParts",_restored];

		[_carrier] spawn { sleep 10; _this call BIS_fnc_Carrier01Init};
		
		diag_log ("Updating carrier position of " + str(_carrier) + " finished");
};

