call compile preprocessFileLineNumbers "addons\suicide\config.sqf";
if (isServer || !DZE_SUICIDE_ADDON_ENABLE) exitWith {};
diag_log text "SUICIDE: initializing...";
// colors for formatting messages
DZE_COLOR_PRIMARY = [(51/255),(181/255),(229/255),1];
DZE_COLOR_SUCCESS = [(153/255),(204/255),0,1];
DZE_COLOR_DANGER  = [1,(68/255),(68/255),1];
{DZE_CLICK_ACTIONS set [count DZE_CLICK_ACTIONS,[_x,"Commit Suicide","execVM 'addons\suicide\suicide.sqf';"]];} forEach DZE_SUICIDE_WEAPONS;