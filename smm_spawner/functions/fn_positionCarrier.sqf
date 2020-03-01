/**
	Author: Jonas Körner

	Params:
	- Carrier
	- Designated position
 */
 params["_carrier","_carrierPos"];
 diag_log ("Updating carrier position of " + str(_carrier) + " to " + str(_carrierPos));
 
 [_carrier,_carrierPos] spawn {
	 	params["_carrier"];
		// Clients wait for carrier
		sleep 5;
		_carrier setVectorDirAndUp [[0,1,0],[0,0,1]];
        _carrier setPosWorld _carrierPos;
		diag_log ("Carrier has variables " + (_carrier getVariable ["bis_carrierParts",[]]));
		
		[_carrier] spawn { sleep 10; _this call BIS_fnc_Carrier01Init};
		
		diag_log ("Updating carrier position of " + str(_carrier) + " finished");
};

