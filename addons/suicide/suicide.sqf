private ["_secondary","_position","_cancel","_done","_timeLeft"];
_cancel = false;
_done = false;
_position = position player;
_secondary = currentWeapon player;
_nextMessage = 0;
_timeLeft = DZ_SUICIDE_CANCEL_TIME;

while{!_done} do {
    cutText [format["You will commit suicide in %1 seconds. Move to cancel!",_timeLeft], "PLAIN DOWN"];
    sleep 1;
    _timeLeft = _timeLeft - 1;
    if(position player select 0 != _position select 0 || position player select 1 != _position select 1) then {
        _cancel = true;
        _done = true;
    };
    if(_timeLeft <= 0) then {
        _done = true;
    }
};

if (!_cancel) then {
    cutText ["Goodbye!", "PLAIN DOWN"];
    player playmove "ActsPercMstpSnonWpstDnon_suicide1B";
    sleep 8.4;
    player fire _secondary;
    sleep 1;
    player SetDamage 1;
} else {
    cutText ["You want to live!", "PLAIN DOWN"];
};