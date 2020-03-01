/**
	Author: Jonas Körner

	Params:
	- Carrier
	- Designated position
 */
 params["_carrier","_carrierPos"];
 diag_log ("Updating carrier position of " + str(_carrier) + " to " + str(_carrierPos));
 
 [_carrier] spawn {
	 	params["_carrier"];
		// Clients wait for carrier
		sleep 5;

		// Client Initiate Carrier Actions with slight delay to ensure carrier is sync'd
//		[_carrier] spawn { sleep 1; _this call BIS_fnc_Carrier01Init};
		
		diag_log ("Updating carrier position of " + str(_carrier) + " finished");
};

