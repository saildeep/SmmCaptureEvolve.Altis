#define MUTEX_LOCK(varname) waitUntil{(isNil{varname}) and {varname=true;true} };if(smm_debug)then{diag_log "Locking mutex varname";};
#define MUTEX_UNLOCK(varname) if(isNil{varname})then{throw "Trying to unlock not locked mutex "};varname=nil;if(smm_debug)then{diag_log "Unlocked mutex varname";};