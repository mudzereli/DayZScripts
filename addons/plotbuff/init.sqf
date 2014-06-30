if(isServer) exitWith {};
diag_log text "PLOTBUFF: loading config...";
call compile preprocessFileLineNumbers "addons\plotbuff\config.sqf";
diag_log text "PLOTBUFF: spawning thread...";
[] spawn {
    diag_log text "PLOTBUFF: waiting for player reference";
    waitUntil {!(isNil player)};
    diag_log text "PLOTBUFF: launching main removal loop";
    while {!(isNil player)} do {
        private["_removedZombies"];
        _removedZombies = 0;
        {
            private["_plot"];
            _plot = _x;
            {
                {
                    _removedZombies = _removedZombies + 1;
                    deleteVehicle _x;
                } forEach (_plot nearEntities [_x,DZE_PLOTBUFF_REMOVE_ZOMBIE_RADIUS]);
            } forEach ["zZombie_Base","z_hunter","z_priest","z_suit1","z_suit2","z_suit3","z_worker"];
        } forEach ((position player) nearObjects["Plastic_Pole_EP1_DZ",DZE_PLOTBUFF_PLAYER_DISTANCE_CHECK]);
        if (_removedZombies > 0) then {
            diag_log text format["PLOTBUFF: removed %1 zombies near plot poles",_removedZombies];
        };
        sleep 5;
    };
};