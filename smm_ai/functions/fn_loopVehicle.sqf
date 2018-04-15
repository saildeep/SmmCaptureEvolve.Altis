#include "constants.hpp"
params["_vehicle","_allZoneGroups","_VehicleCrew","_zoneid"];

///////Simple Patrol script vE 1.8 - SPUn / LostVar
private ["_newCenter","_unit","_newPos","_center","_pos","_crew","_run","_pDir","_pRange","_dir","_radius"];

_unit = _vehicle;
_center = _vehicle getVariable KEY_ZONECENTER;
_radius = [25,_vehicle getVariable KEY_ZONERADIUS];
diag_log("--INIT APROACHE--");
if(isNil("_center"))then{_center = (getPos _unit);}else{_center = _center;};

_newPos = getPos _unit;
_crew = _VehicleCrew;
_run = true;

while{_run}do{
	if(typeName _center == "ARRAY")then{
		_newCenter = _center;
	}else{
		if(_center in allMapMarkers)then{
			_newCenter = getMarkerPos _center;
		}else{
			_newCenter = getPos _center;
		};
	};

	_pDir = random 360;
    _pRange = (_radius select 0) + (random (_radius select 1));
    _newPos = [(_newCenter select 0) + (sin _pDir) * _pRange, (_newCenter select 1) + (cos _pDir) * _pRange, 0];
   
	if(surfaceIsWater _newPos)then{
			private["_randomWay","_dir"];
			_dir = ((_newCenter select 0) - (_newPos select 0)) atan2 ((_newCenter select 1) - (_newPos select 1));
			_randomWay = floor(random 2); 
			while{surfaceIsWater _newPos}do{
				if(_randomWay == 0)then{_dir = _dir + 20;}else{_dir = _dir - 20;};
				if(_dir < 0) then {_dir = _dir + 360;}; 
				_newPos = [(_newCenter select 0) + (sin _dir) * _pRange, (_newCenter select 1) + (cos _dir) * _pRange, 0];
			};
	};
	
    _pos = _newPos;
		
    {
        _x doMove _newPos;
        _x setBehaviour "SAFE";
        _x limitSpeed 1;
    } foreach _crew;
	
	_vehicle limitSpeed 15;
	diag_log(format["--FIRST APROACHE-- %1",count _crew]);
	if({alive _x} count _crew == 0)exitWith{_run = false};
    waitUntil {
			// share information about enemy 
			// TODO: cleanup _entity Array.  maybe performance problem / _entity array very large
			private _allZoneUnits = [[call ZoneStatesManager_GetInstance,_zoneid] call ZoneStatesManager_fnc_GetZoneState] call ZoneState_get_Units;
			{
				private _vehicleunit = _x;
				{
					private _entity = _x;		
					private _unitKnowsAboutLevel = (_vehicleunit knowsAbout (_entity select 4));	
					if( (_entity select 3)>0 && _unitKnowsAboutLevel >0.5)then{
						{
							_x reveal [(_entity select 4), _unitKnowsAboutLevel];
							//diag_log(format["Unit %1 - %2 reveal %3 to %4",name _unit,_unit,_entity select 4 ,_x]);
						}forEach (_allZoneUnits);
					};
				} forEach (_vehicleunit nearTargets 500);
			} forEach (_crew);
			diag_log("--QUICK APROACHE--");
			(unitReady _unit)||(_unit distance _pos)<30
			};
	diag_log("--SECOND APROACHE--");
	sleep 5;
	if(! (_vehicle isKindOf "Car"))then{
		sleep + random(60);
	};
	//_break = _unit getVariable "breakPatrol";
	//if(!isNil("_break"))exitWith{};
    //sleep 5 + (random 10);
};