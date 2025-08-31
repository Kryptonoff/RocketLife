

if (isNull objectParent player) then {systemChat "1";continue};
if (isOnRoad objectParent player) then {systemChat "2";continue};
_speed = speed (objectParent player);
if (_speed < 10 || _speed > -10) then {systemChat "3";continue};
enableCamShake true;

_power = 0.3 * (_speed / 100);
_duration = 20;
_frequency = 40; 
_compensation = 6;

addCamShake [_power,_duration,_frequency];
uiSleep (_duration - _compensation);

