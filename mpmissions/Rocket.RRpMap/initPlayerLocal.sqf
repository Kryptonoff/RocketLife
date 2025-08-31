/*

	Filename: 	initPlayerLocal.sqf
	Project: 	Rimas Altis Life RPG

*/
comment "Rimas Role Play - v2.10";
#include "script_macros.hpp"


debugConsole = {
	if !(serverName isEqualTo "[RU] Rimas Role Play #DEV | rimasrp.life") exitWith {};
	"debug_console" callExtension format ["%1 #1111",_this];
};

"InitPlayerLocal begin..." call RRPClient_system_log;

if (!hasInterface && !isServer) exitWith {
	format ["My ID on this session: %1",getPlayerUID player] call RRPClient_system_log;
	HC_UID = getPlayerUID player;
	publicVariable "HC_UID";
};
CONST(BIS_fnc_endMission,BIS_fnc_endMission);
CONST(BIS_fnc_arsenal,BIS_fnc_arsenal);

//--- Disable sound and hide scene
0 fadeSound 0;
0 fadeMusic 0;
0 fadeRadio 0;
enableRadio false;
enableSentences false;

showHud false;
showChat false;
showCommandingMenu "";

private _platform = LIFE_SETTINGSWORLD(getNumber,worldName,"life_platformZlevel");

"respawn_east" setMarkerPosLocal [markerPos "respawn_east" select 0, markerPos "respawn_east" select 1, _platform];
"respawn_west" setMarkerPosLocal [markerPos "respawn_west" select 0, markerPos "respawn_west" select 1, _platform];
"respawn_civilian" setMarkerPosLocal [markerPos "respawn_civilian" select 0, markerPos "respawn_civilian" select 1, _platform];
"respawn_guerrila" setMarkerPosLocal [markerPos "respawn_guerrila" select 0, markerPos "respawn_guerrila" select 1, _platform];
"cargo_spawn" setMarkerPosLocal [markerPos "cargo_spawn" select 0, markerPos "cargo_spawn" select 1, _platform];

"InitPlayerLocal done!" call RRPClient_system_log;
