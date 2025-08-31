/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

params ["_reason"];
['Abuse!','SpyGlass','FF0000',format ["%1 - %2 (%3)",_reason,(name player),getPlayerUID player]] remoteExecCall ["RRPServer_discord_sendMessage",2];
[getPlayerUid player,999999,"Not Welcome 3-A"] remoteExecCall ["RRPServer_DB_addBan",2];