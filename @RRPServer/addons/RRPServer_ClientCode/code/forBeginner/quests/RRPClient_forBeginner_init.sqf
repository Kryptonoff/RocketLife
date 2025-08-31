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
private _questList = player getVariable ["rrpvar_questsList",[]];
private _questComplete = 1;

if (0 in (player getVariable ["rrpvar_questsList",[0,0,0,0,0,0,0,0]])) then {
	true call RRPClient_forBeginner_WaterMarkReminder;
	_questComplete = 0;
};

if (_questList isEqualTo []) then {
	private _arr = [];
	for '_i' from 1 to (count (call RRPClient_forBeginner_missionsCfg)) do {_arr pushBack _questComplete};
	player setVariable ["rrpvar_questsList",_arr];
    [["rrpvar_questsList",_arr,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
};
