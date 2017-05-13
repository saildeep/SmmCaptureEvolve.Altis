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


/**
First get all road intersections on the map
*/

private _allRoads = [0,0,0] nearRoads 100000000;
//only 20% of T-Intersections are added as candidates, because there are so many
private _tIntersectionChance = 0.2;
diag_log ("Found " + str (count _allRoads) + " roads");
{
	private _neighbourCount = count (roadsConnectedTo _x);
	if(_neighbourCount > 2)then{
		//road is intersections
		if(_neighbourCount == 3)then{
			if((random 1) < _tIntersectionChance)then{
				[getPos _x,30,"ColorRed"] call smm_fnc_createDebugMarker;
				private _candidate = [getPos _x,"Intersection at " + (str (getPos _x)),_minSize,1];
				_out pushBack _candidate;
			};
		}else{
			[getPos _x,30,"ColorOrange"] call smm_fnc_createDebugMarker;
			private _candidate = [getPos _x,"Intersection at " + (str (getPos _x)),_minSize + 0.3* _diffSize,3];
		};
		
	};
}forEach _allRoads;


/**
Now get all locations
*/ 

private _locationMaxImportance = 70;
private _locationTypesWithImportance = [["NameCity",20],["NameCityCapital",35],["NameVillage",15],["NameLocal",60],["Airport",70]];
{
	private _locationType = _x select 0;
	private _locationImportance = _x select 1;
	private _locations = nearestLocations [[0,0,0], [_locationType],1000000000000];
	{
		private _candidate = [getPos _x,text _x,_minSize + (_locationImportance / _locationMaxImportance) * _diffSize,_locationImportance];
		_out pushBack _candidate;
		private _marker = [getPos _x,30,"ColorGreen"] call smm_fnc_createDebugMarker;
		_marker setMarkerText (_locationType);
	}forEach _locations;
	
}forEach _locationTypesWithImportance;

/**
Now get all hills, that are bigger than those nearby
*/

private _nearbyHillRange = 1000;
private _allHills = nearestLocations [[0,0,0],["Mount"],1000000000000];
{
	private _hillToCheckHeight = getTerrainHeightASL (getPos _x);
	private _otherHills = nearestLocations[getPos _x,["Mount"],_nearbyHillRange] - [_x];
	private _isCandidate = true;
	{
		private _otherHillHeight = getTerrainHeightASL (getPos _x);
		if(_otherHillHeight > _hillToCheckHeight)then{
			_isCandidate = false;
		};
	}forEach _otherHills;
	if(_isCandidate)then{
		private _candidate = [getPos _x,text _x,_minSize + (random (_diffSize *0.3)),4];
		private _marker = [getPos _x,30,"ColorPink"] call smm_fnc_createDebugMarker;
		_marker setMarkerText "Mount";
		_out pushBack _candidate;
	};
}forEach _allHills;




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
		private _posHeight			= getTerrainHeightASL _pos;
		private _posElevated		= [_pos select 0, _pos select 1, _posHeight + 0.01];
		private _posElevatedMore 	= [_pos select 0, _pos select 1, _posHeight + 100.0];
		if (!lineIntersects[_posElevated,_posElevatedMore])then{
			//visibility to up is clear
			_cleanedOut pushBack [_pos,_x select 1,_x select 2, _x select 3];
		};
	};
}forEach _out;

{
	private _marker = [_x select 0,300,"ColorBlue"] call smm_fnc_createDebugMarker;
	_marker setMarkerText ("I:" + (str (_x select 3)) + "_S:" + (str (_x select 2)));
}forEach _cleanedOut;
diag_log "Finished searching zone candidates";
diag_log ("Found " + (str (count _cleanedOut)));
_cleanedOut