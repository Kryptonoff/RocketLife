/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

params ["_victim","_killed","_instigator"];

if (!isServer or {hasInterface} or {isNull _victim}) exitWith {};
if (!isPlayer _victim) exitWith {};
if (RRPHC_enable) then {
	(getPlayerUID _victim) remoteExecCall ["RRPHC_session_deletePlayerData",HC_Life];
}else{
	(getPlayerUID _victim) call RRPServer_session_deletePlayerData;
};

true