params["_targetAreaCenter","_range"];
private _fallbackCounter = 0;
[[(_targetAreaCenter select 0) + _range,_targetAreaCenter select 1],30,"ColorOrange"] call smm_fnc_createDebugMarker;
[[(_targetAreaCenter select 0) - _range,_targetAreaCenter select 1],30,"ColorOrange"] call smm_fnc_createDebugMarker;
[[_targetAreaCenter select 0,(_targetAreaCenter select 1)+ _range],30,"ColorOrange"] call smm_fnc_createDebugMarker;
[[_targetAreaCenter select 0,(_targetAreaCenter select 1)- _range],30,"ColorOrange"] call smm_fnc_createDebugMarker;
private _posFound = [];

while{(_fallbackCounter < 1000) && ((count _posFound)==0) || {((_targetAreaCenter distance _posFound) > _range )}}do{
	
	private _res = [(_targetAreaCenter select 0) + random[(-1) * _range,0,_range],(_targetAreaCenter select 1)+ random[(-1) * _range,0,_range]  ];
	
		_posFound = [_res, 0,_range * 0.25, 3,0,20,0] call BIS_fnc_findSafePos;
	//if no valid position is found, don't set one
	if((count _posFound)>2)then{
		_posFound = [];
	};
			
	_fallbackCounter = _fallbackCounter+1;
};

if((count _posFound ==0))then{
diag_log("get_Pos_Near fallback is triggerd");
_posFound =[_targetAreaCenter select 0 ,_targetAreaCenter select 1, 1000] ;
}else{
/*
//version 1
_posFound set [2,0];
*/
};
assert((count _posFound)>1);
_posFound