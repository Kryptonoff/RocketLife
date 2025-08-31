/*
	Filename: 	RRPClient_system_defuseKit.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _vault = param [0,ObjNull,[ObjNull]];
if (isNull _vault) exitWith {};
if (typeOf _vault != LIFE_SETTINGS(getText,"life_vaultBoxClass")) exitWith {};
if !(_vault GVAR ["chargeplaced",false]) exitWith {["Заряд не установлен. Разминировать нечего."] call hints};

call RRPClient_actions_inUse;

disableSerialization;
titleText ["Разминирование...","PLAIN"];
private _cP = 0;

while {true} do {
	_cP = _cP + 0.0035;
	[_cP,"police"] call RRPClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call RRPClient_system_isInterrupted)) exitWith {};	
	call RRPClient_animation_kneelWork;
	uiSleep 0.26;
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText["Действие отменено","PLAIN"]};

[_vault,"chargeplaced"] call RRPClient_system_clearGlobalVar;
[0,"Заряд был обезврежен"] remoteExecCall ["RRPClient_system_broadcast","cop" call RRPClient_util_getPlayersBySide];