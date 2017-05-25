private ["_price","_out"];
private _price = _this;
private _out = false;
private _uid = getPlayerUID player;
if(_price <= (call smm_fnc_getBalance)) then {
	_out = true;
	[_price,_uid] remoteExec ["smm_fnc_buyServer",2,false]; 
};
_out