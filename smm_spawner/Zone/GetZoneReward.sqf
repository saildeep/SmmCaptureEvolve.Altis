params["_object"];
private _size = [_object] call Zone_get_Size;
private _v = (_size * 25) +   ((sqrt _size) * 100);
(ceil _v)