#define LOCK(varname) waitUntil{(isNil{varname}) and {varname=true;true} };
#define UNLOCK(varname) if(isNil{varname})then{throw "Trying to unlock not locked mutex "};varname=nil;