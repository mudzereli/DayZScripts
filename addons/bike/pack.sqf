player removeAction DZE_ACTION_BIKE_PACK;
player playActionNow "Medic";
r_interrupt = false;
player addWeapon "ItemToolbox";
deletevehicle cursortarget;
_dis=10;
_sfx = "repair";
[player,_sfx,0,false,_dis] call dayz_zombieSpeak;
[player,_dis,true,(getPosATL player)] spawn player_alertZombies;

sleep 6;

taskHint ["You packed your bike back into your toolbox.", [0.600000,0.839215,0.466666,1], "taskDone"];

r_interrupt = false;
player switchMove "";
player playActionNow "stop";