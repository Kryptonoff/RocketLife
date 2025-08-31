
if (CarBambVehicle getVariable ['CarBomb', []] isEqualTo [3]) exitWith {};
if (BombIsActivated) then {
    if !(isNull CarBombCountdownThread) exitWith {};
    CarBombCountdownThread = [] spawn RRPClient_CarBomb_StartBombCountDown;
    //SetVar on vehicle
    _varData =
    [
        2
    ];
    CarBambVehicle setVariable ['CarBomb', _varData, true];
    switch true do 
    {
        case !(isNil'BombMonitoringThreadID'): {
            [BombMonitoringThreadID] call RRPClient_system_thread_removeTask;
            BombMonitoringThreadID = nil;
        };
        case !(isNull CarBombCountdownThread): {
            [BombMonitoringThreadID] call RRPClient_system_thread_removeTask;
            BombMonitoringThreadID = nil;
        };
    };

}else{
    _speed = CarBambVehicle call BIS_fnc_absSpeed;
    if (_speed > BombActivationSpeed) then
    {
        BombIsActivated = true;
		player setVariable ["BombCarVictim",1,true];
        _msg = Format["Удерживайте скорость выше %1 км/ч чтобы выжить!", BombActivationSpeed];
        ["InfoTitleAndText", ["Бомба активирована!", _msg]] call SmartClient_gui_toaster_addTemplateToast;
        playSound "bombCar";
        
    };
};
