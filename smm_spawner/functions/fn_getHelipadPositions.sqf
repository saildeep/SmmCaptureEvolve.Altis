/**
	Author: Jonas Körner

	Params:
	0: center (Position2D|Position3D)
	1: Minimum Radius (Scalar > 0)
	2: Maximum Radius (Scalar > 0)
	3: Maximumum number of iterations (Scalar optional)
	4: Maximumum number of helipads to get (Scalar optional)
	5: Minimum number between helipads (Scalar optional)

	Returns:
	Array of [x,y] positions where enough space for placing a helipad is, may be []
*/

params["_center","_rmin","_rmax",["_maxIterations",8],["_maxHelipads",10],["_clearDistance",15]];
assert (_rmax > _rmin);

private _iterationCount = 0;
private _foundPositions = [];
private _gradient = 0.05;
private _maxGradient = 0.7;
private _blacklist = [];
while { (_iterationCount < _maxIterations) and ((count _foundPositions)<_maxHelipads) } do {
	_iterationCount = _iterationCount + 1;

	private _safepos =  [_center,_rmin,_rmax,_clearDistance,0,_gradient,0,_blacklist] call BIS_fnc_findSafePos;
	if( (count _safepos) == 2 )then{
	
			_iterationCount = _iterationCount - 1;
			_foundPositions pushBack _safepos;
			_blacklist pushBack [_safepos,_clearDistance];
			[_safepos,60,"ColorGrey"] call smm_fnc_createDebugMarker;
		

	}else{
		// if no position is found increase allowed gradient
		_gradient = _maxGradient min (_gradient * 2);
	};
};
diag_log ("Found " + (str (count _foundPositions))+ " helipad positions");
_foundPositions