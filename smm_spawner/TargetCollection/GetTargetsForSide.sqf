params['_object','_side'];
private _sides = [_object] call TargetCollection_fnc_GetSides;
assert (_side in _sides);
private _sideid = _sides find _side;
private _targets = [_object] call TargetCollection_fnc_GetAllTargets;
(_targets select _sideid)