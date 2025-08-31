/*
    Author(s):
    Arrra (original)
    ----
    Сontacts:
    SteamID: 76561198090549826
    Discord: arrra#9745
    Mail: dotanchik123@gmail.com
    ----
    License:
    cc by-nc-nd
*/
try {
        if !(isNil "Jail_work_toilet") throw "Попробуйте начать задание заново!";
        if !(isNil "jail_work_notifArrow") throw "Попробуйте начать задание заново!";
        if (life_action_inUse) throw "Вы уже чем-то заняты...";
        if !(life_is_arrested AND life_jail_time > 1) throw "Вы должны быть заключенным";


        private _createTask = {
            Jail_work_toilet = missionNamespace getVariable [format["toilet_jail_%1",(round random 63)],objNull];
            Jail_work_toilet setObjectTexture [0, "\ver_tol\data\body_dirt.paa"];
            Jail_work_toilet setObjectMaterial [0,"\ver_tol\data\body_dirt.rvmat"];
            jail_work_notifArrow = "VR_3DSelector_01_default_F" createVehicleLocal [0,0,0];
            jail_work_notifArrow attachTo [Jail_work_toilet,[-0.5,-4,1]];
            ["InfoTitleAndText", ["Работа", "Грязный туалет ждет вас!"]] call SmartClient_gui_toaster_addTemplateToast;

            [] spawn {
                private _dir = 0;
                while {!(isNil "jail_work_notifArrow")} do {
                    if (_dir == 360) then {
                        _dir = 0;
                    } else {
                        _dir = _dir + 1;
                    };
                    jail_work_notifArrow setDir _dir;
                    uiSleep 0.01;
                };

            };
        };

        if (_this) then {
            [
                (findDisplay 46),
                {
                    diag_log format ["_this:  %1",(_this # 0)];
                 call (_this # 0);
                },
                [_createTask],
                "Начать мыть туалеты?",
                "Каждый почищенный сортир будет расцениваться как примерное поведение и в знак этого с вашего общего срока будет сниматься 1 минута(месяц)"
            ] call RRPClient_util_prompt;
        } else {
            call _createTask;
        };

} catch {
    if !(isNil "jail_work_notifArrow") then {
        deleteVehicle jail_work_notifArrow;
    };
    Jail_work_toilet = nil;
    jail_work_notifArrow = nil;

    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
