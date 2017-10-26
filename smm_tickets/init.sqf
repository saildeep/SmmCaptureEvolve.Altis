//sets the initial respawn tickets
if(isServer)then{
	if(smm_load)then{
		
		smm_start_tickets = sav_tickets call smm_fnc_get;
		diag_log "Loading ticket state";
	}else{
		diag_log "Not loading ticket state";
	};
	{
		_sideno = _x call smm_fnc_macrosToConfigSide;
		_tickets = smm_start_tickets select _sideno;
		diag_log (format ["Setting %1 tickets for %2 with no %3",_tickets,_x,_sideno]);
		[_x,_tickets] call BIS_fnc_respawnTickets;
	}forEach smm_spawner_all_factions;
};
[] spawn{
    
    {
		private _ip = [_x] call ZoneState_get_InteractionPoint;
		_formated = format [str_buy_tickets,smm_ticket_amount,smm_ticket_price];
        _ip addAction [_formated,smm_fnc_buyTickets,_this];
    }forEach ([call ZoneStatesManager_GetInstance] call ZoneStatesManager_get_ZoneStates);


};