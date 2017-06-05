private ["_no","_side","_zone","_hash"];
_no = _this select 0;
_side = _this select 1;
_zone = spawnLocs select _no;
_zone set [3,_side];
_hash = _zone select 1;
_hash setMarkerColor (_side call getColor);
private _markerName = "respawn_" + (_side call smm_fnc_getSideName) + "_" + (_zone select 1);
{
	//delete respawn markers from other teams
	private _mn = "respawn_" + (_x call smm_fnc_getSideName) + "_" + (_zone select 1);
	if (getMarkerColor _mn == "") then {
		deleteMarker _mn;
	};
}forEach smm_spawner_all_factions;
if(_side in smm_spawner_player_factions)then{
	private _marker = createMarker [_markerName,_zone select 0 ];
}else{
	deleteMarker _markerName;
};
[] call smm_fnc_spawnerUpdateTargets;
[] remoteExec ["smm_fnc_spawnerUpdateMarkerAlpha",0,false];

//send only to all
publicVariable "spawnLocs";