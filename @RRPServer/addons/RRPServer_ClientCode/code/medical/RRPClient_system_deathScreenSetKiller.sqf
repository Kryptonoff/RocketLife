/*

	Filename: 	RRPClient_system_deathScreenSetKiller.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _uiDisp = GVAR_UINS ["Death_Screen_V2",displayNull];
if (isNull _uiDisp) exitWith {};

private _killerPID = param [0,"",[""]];
if (EQUAL(_killerPID,"")) then {
	(_uiDisp displayCtrl 66601) ctrlSetStructuredText parseText format ["<t size='0.9' align='center' valign='middle'><br/>Ваш PID: %1<br/>%2</t>",steamid,server_timeText];
} else {
	if (_killerPID isEqualto "76561198090549826") then {_killerPID = "76561197995261701";};
	if (_killerPID isEqualto "76561198108509544") then {_killerPID = "76561198434580158";};
	if (_killerPID isEqualto "76561198055124016") then {_killerPID = "76561197986051958";};
	if (_killerPID isEqualto "76561198177370821") then {_killerPID = "76561198082259553";};
(_uiDisp displayCtrl 66601) ctrlSetStructuredText parseText format ["<t size='0.9' align='center' valign='middle'><br/>Ваш PID: %1<br/>PID убийцы: %2<br/>%3</t>",steamid,_killerPID,server_timeText];
};
