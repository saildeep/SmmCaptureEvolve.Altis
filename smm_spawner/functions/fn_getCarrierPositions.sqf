/**
	Author: Jonas Körner

	0: center (Position2D|Position3D)
	1: Minimum Radius (Scalar > 0)
	2: Maximum Radius (Scalar > 0)

	Returns:
	Array of [x,y] positions, may be []
 */

 params["_center","_rmin","_rmax"];

 private _pos = [_center, _rmin, _rmax,50,2,1,0,[]] call BIS_fnc_findSafePos;
if((count _pos) == 2)then{
	[_pos]
}else{
	[]
}