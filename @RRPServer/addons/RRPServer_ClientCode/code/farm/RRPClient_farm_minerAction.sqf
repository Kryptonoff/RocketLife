/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/

params [
    ["_vehicle",objNull, [objNull]],
    ["_profName","",[""]],
    ["_item","",[""]]
];
systemChat format ["MINER: %1 %2 %3",_vehicle,_profName,_item];
if !(canSuspend) exitWith {_vehicle spawn RRPClient_farm_minerAction};
try {
    private ["_user"];
    if (_vehicle in RRPClientMinerVehList) throw "Этот добычик уже добывает!";

    if ((curTarget animationPhase "opora_l" < 0.5)) throw "Для начала добычи нужно поднять опоры и запустить бур!";
    if (_vehicle animationPhase "strela" <= 0.5) throw "Для начала добычи нужно поднять стрелу и запустить бур!";
    if (_vehicle animationPhase 'bur_plate1' < 0.99) throw "Для начала добычи нужно запустить бур!";

    _user = _vehicle getVariable ["minerActive", ""];
    if ([_user] call RRPClient_system_isUIDActive AND !(_user isEqualTo getPlayerUID player)) then {
        throw "Этот добычик уже кем-то занят";
    } else {
        _vehicle setVariable ["minerActive", getPlayerUID player, true];
    };
    if (fuel _vehicle <=0) throw "У вас пустой бак...";

    RRPClientMinerVehList pushBack _vehicle;

    _vehicle setVariable ["pressure", 1, false];
    private _consumption = (1/1000);
    while {true} do {
        if (fuel _vehicle <=0) throw "Добыча остановлена, вам нужно заправится!";



        private _text = switch ((_vehicle getVariable ["pressure",1])) do {
            case (2): {"Давление насоса превысило 2bar !"};
            case (3): {"Давление насоса превысило 3bar! Крайне допустимое давление 4bar"};
            case (4): {"Давление насоса превысило 4bar, техника выйдет из строя на отметке более 4bar"};
        };

        if !(_text) then {
            ["WarningTitleAndText",["Ошибка!", _text]] call SmartClient_gui_toaster_addTemplateToast;
        };

        if (_vehicle getVariable ["pressure",1] >= 4.1) throw "Оборудование вышло из строя!";

        _vehicle setFuel ((fuel _vehicle) - _consumption);
        _vehicle setVariable ["pressure",((_vehicle getVariable ["pressure",1]) + (_consumption * 10)), false];

        if (speed _vehicle > 2) throw "Добыча остановлена, добычик должен стоять на месте!";
        private _weight = [_vehicle] call RRPClient_system_vehicleWeight;
        if (_weight # 1 >= _weight # 0) throw "Инвентарь техники переполнен!";

        private _amountItems = 1;
        _amountItems = [_amountItems] call RRPClient_util_countAmountItems;

        private _success = [_vehicle,_item,_amountItems,true] call RRPClient_system_vehicleInv;
        if !(_success) throw "Инвентарь заполнен!";

        uisleep 1;
    };
    RRPClientMinerVehList = RRPClientMinerVehList - [_vehicle];
    _vehicle setVariable ["minerActive", nil, true];
} catch {
    _vehicle setVariable ["pressure", nil, false];
    _vehicle setVariable ["minerActive", nil, true];
    RRPClientMinerVehList = RRPClientMinerVehList - [_vehicle];
    ["WarningTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
