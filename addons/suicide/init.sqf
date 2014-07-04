call compile preprocessFileLineNumbers "addons\suicide\config.sqf";
// only run if enabled or server
if (isServer || !DZE_SUICIDE_ADDON_ENABLE) exitWith {};
diag_log text "SUICIDE: initializing...";
// call dependency
call compile preprocessFileLineNumbers "overwrites\click_actions\init.sqf";
if (isNil "DZE_CLICK_ACTIONS_LOADED") exitWith {
    diag_log text "SUICIDE: ERROR -- Click Actions Handler not loaded! You are missing an addon!";
};
// colors for formatting messages
DZE_COLOR_PRIMARY = [(51/255),(181/255),(229/255),1];
DZE_COLOR_SUCCESS = [(153/255),(204/255),0,1];
DZE_COLOR_DANGER  = [1,(68/255),(68/255),1];
// add all the right-click actions to the guns
{DZE_CLICK_ACTIONS set [count DZE_CLICK_ACTIONS,[_x,"Commit Suicide","execVM 'addons\suicide\suicide.sqf';"]];} forEach DZE_SUICIDE_WEAPONS;