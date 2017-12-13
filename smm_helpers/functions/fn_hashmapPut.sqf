params["_hashmap","_key","_value"];
private _hash = [_key] call smm_fnc_hashString;
_hash = _hash mod (count _hashmap );
(_hashmap select _hash) pushBack [_key,_value]; 