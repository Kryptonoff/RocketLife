/*
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
if !(canSuspend) exitWith {_this spawn RRPClient_farm_miningAction};
params [
    ["_vehicle",objNull, [objNull]],
    ["_profName","",[""]],
    ["_item","",[""]]
];

try {
    if (player getVariable ['lifeState',''] in ['RESPAWN','INCAPACITATED','DEAD']) throw "Вы находитесь в агонии!";
    if (player getVariable "restrained") throw "У вас связаны руки!";
    if !(currentWeapon player == "MeleePickaxe") throw "Для добычи вам требуется кирка!";

    life_action_inUse = true;
    life_interrupted = false;

    private _weight = [_vehicle] call RRPClient_system_vehicleWeight;

    if (_weight # 1 >= _weight # 0) throw "Инвентарь техники переполнен!";


    private ["_defaultTime","_maxAmount"];
    _defaultTime = getNumber(missionConfigFile >> "mining" >> "defaultTime");
    _maxAmount = getNumber(missionConfigFile >> "mining" >> "amountMax");

    RRPClientMinerVehList pushBack _vehicle;

    while {
            (((((boundingBox _vehicle) # 1) # 0) + 5) > player distance _vehicle) AND
            currentWeapon player == "MeleePickaxe"
        } do {

        private _weight = [_vehicle] call RRPClient_system_vehicleWeight;
        if (_weight # 1 >= _weight # 0) throw "Инвентарь техники переполнен!";

        playSound selectrandom ["pickAxe_1","pickAxe_2","pickAxe_3","pickAxe_4"];
        player playActionNow "GestureSwing";

        (_profName call RRPCLient_util_getSkillInfo) params ["_maxLvl","_curLvl"];
        private ["_amount","_success"];
        _amount = [_maxAmount] call RRPClient_util_countAmountItems;

        _success = [_vehicle,_item,_amount,true] call RRPClient_system_vehicleInv;
        if !(_success) throw "Инвентарь заполнен!";
        if (_success) then {
            [[[_item,_amount]],'virtual',0] call RRPClient_farm_util_notificationADDitems;
        };
        private ["_time","_comlete"];
        _time = ([_maxLvl,_curLvl,_defaultTime] call RRPClient_util_countSavingTime);
        _comlete = ["Добыча...",{!(speed player > 4) and ((player getVariable ["lifeState",""]) isEqualTo "HEALTHY") and (alive player)},true,_time,false,true,{}] call RRPClient_system_newProgressBar;
    };

    RRPClientMinerVehList = RRPClientMinerVehList - [_vehicle];
    life_action_inUse = false;
    life_interrupted = true;
} catch {
    RRPClientMinerVehList = RRPClientMinerVehList - [_vehicle];
    life_action_inUse = false;
    life_interrupted = true;
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
