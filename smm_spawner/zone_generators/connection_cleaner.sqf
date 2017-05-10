_spawnLocs = _this;
{
	_distanceAngle = [_forEachIndex,_spawnLocs] call getDistanceAngleZone;
	
	_numNeighbours = count _distanceAngle;
	_curZoneNum = _forEachIndex;
	diag_log ("Getting distanceAngle array for "+ (str _curZoneNum) + " is " + (str _distanceAngle));
	_maxDist = smm_spawner_connection_cleaner_max_angle;
	
	
	if(count _distanceAngle > 1) then{
		{
			_nextIndex =( (_forEachIndex + 1) % _numNeighbours);
			if(_nextIndex == 0)then{
				while{!((_distanceAngle select _nextIndex)select 3)}do{
					_nextIndex = _nextIndex + 1;
				};
			};
			if(_x select 3)then{
				_nextElement =_distanceAngle select _nextIndex;
				_thisAngle = _x select 1;
				_nextAngle = _nextElement select 1;
				//http://gamedev.stackexchange.com/questions/4467/comparing-angles-and-working-out-the-difference
				_angleToNext = 180 - abs((abs (_nextAngle - _thisAngle)) - 180);
				//just to be sure
				_angleToNext = abs _angleToNext;
				if(_angleToNext <= _maxDist)then{
					if((_x select 0)<(_nextElement select 0))then{
						//next is further away
						[_curZoneNum,_nextElement select 2,_spawnLocs] call removeNeighbour;
						_nextElement set [3,false];
					}else{
						[_curZoneNum,_x select 2,_spawnLocs] call removeNeighbour;
						_x set [3,false];
						
					};
				
				};
			};
		}forEach _distanceAngle;
	};

}forEach _spawnLocs;
_spawnLocs