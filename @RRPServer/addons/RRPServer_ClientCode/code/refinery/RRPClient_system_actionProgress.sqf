/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
params [
	["_time", 0, [0]],
	["_action_name", "", [""]]
];
private ["_pos","_ret"];
private _pos = getPos player;
["WarningTitleOnly", ["Не отходите от крана более чем на 5 метров!"]] call SmartClient_gui_toaster_addTemplateToast;
private _ret = [_action_name,{!(speed player > 4) AND {((player getVariable ["lifeState",""]) isEqualTo "HEALTHY")} and {(alive player)} AND (player distance _pos < 5)},true,_time,false,true,{}] call RRPClient_system_newProgressBar;

_ret
