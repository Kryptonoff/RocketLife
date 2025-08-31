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
private ["_currentQuest","_questList","_title"];
_currentQuest = _this;
_questList = ((call RRPClient_forBeginner_missionsCfg) select _currentQuest);

_title  = _questList select 0;

["InfoTitleAndText", [_title, "Подробное описание задачи в меню заданий"]] call SmartClient_gui_toaster_addTemplateToast;
[] spawn ((call RRPClient_forBeginner_missionsScripts) select _currentQuest);
activeQuest = true;
numberQuest = _currentQuest;
closeDialog 0;
