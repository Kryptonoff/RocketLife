/*
	
	Filename: 	RRPClient_system_requestMedic.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
if (life_medicstatus >= 0) exitWith {titleText["Вы уже отправили запрос","PLAIN"]};

private _medicsOnline = {_x != player && {_x call getSide == "med"} && {alive _x}} count playableUnits > 0;
if (_medicsOnline) then 
{
	[player,GVAR_RNAME(player)] remoteExecCall ["RRPClient_system_medicRequest",allPlayers select {_x call getSide isEqualTo "med"}];
	// [2] spawn RRPClient_dispatch_deathMessage; 
} else {
	[player,GVAR_RNAME(player)] remoteExecCall ["RRPClient_system_copMedicRequest",allPlayers select {_x call getSide isEqualTo "cop"}];
	// [1] spawn RRPClient_dispatch_deathMessage; 
};

private _uiDisp = GVAR_UINS ["Death_Screen_V2",displayNull];
private _txtBottomLeft = _uiDisp displayCtrl 66603;
[player,_txtBottomLeft,false] spawn RRPClient_system_medicalTimer;
life_medicstatus = 0;
[player,"medicStatus",[life_medicstatus,life_medicstatusby]] call CBA_fnc_setVarNet;