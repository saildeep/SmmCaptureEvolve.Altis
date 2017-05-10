  {
        
        private _faction = _x;
        private _targets = (_faction call smm_get_targets);
        diag_log ("Doing cleanup for faction " + str(_faction) + " with targets " + str(_targets));
        private _newTargets = [];
        {
            if(!(isNil "_x"))then{
                if((_x call getSide) != _faction)then{
                    _newTargets pushBack _x;
                };
            }
        }forEach _targets;
        [_faction,_newTargets] call smm_set_targets;
}forEach smm_spawner_all_factions;
publicVariable "activeTargets";