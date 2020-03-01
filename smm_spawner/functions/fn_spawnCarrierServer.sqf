/**
	Author:Jonas Körner
	
	Params:
	- Position to spawn at in x,y,z asl
 */

params["_carrierPos"];
private _carrier = "Land_Carrier_01_base_F" createVehicle _carrierPos;
        
        
_carrier setPosWorld _carrierPos;
_carrier setVectorDirAndUp [[0,1,0],[0,0,1]];

[_carrier] call BIS_fnc_Carrier01PosUpdate;
private _magicVariable =  (_carrier getVariable ["bis_carrierParts",[]]); // should be array of tuples of (object ,fancy string)
private _transferableSearchArray =  _magicVariable apply {[getPos (_x select 0), typeOf (_x select 0), _x select 1]};  // make to array of position, type, strange index

diag_log ("Spawned carrier " + (str _carrier) + " at " + (str _carrierPos) + " with magic BI variable of " + (str _magicVariable));
[_carrier,_carrierPos,_transferableSearchArray] remoteExec ["smm_fnc_positionCarrier",-clientOwner ,true];
        