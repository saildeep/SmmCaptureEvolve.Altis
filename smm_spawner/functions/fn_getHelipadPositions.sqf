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

params["_center","_rmin","_rmax",["_maxIterations",50],["_maxHelipads",50],["_clearDistance",30]];
assert (_rmax > _rmin);

private _iterationCount = 0;
private _foundPositions = [];
private _gradient = 0.1;
while { (_iterationCount < _maxIterations) and ((count _foundPositions)<_maxHelipads) } do {
	_iterationCount = _iterationCount + 1;
	private _safepos =  [_center,_rmin,_rmax,_clearDistance,0,_gradient,0] call BIS_fnc_findSafePos;
	if( (count _safepos) == 2 )then{
		//in case the position is valid
		//check against all other found positions
		private _isClear = true;
		{
			if( (_safepos distance _x)<(_clearDistance * 2) ) then{
				_isClear = false;
			};
		}forEach _foundPositions;
		if(_isClear)then{
			_iterationCount = _iterationCount - 1;
			_foundPositions pushBack _safepos;
			[_safepos,60,"ColorGrey"] call smm_fnc_createDebugMarker;
		};

	}else{
		// if no position is found increase allowed gradient
		_gradient = 1 min (_gradient + 0.05);
	};
};
_foundPositions