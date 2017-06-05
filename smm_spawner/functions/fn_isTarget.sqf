private _out = false;
private _zoneNo = _this select 0;
private _side = _this select 1;
assert(typeName _zoneNo == "SCALAR");
assert (typeName _side =="SIDE");
{
	if(_x == _side)then{
	 _out = _out || (_zoneNo in (activeTargets select _forEachIndex));
	};
   
}forEach smm_spawner_all_factions;
_out