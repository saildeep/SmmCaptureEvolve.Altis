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

		// Work around for missing carrier data not being broadcast as expected
		if (count (_carrier getVariable ["bis_carrierParts", []]) == 0) then {
			["Carrier %1 is empty. Client Fixing.",str "bis_carrierParts"] call BIS_fnc_logFormatServer;
			private _carrierPartsArray = (configFile >> "CfgVehicles" >> typeOf _carrier >> "multiStructureParts") call BIS_fnc_getCfgDataArray;
			private _partClasses = _carrierPartsArray apply {_x select 0};
			private _nearbyCarrierParts = nearestObjects [_carrier,_partClasses,500];
			{
				private _carrierPart = _x;
				private _index = _forEachIndex;
				{
					if ((_carrierPart select 0) isEqualTo typeOf _x) exitWith { _carrierPart set [0,_x]; };
				} forEach _nearbyCarrierParts;
				_carrierPartsArray set [_index,_carrierPart];
			} forEach _carrierPartsArray;
			_carrier setVariable ["bis_carrierParts",_nearbyCarrierParts];
			["Carrier %1 was empty. Now contains %2.",str "bis_carrierParts",_carrier getVariable ["bis_carrierParts", []]] call BIS_fnc_logFormatServer;
		};

		// Client Initiate Carrier Actions with slight delay to ensure carrier is sync'd
		[_carrier] spawn { sleep 1; _this call BIS_fnc_Carrier01Init};
		
		diag_log ("Updating carrier position of " + str(_carrier) + " finished");
};

