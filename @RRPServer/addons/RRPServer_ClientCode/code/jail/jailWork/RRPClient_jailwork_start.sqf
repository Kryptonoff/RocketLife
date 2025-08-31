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
RRPClient_jw_startACtion = {

    private ["_timeAction", "_saveTime","_complete","_exit"];
    try {
        if !((_this # 0) isEqualTo Jail_work_toilet) throw "Этот Туалет чист, отправляйтесь к грязному";
        if !(isNil "jail_work_arrowObj") throw "";
        jail_work_active = true;
        if (life_action_inUse) throw "Вы уже выполняете действие!";
        if (player getVariable ['lifeState',''] in ['RESPAWN','INCAPACITATED','DEAD']) throw "Вы находитесь в агонии!";

        _timeAction = getNumber(missionConfigFile >> "jail_work" >> "timeAction");
        _saveTime =  getNumber(missionConfigFile >> "jail_work" >> "saveTime");
        _timeAction = 5;

        life_action_inUse = true;
        _complete = [
            "Чистим туалет...",
            {!(speed player > 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player)},
            true,
            _timeAction,
            false,
            true,
            {call RRPClient_animation_kneelWork}
        ] call RRPClient_system_newProgressBar;
        if (isNil "_complete") Exitwith {};
        if !(_complete) Exitwith {life_action_inUse = false};

        (_this # 0) setObjectTexture [0, "\ver_tol\data\body.paa"];
        (_this # 0) setObjectMaterial [0,"\ver_tol\data\body.rvmat"];

        if (life_is_arrested) then {
            life_jail_time = life_jail_time - 1;
            [5] call RRPClient_session_updatePartial;
        };

        _exit = {
            deleteVehicle jail_work_notifArrow;
            Jail_work_toilet = nil;
            life_action_inUse = false;
            call RRPCLient_jw_defineObject;
        };

        [
            (findDisplay 46),
            {
                call RRPCLient_jw_defineObject
            },
            [],
            "Хотите продолжить?",
            ""
        ] call RRPClient_util_prompt;

    } catch {
        call _exit;
        ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
    };
};


RRPCLient_jw_defineObject = {
        try {
                if !(isNil "Jail_work_toilet") throw "Этот туалет чист, вернитесь к грязному!";
                if !(isNil "jail_work_notifArrow") throw "Этот туалет чист, вернитесь к грязному!";
                if (life_action_inUse) throw "Вы уже чем-то заняты...";

                [
                    (findDisplay 46),
                    {
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
                    },[],
                    "Начать мыть туалеты?",
                    "За каждый почищенный туалет вы получите - 1 минуту к сроку отсидки"
                ] call RRPClient_util_prompt;
        } catch {
            ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
        };

};

call RRPCLient_jw_defineObject;
