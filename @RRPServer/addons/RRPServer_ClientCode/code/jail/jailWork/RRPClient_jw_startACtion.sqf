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
private ["_timeAction","_complete","_exit"];
try {
    if (isNil "Jail_work_toilet") throw "Попробуйте начать заново";
    if !((_this # 0) isEqualTo Jail_work_toilet) throw "Этот Туалет чист, отправляйтесь к грязному";
    if (isNil "jail_work_notifArrow") throw "Ошибка!";
    if (life_action_inUse) throw "Вы уже выполняете действие!";
    if (player getVariable ['lifeState',''] in ['RESPAWN','INCAPACITATED','DEAD']) throw "Вы находитесь в агонии!";
    if ((player distance Jail_work_toilet) > 4) throw "Подойдите к туалету ближе!";

    _timeAction = ["saveTimeAction",(getNumber(missionConfigFile >> "jail_work" >> "timeAction"))] call RRPClient_system_VIP;

    life_action_inUse = true;
    _complete = [
        "Чистим туалет...",
        {!(speed player > 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player) AND (player distance Jail_work_toilet) < 4},
        true,
        _timeAction,
        false,
        true,
        {call RRPClient_animation_kneelWork}
    ] call RRPClient_system_newProgressBar;

    _exit = {
        if !(isNil "jail_work_notifArrow") then {
            deleteVehicle jail_work_notifArrow;
        };
        Jail_work_toilet = nil;
        jail_work_notifArrow = nil;
        life_action_inUse = false;
    };

    if (isNil "_complete") Exitwith {call _exit};
    if !(_complete) Exitwith {
        life_action_inUse = false;
        call _exit;
    };

    (_this # 0) setObjectTexture [0, "\ver_tol\data\body.paa"];
    (_this # 0) setObjectMaterial [0,"\ver_tol\data\body.rvmat"];

    if (life_is_arrested) then {
        life_jail_time = life_jail_time - 1;
        [5] call RRPClient_session_updatePartial;
    };


    ["InfoTitleOnly",["Чистый до блеска!"]] call SmartClient_gui_toaster_addTemplateToast;
    [_exit] spawn {
        uiSleep 2;
        call (_this # 0);
        ["InfoTitleOnly",["Приступайте к следующему туалету!"]] call SmartClient_gui_toaster_addTemplateToast;
        false call RRPCLient_jw_defineObject;
    };

} catch {
    call _exit;
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
