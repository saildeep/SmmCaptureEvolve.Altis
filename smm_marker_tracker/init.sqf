_obj = _this select 0;
_marker = _this select 1;
if(isServer)then{
	while{false} do {
		
		_marker setMarkerPos (getPos _obj);
		sleep 15;
	};
};