params["_object"];
private _size = [_object] call Zone_get_Size;
private _v = (_size * 2) +  ((sqrt _size) * 10);
(ceil _v)