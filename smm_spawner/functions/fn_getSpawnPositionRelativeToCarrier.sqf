/**
	Author: Jonas Körner

	Params:
	-  [x,y,z] Position ASL of the Carrier
	- optional type of eiter "respawn","vehicle","interaction"

	Returns:
	[x,y,z] Position ASL of the spawnpoint
 */

 params["_carrierPosition",["_type","respawn"]];
 private _out = _carrierPosition;
 if(_type == "respawn")then{
	 _out = [(_carrierPosition select 0),(_carrierPosition select 1),(_carrierPosition select 2) +20];
 };
 if(_type=="interaction")then{
	_out = [(_carrierPosition select 0),(_carrierPosition select 1),(_carrierPosition select 2) +20];
 };
  if(_type=="vehicle")then{
	_out = [(_carrierPosition select 0)+5,(_carrierPosition select 1)-90,(_carrierPosition select 2) +20];
 };
 _out