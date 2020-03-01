/**
	Author: Jonas Körner

	Params:
	-  [x,y,z] Position ASL of the Carrier

	Returns:
	[x,y,z] Position ASL of the spawnpoint
 */

 params["_carrierPosition"];
 [(_carrierPosition select 0),(_carrierPosition select 1),(_carrierPosition select 2) +20]