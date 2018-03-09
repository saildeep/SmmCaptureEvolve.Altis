#define MUTEX_LOCK(varname) waitUntil{(isNil{varname}) and {varname=true;true} };\
if(smm_debug)then{\
diag_log ("Locking mutex " + #varname)\
 ;};
#define MUTEX_UNLOCK(varname) if(isNil{varname})then{\
throw "Trying to unlock not locked mutex ";\
};\
varname=nil;\
if(smm_debug)then{\
diag_log ("Unlocked mutex " + #varname ) ;\
};
#define CACHE(KEY_STRING,VALUE) if(isNil{missionNamespace getVariable KEY_STRING})then{\
missionNamespace setVariable[KEY_STRING,VALUE];\
missionNamespace getVariable KEY_STRING\
}else{\
missionNamespace getVariable KEY_STRING\
}; 