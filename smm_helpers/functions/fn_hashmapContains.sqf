params["_hashmap","_key"];
"DONOTINJECT";
private _hash = ([_key] call smm_fnc_hashString) mod (count _hashmap);
private _bucket = _hashmap select _hash;
private _out = false;
{
	if((_x select 0) == _key)then{
		_out = true;
	}
}forEach _bucket;
_out