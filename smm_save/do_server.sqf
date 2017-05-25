diag_log "Saving....";
"Saving, prepare for lag incoming" call smm_notify;
sleep 10;// wait to let players find cover
_tickets = [
[east] call BIS_fnc_respawnTickets,
[west] call BIS_fnc_respawnTickets,
[independent] call BIS_fnc_respawnTickets,
[civilian] call BIS_fnc_respawnTickets
];
[sav_tickets,_tickets] call smm_set;
[sav_centers,spawnLocs] call smm_set;
[sav_uid,smm_money_all_uid] call smm_set;
{
	[sav_money + _x, _x call smm_fnc_getBalanceServer] call smm_set;
	[_x call smm_fnc_getGearString,_x call smm_fnc_getGearServer] call smm_set;
}forEach smm_money_all_uid;
saveProfileNamespace;
"Saving finished" call smm_notify;
diag_log "Saving finished";