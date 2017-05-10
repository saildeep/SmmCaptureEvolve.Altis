private _range = _this select 1;
private _targetAreaCenter = _this select 0;
[[(_targetAreaCenter select 0) + _range,_targetAreaCenter select 1],30,"ColorOrange"] call smm_fnc_createDebugMarker;
[[(_targetAreaCenter select 0) - _range,_targetAreaCenter select 1],30,"ColorOrange"] call smm_fnc_createDebugMarker;
[[_targetAreaCenter select 0,(_targetAreaCenter select 1)+ _range],30,"ColorOrange"] call smm_fnc_createDebugMarker;
[[_targetAreaCenter select 0,(_targetAreaCenter select 1)- _range],30,"ColorOrange"] call smm_fnc_createDebugMarker;
_posFound = [];

//private _options = "(1 - trees) * (1 - forest) * (1 - sea) * (meadow)";

while{((count _posFound)==0) || {((_targetAreaCenter distance _posFound) > _range)}}do{
	
	private _res = [(_targetAreaCenter select 0) + random[(-1) * _range,0,_range],(_targetAreaCenter select 1)+ random[(-1) * _range,0,_range]  ];
	// TODO check if pos is null what will be returned
	// https://community.bistudio.com/wiki/BIS_fnc_findSafePos
		_posFound = [_res, 0,_range * 0.25, 0.5,0] call BIS_fnc_findSafePos;
	//if no valid position is found, don't set one
	if((count _posFound)>2)then{
		_posFound = [];
	};
	
	//_result = selectBestPlaces [_res, _range * 0.25, _options, (_range / 10) min 500, 100]; 
	//_posFound = _result select 0 select 0;
	if((count _posFound) != 0)then{
		private _posHeight			= getTerrainHeightASL _posFound ;
		private _posElevated		= [_posFound select 0, _posFound select 1, _posHeight + 0.01];
		private _posElevatedMore 	= [_posFound select 0, _posFound select 1, _posHeight + 100.0];
		if (lineIntersects[_posElevated,_posElevatedMore])then{
			[_posFound,30,"ColorPink"] call smm_fnc_createDebugMarker;
			_posFound=[];
			
		};
	};
};



if((count _posFound < 3))then{
_posFound = _posFound select [0,2];
};
assert((count _posFound)>1);
_posFound