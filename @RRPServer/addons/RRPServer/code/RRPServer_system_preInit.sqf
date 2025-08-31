private _timeStamp = diag_tickTime;
"---------------------------------------------------------------------------------------------------- #1111" call RRPServer_util_debugConsole;
"------------------------------------- Starting RRPServer preInit ------------------------------------ #1111" call RRPServer_util_debugConsole;
"------------------------------------------ Version 4.0 of "+serverName+"------------------------------------------- #1111" call RRPServer_util_debugConsole;
"---------------------------------------------------------------------------------------------------- #1111" call RRPServer_util_debugConsole;
"#lock" call RRPServer_DB_sendRconCommand;
"Server locked for init #1111" call RRPServer_util_debugConsole;
finishMissionInit;
DB3_DEBUG = true;
call RRPServer_system_events_init;
call RRPServer_system_thread_initialize;

timeModule = [4,true,12] execFSM "\RRPServer\FSM\timeModule.fsm";
cleanupFSM = [] execFSM "\RRPServer\FSM\cleanup.fsm";
server_monitorFSM = [] execFSM "\RRPServer\FSM\server_monitor.fsm";

// [] spawn RRPServer_system_federalUpdate;
serv_sv_use = [];
life_cleanupQueue = [];
RRPServerIDJIPAction = 0;
// master_group attachTo [bank_obj,[0,0,0]];

hostNumber = switch (serverName) do
{
	case "[RU] Aurora Role Play | rocket-rp.fun": {1};
	case "[RU] Aurora Role Play Tanoa| rimasrp.life": {2};
	case "[RU] Aurora Role Play #DEV | rimasrp.life": {3};
    default {3};
};
publicVariable "hostNumber";

/*
'[Map Cleanup]: Start cleanup. ~1111' call RRPServer_util_debugConsole;
private _modelArray = getArray(configFile >> "CfgCleanup" >> worldName >> "cleanupModels");
_modelArray append(getArray(configFile >> "CfgCleanup" >> "Global" >> "cleanupModels"));
private _netIDArray = getArray(configFile >> "CfgCleanup" >> worldName >> "cleanupNetID");
private _classnameArray = getArray(configFile >> "CfgCleanup" >> worldName >> "cleanupClasses");
_classnameArray append(getArray(configFile >> "CfgCleanup" >> "Global" >> "cleanupClasses"));
private _hiddenObjects = 0;
private _time = diag_tickTime;
{
    private _bool = switch (true) do {
        case ((getModelInfo _x#0) in _modelArray):
        {
                true
            };
        case ((toLower(typeOf _x)) in _classnameArray):
        {
                true
            };
        default {
            false
        };
    };
    if (_bool) then {
        _x hideObjectGlobal true;
        _x allowDamage false;
        _hiddenObjects = _hiddenObjects + 1;
    };
}
forEach(nearestTerrainObjects[[worldSize / 2, worldSize / 2], [], worldSize, false]);
{
    private _object = objectFromNetId _x;
    if (!isNull _object) then {
        _x hideObjectGlobal true;
        _x allowDamage false;
        _hiddenObjects = _hiddenObjects + 1;
    };
}
forEach _netIDArray;
format['[Map Cleanup]: Success! Cleared %1 objects within %2 seconds. ~1111', _hiddenObjects, diag_tickTime - _time] call RRPServer_util_debugConsole;
*/

if !(isClass (configFile >> "CfgPatches" >> "RRPAH")) exitWith
{
	for "_i" from 0 to 100 do
	{
		"Where RRPAH??? I wont started without RRPAH! ~1111" call RRPServer_util_debugConsole;
	};
	"#shutdown" call RRPServer_DB_sendRconCommand;
};

"RRPHC_enable" addPublicVariableEventHandler
{
    if (_this select 1) then
	{
        HC_UID = getPlayerUID hc_1;
        HC_Life = owner hc_1;
        publicVariable "HC_Life";
        HC_Life publicVariableClient "serv_sv_use";
        [true] call RRPServer_system_transferOwnership;
        HC_Life publicVariableClient "animals";
        format ["Headless client is connected and ready to work! (%1) ~1111",HC_UID] call RRPServer_util_debugConsole;
    };
};

"---------------------------------------------------------------------------------------------------- ~1111" call RRPServer_util_debugConsole;
format ["               End of RRPServer preInit :: Total Execution Time %1 seconds  ~1111",diag_tickTime - _timeStamp] call RRPServer_util_debugConsole;
"---------------------------------------------------------------------------------------------------- ~1111" call RRPServer_util_debugConsole;
