if(isDedicated) exitWith {};
diag_log text "SLOW ZOMBIES: reading config...";
call compile preprocessFileLineNumbers "overwrites\slow_zombies\config.sqf";
if(!DZE_SLOW_ZOMBIES) exitWith {};
diag_log text "SLOW ZOMBIES: overwriting wild spawns...";
wild_spawnZombies = compile preprocessFileLineNumbers "overwrites\slow_zombies\wild_spawnZombies.sqf";
diag_log text "SLOW ZOMBIES: overwriting generate...";
zombie_generate = compile preprocessFileLineNumbers "overwrites\slow_zombies\zombie_generate.sqf";