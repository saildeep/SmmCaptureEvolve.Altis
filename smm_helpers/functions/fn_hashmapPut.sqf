params["_hashmap","_key","_value"];
assert (_hashmap isEqualType []);
assert (_key isEqualType "STRING");
assert (_key isEqualTypeAny ["STRING",31337]);
private _hash = [_key] call smm_fnc_hashString;
_hash = _hash mod (count _hashmap );
private _bucket = (_hashmap select _hash);
_bucket pushBack [_key,_value]; 
_hashmap set[_hash,_bucket];