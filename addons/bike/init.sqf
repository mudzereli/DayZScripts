if (isServer) exitWith {};
[] spawn {
    diag_log text "BIKE: waiting for login...";
    waitUntil{!isNil "PVDZE_plr_LoginRecord"};
    while {true} do {
        if(!isNull player) then {
            private["_weapons","_isBike","_canDo","_onLadder","_hasBikeItem"];
            _onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
            _canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
            _weapons = [currentWeapon player] + (weapons player) + (magazines player);
            _hasBikeItem = ("ItemToolbox" in _weapons);
            _isBike = typeOf cursorTarget in ["Old_bike_TK_INS_EP1","Old_bike_TK_CIV_EP1","MMT_Civ"];

            //BIKE DEPLOY
            if((speed player <= 1) && _hasBikeItem && _canDo) then {
                if (s_player_deploybike < 0) then {
                    s_player_deploybike = player addaction[("<t color=""#33b5e5"">" + ("Deploy Bike") +"</t>"),"deploys\bike\deploy.sqf","",5,false,true,"", ""];
                };
            } else {
                player removeAction s_player_deploybike;
                s_player_deploybike = -1;
            };
             
            //PACK BIKE
            if((_isBike) and _canDo) then {
            if (s_player_deploybike2 < 0) then {
                    s_player_deploybike2 = player addaction[("<t color=""#33b5e5"">" + ("Re-Pack Bike") +"</t>"),"deploys\bike\pack.sqf","",5,false,true,"", ""];
                };
            } else {
                player removeAction s_player_deploybike2;
                s_player_deploybike2 = -1;
            };
        };
        sleep 2;
    };
};