_canBuy = smm_ticket_price call smm_buy;
if(_canBuy)then{
	[playerSide,smm_ticket_amount] call BIS_fnc_respawnTickets;
};