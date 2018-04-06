private _vehicle = _this;
if(_this call smm_fnc_garbageCollectorHasTimeout)then{
	private _timeout = _vehicle getVariable sav_timeout;
	if(_timeout < time)then{
		diag_log(format["Deleting vehicle %1",_vehicle]);
		if(_vehicle getVariable[str_refund_price,0] > 0)then{
			private _refundOwner = _vehicle getVariable str_refund_owner;
			private _refundPrice = (_vehicle getVariable str_refund_price) *( 1 - (damage _vehicle));
			[_refundPrice,_refundOwner] call smm_fnc_addMoney;
			diag_log (format ["Refunding vehicle %1 for owner %2 and price %3",_vehicle,_refundOwner,_refundPrice]);
		};
		deleteVehicle _vehicle;
	};
};