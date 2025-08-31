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
private ["_currentQuest","_questList","_reward","_type","_questProgress","_comletedQuest"];
_currentQuest = _this;
_questList = ((call RRPClient_forBeginner_missionsCfg) select _currentQuest);
_type   = (_questList select 3) select 0;
_reward = (_questList select 3) select 1;

[[player,_type,"add",_reward],"system_moneyChange"] call RRPClient_system_hcExec;
["SuccessTitleAndText", ["Задание пройдено!",format ["Вознаграждение %1%2 <br/>",_reward,if (_type isEqualTo "atm") then {"$"} else {"RC"}]]] call SmartClient_gui_toaster_addTemplateToast;

_questProgress = player getVariable ["rrpvar_questsList",[]];
_comletedQuest = _questProgress findIf {_x isEqualTo 0};
_questProgress set [_comletedQuest, 1];
player setVariable ["rrpvar_questsList",_questProgress];
[["rrpvar_questsList",_questProgress,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
closeDialog 0;
[format ["%1 выполнил задание #%2/%4 | quest array: %3",(getPlayerUID player),(_currentQuest + 1),(player getVariable ["rrpvar_questsList",[]]),(count (call RRPClient_forBeginner_missionsCfg))],"debug_forBeginners"] remoteExecCall ["RRPServer_system_logIt",2];
activeQuest = nil;

if ((count (call RRPClient_forBeginner_missionsCfg)) isEqualTo (_currentQuest + 1)) then {
	[format ["%1 !!!!!завершил обучение!!!!!",(getPlayerUID player)],"debug_forBeginners"] remoteExecCall ["RRPServer_system_logIt",2];

	false call RRPClient_forBeginner_WaterMarkReminder;
	[] spawn {
		uiSleep 2;
        [
            "__SERVER__", 
            [
                getPlayerUID player, 
                [
                    ["Points",1650]
                ]
            ]
        ] remoteExecCall ["RRPServer_rewards_addRewardsRequest",2];
		call RRPClient_forBeginner_compliment;
	};
} else {
    true call RRPClient_forBeginner_WaterMarkReminder;
    call RRPClient_forBeginner_openMenu;
    _display = uiNamespace getVariable ['RRPDialogEmpty',displayNull];
    'quests' call RRPClient_forBeginner_createTab; 
};
