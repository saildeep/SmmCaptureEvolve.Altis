/**
Generates a huge number of possible zone candidates
Those are return as an array of type [position,name,size,importance]
The importance value may be used by further steps

*/

diag_log "Starting searching for zone candidates";

private _minSize = smm_spawner_min_zone_size;         
private _maxSize = smm_spawner_max_zone_size;
private _diffSize = _maxSize - _minSize;



private _out = [];

//probability to inspect each item
private _inspectProb = if(smm_debug)then{0.3}else{0.9};
#define KEEP ((random 1) < _inspectProb)

/**
First get all road intersections on the map
*/

private _allRoads = [0,0,0] nearRoads 100000000;
//only 20% of T-Intersections are added as candidates, because there are so many
private _tIntersectionChance = 0.2;
diag_log ("Found " + str (count _allRoads) + " roads");
private _roadCandidates = [];
{
	if(KEEP)then{
		private _neighbourCount = count (roadsConnectedTo _x);
		if(_neighbourCount > 2)then{
			//road is intersections
			if(_neighbourCount == 3)then{
				if((random 1) < _tIntersectionChance)then{
					[getPos _x,30,"ColorRed"] call smm_fnc_createDebugMarker;
					private _candidate = [getPos _x,"Intersection at " + (str (getPos _x)),_minSize,1];
					_roadCandidates pushBack _candidate;
				};
			}else{
				[getPos _x,30,"ColorOrange"] call smm_fnc_createDebugMarker;
				private _candidate = [getPos _x,"Intersection at " + (str (getPos _x)),random[_minSize,_minSize + 0.1* _diffSize,_maxSize],3];
				_roadCandidates pushBack _candidate;
			};
			
		};
	};
}forEach _allRoads;
_roadCandidates = _roadCandidates call BIS_fnc_arrayShuffle;
_out append (_roadCandidates select [0,100]); // only select up 100 intersections


/**
Now get all locations
*/ 

private _locationTypesWithImportance = [["NameCity",0.25],["NameCityCapital",0.5],["NameVillage",0.15],["NameLocal",0.7],["Airport",3.0]];
{
	private _locationType = _x select 0;
	private _locationImportance = _x select 1;
	private _locations = nearestLocations [[0,0,0], [_locationType],1000000000000];
	{
		if(KEEP)then{
			private _candidate = [getPos _x,text _x,random[_minSize,_minSize + _diffSize * _locationImportance,_minSize + _diffSize],_locationImportance * 35];
			_out pushBack _candidate;
			private _marker = [getPos _x,30,"ColorGreen"] call smm_fnc_createDebugMarker;
			_marker setMarkerText (_locationType);
		};
	}forEach _locations;
	
}forEach _locationTypesWithImportance;

/**
Now get all hills, that are bigger than those nearby
*/

private _nearbyHillRange = 2000;
private _allHills = nearestLocations [[0,0,0],["Mount"],1000000000000];
_allHills = _allHills select {(random 1) < 0.03};
while{(count _allHills) > 0}do{
	private _hillToCheck = _allHills deleteAt 0;
	private _hillToCheckHeight = getTerrainHeightASL (getPos _hillToCheck);
	private _otherHills = _allHills;
	private _isHighest = true;
	private _hillsToRemove = [];
	{
		
		if(((getPos _x) distance (getPos _hillToCheck)) < _nearbyHillRange)then{
			private _otherHillHeight = getTerrainHeightASL (getPos _x);
			if(_otherHillHeight > _hillToCheckHeight)then{
				_isHighest = false;
			}else{
				_hillsToRemove pushBack _x;
			};
		};
	}forEach _otherHills;
	if(_isHighest)then{
		private _candidate = [getPos _hillToCheck,text _hillToCheck,_minSize + (random (_diffSize *0.3)),4];
		private _marker = [getPos _hillToCheck,30,"ColorPink"] call smm_fnc_createDebugMarker;
		_marker setMarkerText "Mount";
		_out pushBack _candidate;
	};
	_allHills = _allHills - _hillsToRemove;
	diag_log ("Processing Hills, " + (str (count _allHills)) + " candidates left");
	
};





/**
Try to snap zones to streets now or check if the spot is safe for the tent to spawn, if not discard the zone
*/

private _cleanedOut = [];
{
	private _pos = _x select 0;
	private _nearRoads = _pos nearRoads 25;
	if(count _nearRoads > 0)then{
		_pos = getPos (_nearRoads select 0);
		_cleanedOut pushBack [_pos,_x select 1,_x select 2, _x select 3];
	}else{
		private _isWater 			= surfaceIsWater _pos;
		private _posHeight			= getTerrainHeightASL _pos;
		private _posElevated		= [_pos select 0, _pos select 1, _posHeight + 0.01];
		private _posElevatedMore 	= [_pos select 0, _pos select 1, _posHeight + 100.0];
		if (!lineIntersects[_posElevated,_posElevatedMore] && !_isWater)then{
			//visibility to up is clear and is not in water
			_cleanedOut pushBack [_pos,_x select 1,_x select 2, _x select 3];
		};
	};
}forEach _out;

{
	private _marker = [_x select 0,30,"ColorBlue"] call smm_fnc_createDebugMarker;
	_marker setMarkerText ("I:" + (str (_x select 3)) + "_S:" + (str (_x select 2)));
}forEach _cleanedOut;
diag_log "Finished searching zone candidates";
diag_log ("Found " + (str (count _cleanedOut)));
_cleanedOut