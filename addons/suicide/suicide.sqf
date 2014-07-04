private ["_position","_done","_timeLeft","_exitWith","_warning","_weapon"];

// initialize variables
_exitWith = "nil";
_done = false;
_position = position player;
_timeLeft = DZ_SUICIDE_CANCEL_TIME;
_warning = "You will commit suicide in %1 seconds. Move to cancel!";

// close the gear display when player starts to commit suicide
disableSerialization;
_display = findDisplay 106;
if(!(isNull _display)) then {
    _display closeDisplay 0;
};

// make sure the player really knows
hint format[_warning,_timeLeft];
taskHint [format[_warning,_timeLeft], DZE_COLOR_DANGER, "taskNew"];

// perform conditional checks and give the player a chance to cancel
while{!_done} do {
    cutText [format[_warning,_timeLeft], "PLAIN DOWN"];
    sleep 1;
    _timeLeft = _timeLeft - 1;
    _weapon = (currentWeapon player);
    if(position player select 0 != _position select 0 || position player select 1 != _position select 1) exitWith {
        _exitWith = "Suicide Cancelled!";
    };
    if((isNil "_weapon") || {!(_weapon in DZE_SUICIDE_WEAPONS)}) exitWith {
        _exitWith = "No valid guns to kill yourself with!";
    };
    if(DZ_SUICIDE_REQUIRE_BULLET && ((player ammo _weapon) == 0)) exitWith {
        _exitWith = "You are out of ammunition!";
    };
    if(_timeLeft <= 0) then {
        _done = true;
    };
};

// if we didn't get an exit reason back, time to die!
if (_exitWith != "nil") then {
    taskHint["Goodbye!", DZE_COLOR_SUCCESS, "taskDone"];
    player playmove (["ActsPercMstpSnonWpstDnon_suicide1B","ActsPercMstpSnonWpstDnon_suicide2B"] call BIS_fnc_selectRandom);
    sleep 8;
    player fire _weapon;
    sleep 1;
    player setDamage 1.5;
} else {
    taskHint[_exitWith, DZE_COLOR_DANGER, "taskFailed"];
};