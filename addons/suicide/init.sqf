if (isDedicated) exitWith {};
diag_log text "SUICIDE: initializing...";
call compile preprocessFileLineNumbers "addons\suicide\config.sqf";
[] spawn {
    diag_log text "SUICIDE: waiting for login...";
    waitUntil{!isNil "PVDZE_plr_LoginRecord"};
    while {true} do {
        if(!isNull player) then {
            private["_onLadder","_canDo","_gun","_hasWeapon"];
            _onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
            _canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
            _gun = currentWeapon player;
            _hasWeapon = (_gun in DZ_SUICIDE_WEAPON_LIST) && (!DZ_SUICIDE_REQUIRE_BULLET || player ammo _gun > 0);
            if((speed player <= 1) && _hasWeapon && _canDo) then {
                if (S_PLAYER_SUICIDE < 0) then {
                    S_PLAYER_SUICIDE = player addaction["<t color=""#ff4444"">Commit Suicide</t>","addons\suicide\suicide.sqf",_gun,1.5,false,true,"", ""];
                };
            } else {
                player removeAction S_PLAYER_SUICIDE;
                S_PLAYER_SUICIDE = -1;
            };
        };
        sleep 2;
    };
};