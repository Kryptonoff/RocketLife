private _timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------- Starting RRPServer postInit ------------------------------------";
diag_log "------------------------------------------ Version 1.0 -------------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

for "_i" from 0 to (250 - 1) do
{
    format ["#kick %1", _i] call RRPServer_DB_sendRconCommand;
};

call RRPServer_groups_loadPageGroups;
call RRPServer_containers_gang_loading;
call RRPServer_house_initHouses;
call RRPServer_ltd_getAllLtdData;
call RRPServer_ltd_getAllLtdObject;
call RRPServer_ltd_slots_loadPage;
call RRPServer_system_garbageCollector;
call RRPServer_system_setSideFriends;
call RRPServer_drops_dropGifts;
// call RRPServer_weaponStorage_init;
call RRPServer_system_init_msnVariables;
call RRPServer_refinery_init;

if (hostNumber isEqualTo 1) then {
    RconRestart = [] spawn RRPServer_system_RCON_Restart;
};
call RRPServer_economy_loadPage;
//call RRPServer_lottery_fetchWinners;
turtleSpawn = [["turtle_1","turtle_2","turtle_3"],75] spawn RRPServer_system_turtleZone;
setDate [2039,10,24,7,30];

{_x enableSimulationGlobal true;}forEach (allMissionObjects "RRPObject_CCTV");

//gover
server_govinfo = "getGovInfo" call RRPServer_DB_selectSingle;
publicVariable "server_govinfo";

private _detectorColorDefault = getText(getMissionConfig "CfgMetalDetector" >> "detector_color_default");
detectorsTriggers = [];
{
    _x setObjectTextureGlobal[1, format["%1%2%3", "#(argb,8,8,3)color(", _detectorColorDefault, ",1.0,co)"]];
    detectorsTriggers pushBack _x;
}forEach(nearestObjects[[worldSize / 2, worldSize / 2], ["init_studio_metal_detector"], worldSize]);
publicVariable "detectorsTriggers";

"Loading NewsFeed #1111" call RRPServer_util_debugConsole;
RRPPublicNews = "loadNewsFeed" call RRPServer_DB_selectFull;
publicVariable "RRPPublicNews";
"NewsFeed Loaded #0101" call RRPServer_util_debugConsole;

missionNamespace setVariable ["server_timeText",(call RRPServer_util_getRealTime),true];

{
    if (!isPlayer _x) then {
        _npc = _x;
        {
            if (_x != "") then {
                _npc removeWeapon _x;
            };
        } forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
    };
} forEach allUnits;


/*
_check_uniform_n_vest_loopcode = {
	{
		if(alive _x)then
		{
			[uniform _x,vest _x] remoteExecCall ['fnc_check_uniform_n_vest', owner _x,false];
		};
	} forEach allPlayers;
};

if(!isNil'check_uniform_n_vest_THREAD')then{[check_uniform_n_vest_THREAD] call RRPServer_system_thread_removeTask;};

check_uniform_n_vest_THREAD = [30, _check_uniform_n_vest_loopcode, [], true] call RRPServer_system_thread_addTask;
*/


private _countOnline = {
    private ["_cop","_med","_all"];
    _allPlayers = allPlayers - entities "HeadlessClient_F";
    _cop = count (_allPlayers select {_x call getSide isEqualTo "med"});
    _med = count (_allPlayers select {_x call getSide isEqualTo "cop"});
    _all = count _allPlayers;

    online_status = [_cop,_med,_all];
    diag_log format ["array online %1",online_status];
    publicVariable "online_status";
};

onlineIndicator_THREAD = [(0.2 * 60),_countOnline, [], true] call RRPServer_system_thread_addTask;
playtimeCycle_THREAD = [10, RRPServer_playtime_cycle, [], true] call RRPServer_system_thread_addTask;

[30,{
    missionNamespace setVariable ["server_timeText",(call RRPServer_util_getRealTime),true];
    missionNamespace setVariable ["RRPPublicTime",systemTime,true];
},[],true] call RRPServer_system_thread_addTask;

"Rcon events initialized! #1111" call RRPServer_util_debugConsole;
"#unlock" call RRPServer_DB_sendRconCommand;
RRPServerIsLocked = false;
"Server unlocked and accepting players. Have fun! :) #0101" call RRPServer_util_debugConsole;
life_server_isReady = true;
publicVariable "life_server_isReady";
"---------------------------------------------------------------------------------------------------- #1111" call RRPServer_util_debugConsole;
format ["               End of RRPServer postInit :: Total Execution Time %1 seconds  #1111",(diag_tickTime) - _timeStamp] call RRPServer_util_debugConsole;
"---------------------------------------------------------------------------------------------------- #1111" call RRPServer_util_debugConsole;

"---------------------------------------------------------------------------------------------------- #1111" call RRPServer_util_debugConsole;
"               CALLING HEADLESS!  #1111" call RRPServer_util_debugConsole;
"---------------------------------------------------------------------------------------------------- #1111" call RRPServer_util_debugConsole;

"cmd_arma" callExtension "RRP_STARTER_HC.bat";
