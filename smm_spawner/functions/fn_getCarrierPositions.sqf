/**
	Author: Jonas Körner

	0: center (Position2D|Position3D)
	1: Minimum Radius (Scalar > 0)
	2: Maximum Radius (Scalar > 0)
	3: (Optional) Blacklist according to BIS_fnc_findSafePos
	Returns:
	Array of [x,y,z] positions, may be []
 */

 params["_center","_rmin","_rmax",["_blacklist",[]]];

 private _pos = [_center, _rmin, _rmax,50,2,100,0,[]] call BIS_fnc_findSafePos;
if((count _pos) == 2)then{
	private _h =  0;

	[[_pos select 0,_pos select 1,_h]]
}else{
	[]
}