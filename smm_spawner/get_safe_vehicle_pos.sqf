//FROM: https://forums.bistudio.com/topic/174357-function-to-get-empty-position/

private ["_angle", "_angle0", "_angle1", "_array", "_canBeOnShore", "_centerPosition", "_distance", "_dx", "_dy", "_emptyPosition", "_index", "_maxDistFromCenter", "_maxGradient", "_minDistFromCenter", "_minDistToObjects", "_objectMaxSize", "_position", "_positionNumber", "_positionsNumber", "_positionsNumbers", "_subarray", "_waterMode"];

_array = [];
_emptyPosition = [];

_objectMaxSize = _this select 0;
_centerPosition = _this select 1;
_minDistFromCenter = _this select 2;
_maxDistFromCenter = _this select 3;
_minDistToObjects = _this select 4;
_maxGradient = _this select 5;
_waterMode = _this select 6;
_canBeOnShore = _this select 7;

if (_minDistToObjects < _objectMaxSize / 2) then {_minDistToObjects = _objectMaxSize / 2};

_distance = _minDistFromCenter + _objectMaxSize / 2;
if(_distance == 0)then{
		diag_log ("Warning: _distance is 0, setting it to 0.1");
		_distance = 0.1;
	};
while {_distance <= (_maxDistFromCenter + _objectMaxSize / 2)} do {
	
	private _inner = _objectMaxSize / (2 * _distance);
	_positionsNumber = floor (180 / (asin (_inner)));

	if (_positionsNumber > 1) then {
		_angle0 = floor (random 360);

		_angle1 = 2 * (asin (_objectMaxSize / (2 * _distance)));

		_array set [count _array, [_distance, _angle0, _angle1, _positionsNumber, []]];
	};

	_distance = _distance + _objectMaxSize;
};

while {(count _array) > 0} do {
	_positionNumber = -1;

	_index = floor (random (count _array));

	_subarray = _array select _index;

	_distance = _subarray select 0;
	_angle0 = _subarray select 1;
	_angle1 = _subarray select 2;
	_positionsNumber = _subarray select 3;
	_positionsNumbers = _subarray select 4;

	while {true} do {
		_positionNumber = floor (random _positionsNumber);

		if (!(_positionNumber in _positionsNumbers)) exitWith {};
	};

	_angle = _angle0 + _positionNumber * _angle1;

	_dx = _distance * (sin _angle);
	_dy = _distance * (cos _angle);

	_position = [(_centerPosition select 0) + _dx, (_centerPosition select 1) + _dy, 0];

	if (
		((count (_position isFlatEmpty [_minDistToObjects, 0, _maxGradient, _objectMaxSize, _waterMode, _canBeOnShore, objNull])) > 0)
	and
		{(count (nearestObjects [_position, ["Air", "LandVehicle"], _minDistToObjects])) == 0}
	)
	exitWith {_emptyPosition = _position};

	_positionsNumbers set [count _positionsNumbers, _positionNumber];

	if ((count _positionsNumbers) < _positionsNumber) then {(_array select _index) set [4, _positionsNumbers]} else {_array = [_array, _index] call BIS_fnc_removeIndex};
};

_emptyPosition