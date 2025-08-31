
if !(canSuspend) exitWith {_this spawn RRPClient_system_unlockCar};
private ["_complete","_vehicle"];

try {
    _vehicle = _this;
    if (isNull _vehicle) throw "Че Че че???";
    if !([_vehicle] call RRPClient_system_isVehicleKind) throw "Это вообще не взламывается";
    if !(alive _vehicle) throw "Тут уже нечего взламывать!";
    if !("extItem_grinder" in (magazines player)) throw "У вас должна быть болгарка!";
    if ('cop' call RRPClient_groups_getSideLevel < 1) throw "";

    _complete = [
        "Взлом замка...",
        {!(((player distance _vehicle) > (((boundingBox _vehicle) # 1) # 0) + 2))},
        true,
        35,
        false,
        true,
        {["CL3_anim_lockpick",false,true] call RRPClient_system_animDo;}
    ] call RRPCLient_system_newProgressBar;

    if (isNil "_complete") throw "Действие прервано";
    if !(_complete) throw 'Действие прервано!';


    private _numb = _vehicle getVariable ["dbInfo",[]];
    if (count _numb > 0) then {
        [0,"%1 получил доступ к технике %2",true,[player getVariable ["realname",""],_numb # 1]] remoteExecCall ["RRPClient_system_broadcast",-2];
    };
    life_vehicles pushBack _vehicle;
    playSound "RRPSound_LockPick";
    [25, "взлом техники"] call addXP;
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
