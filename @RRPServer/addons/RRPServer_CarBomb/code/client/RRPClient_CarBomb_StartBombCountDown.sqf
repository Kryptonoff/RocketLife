
if (driver (objectParent player) isNotEqualTo player)exitWith {terminate CarBombCountdownThread};
if (CarBambVehicle getVariable ["CarBomb",[]] isEqualTo [3]) exitWith {terminate CarBombCountdownThread};

CarBombCountDownTimer = ("RscCarBombCountDownTimer" call BIS_fnc_rscLayer);
CarBombCountDownTimer cutRsc ["RscCarBombCountDownTimer", "PLAIN", 1, false];

disableSerialization;

_display = uiNameSpace getVariable ["RscCarBombCountDownTimer", displayNull];
_timer = _display displayCtrl 7981;
_timer ctrlSetFade 0;
_timer ctrlCommit 0;

_countDown = BombCountdownTime;
_minimumSpeed = BombActivationSpeed;
_timeRemaining = _countDown;
_startTime = time;
_fadeIn = false;
_nextFadeTime = time;
_time = time;
[
    "hell","","","",false,
    [
        [
            "Начал выживание!",
            [
                format ["%1: Выживает на %2",player call getFullName,getText(configOf CarBambVehicle >> "displayName")]
            ] joinString "\n",
            "",
            "fde910",false,"","",[],[]
        ]
    ]
]call sendDs;
 _fail = false;
while {_timeRemaining > 0} do
{
    if (CarBambVehicle getVariable ["CarBomb",[]] isEqualTo [3]) exitWith {_fail = true; terminate CarBombCountdownThread};
    _speed = CarBambVehicle call BIS_fnc_absSpeed;
    if (_speed < _minimumSpeed) exitWith
    {
        [_countDown - _timeRemaining] call RRPClient_CarBomb_StopBombCountDown;
        _fail = true;
    };
    if (_timeRemaining <= 5) then
    {
        if (time >= _nextFadeTime) then
        {
            if (_fadeIn) then
            {
                _timer ctrlSetFade 0;
            }
            else
            {
                _timer ctrlSetFade 1;
            };

            _fadeIn = !_fadeIn;
            _timer ctrlCommit 0.3;
            _nextFadeTime = time + 0.3;
        };
    };
    if (isOnRoad CarBambVehicle) then 
    {
        _timeRemaining = _timeRemaining - 0.1;
        _timer ctrlSetStructuredText (parseText format ["<t align='center' size='0.8' shadow='true' font='SFCompactDisplay'>%1</t>", [_timeRemaining, "MM:SS"] call BIS_fnc_secondsToString]);
    }else{
        _timer ctrlSetStructuredText (parseText format ["<t align='center' color='#FF0000' size='0.8' shadow='true' font='SFCompactDisplay'>%1</t>", [_timeRemaining, "MM:SS"] call BIS_fnc_secondsToString]);
    };
    if (_timeRemaining > 0) then
    {
        uiSleep 0.1;
    };
};
if (_fail) exitWith {};
_timer ctrlSetFade 0;
_timer ctrlCommit 0.3;
call RRPClient_CarBomb_PlayerSurvived;
