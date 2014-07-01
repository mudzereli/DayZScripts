private["_canDo","_onLadder","_hasToolBox"];
_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);
if (_canDo && !DZE_BIKE_DEPLOYING) then {
    DZE_BIKE_DEPLOYING = true;

    player removeWeapon "ItemToolbox";
    
    player playActionNow "Medic";
    r_interrupt = false;

    _dis=10;
    _sfx = "repair";
    [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
    [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
 
    sleep 6;
 
    _object = "MMT_Civ" createVehicle (position player);
    _object setVariable ["ObjectID", "1", true];
    _object setVariable ["ObjectUID", "1", true];
    player reveal _object;
 
    taskHint ["You've built a bike!", [0.600000,0.839215,0.466666,1], "taskDone"];
 
    r_interrupt = false;
    player switchMove "";
    player playActionNow "stop";

    sleep 10;
 
    cutText ["Warning: Spawned bikes DO NOT SAVE after server restart!", "PLAIN DOWN"];
    
    DZE_BIKE_DEPLOYING = false;
} else {
    taskHint ["You can't build a bike right now!", [0.972549,0.121568,0,1], "taskFailed"];
};