/**
 Draws a marker line between two points
INPUT:[pos1,pos2,duration,color]
OUTPUT: markername
*/

private _pone = _this select 0;
private _ptwo = _this select 1;
private _positionBetween = [((_pone select 0) + (_ptwo select 0))/2,((_pone select 1) + (_ptwo select 1))/2];
private _size = _pone distance _ptwo;
private _dir = _pone getDir _ptwo;
private _marker = [_positionBetween,_this select 2, _this select 3] call smm_fnc_createDebugMarker;
_marker setMarkerSize [10,_size/2];
_marker setMarkerShape "RECTANGLE";
_marker setMarkerDir _dir;
_marker