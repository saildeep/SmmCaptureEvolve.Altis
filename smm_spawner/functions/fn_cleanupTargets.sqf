  {
        private _faction = _x;
        private _targets = (_faction call smm_fnc_getTargets);
        diag_log ("Doing cleanup for faction " + str(_faction) + " with targets " + str(_targets));
        private _newTargets = [];
        {
            if(!(isNil "_x"))then{
                if((_x call smm_fnc_getSide) != _faction)then{
                    _newTargets pushBack _x;
                };
            }
        }forEach _targets;
        [_faction,_newTargets] call smm_fnc_setTargets;
}forEach smm_spawner_all_factions;
publicVariable "activeTargets";