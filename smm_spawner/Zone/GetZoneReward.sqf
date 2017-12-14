params["_object"];
private _size = [_object] call Zone_get_Size;
private _v = (_size * 10) +   ((sqrt _size) * 100);
(ceil _v)