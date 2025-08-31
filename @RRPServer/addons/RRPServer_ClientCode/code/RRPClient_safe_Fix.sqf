/*
	Filename: 	RRPClient_safe_Fix.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
private _vault = _this select 0;
if !(_vault GVAR ["safe_open",false]) exitWith {["Дверь уже заблокирована?"] call hints};

call RRPClient_actions_inUse;

disableSerialization;
titleText[ "Производится ремонт хранилища...","PLAIN"];
private _cP = 0;
while {true} do {
	_cP = _cP + .012;
	[_cP,"repair"] call RRPClient_system_progressBar;	
	if (_cP >= 1 OR (call RRPClient_system_isInterrupted) OR life_interrupted) exitWith {};
	call RRPClient_animation_kneelWork;
	uiSleep 0.26;
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText["Действие отменено","PLAIN"]};

[_vault,"safe_open"] call RRPClient_system_clearGlobalVar;
["Хранилище успешно отремонтировано и закрыто."] call hints;