if((typeName _this)  == "ARRAY")then{
	_text = _this select 0;
	hint _text;
}else{
	[_this] remoteExec ["smm_notify",0];
};