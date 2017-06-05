if(!hasInterface)exitWith{};
private _targetZones = ((playerSide)call smm_fnc_getTargets);
if(!(isNil "spawner_init_finished"))then{
	{
		//zonemarkers
		private _isVisible = (_x call smm_fnc_getSide) == (playerSide);
		_isVisible = _isVisible || (([_x,playerSide] call smm_fnc_getNeighbour) != -1);
		if(_isVisible)then{
			
			private _isTarget = false;
			private _nb = _x;
			{
				_isTarget = _isTarget || ([_x,_nb] call smm_fnc_zoneEquals);
			}forEach _targetZones;
			
			if(_isTarget)then{
				(_x call smm_fnc_getHash) setMarkerBrushLocal "SolidBorder";
				(_x call smm_fnc_getHash) setMarkerAlphaLocal 1;
			}else{
			(_x call smm_fnc_getHash) setMarkerBrushLocal "GRID";
			(_x call smm_fnc_getHash) setMarkerAlphaLocal 0.3;
			};
		}else{
			(_x call smm_fnc_getHash) setMarkerAlphaLocal 0;
		};
		private _currentZoneNo = _forEachIndex;
		private _nbs = _x call smm_fnc_getNeighbours;
		//connection
		{
			if(_x <  _currentZoneNo)then{
				private _markerName = (_x call smm_fnc_getHash) + "_" +(_currentZoneNo call smm_fnc_getHash);
				if(((_x call smm_fnc_getSide) == (playerSide))|| ((_currentZoneNo call smm_fnc_getSide) == (playerSide)) )then{
						_markerName setMarkerAlphaLocal 1;
				}else{
						_markerName setMarkerAlphaLocal 0;
				};
			};
		}forEach _nbs;	
	}forEach spawnLocs;
};