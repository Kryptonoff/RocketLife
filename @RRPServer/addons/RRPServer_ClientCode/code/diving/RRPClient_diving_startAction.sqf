/*
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/


try {
    if (life_action_inUse) throw "Вы уже чем-то заняты...";
    if !(isNil "diving_point") throw "Отправляйтесь к месту исследования!";

    ["InfoTitleAndText", ["Дайвинг", "Купите снаряжение для дайвинга и отправляетесь исследовать морские глубины в поисках сокровищ"]] call SmartClient_gui_toaster_addTemplateToast;

    private ["_pos","_trunk","_chanse","_arrow","_trunkPos"];
    _pos = selectRandom (getArray(missionConfigFile >> "cfgDiving" >> "positions"));
    diving_point = (selectRandom getArray(missionConfigFile >> "cfgDiving" >> "trunks")) createVehicleLocal _pos;
    diving_point setVariable ["divingObj",true];
    _arrow = "Sign_Arrow_Cyan_F" createVehicleLocal [0,0,0];
    _trunkPos =  getPos diving_point;

    _arrow setPos [_trunkPos # 0, _trunkPos # 1, (_trunkPos # 2) + 2];

    [_arrow] spawn {
        params ["_arrow"];
        private _dir = 0;
        while {!(isNil "diving_point")} do {
            if (_dir == 360) then {
                _dir = 0;
            } else {
                _dir = _dir + 1;
            };
            _arrow setDir _dir;
            uiSleep 0.01;
        };
        deleteVehicle _arrow;
    };
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
