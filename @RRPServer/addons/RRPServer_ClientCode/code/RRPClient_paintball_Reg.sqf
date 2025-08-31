/*
	Filename: 	RRPClient_paintball_Reg.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
if (player GVAR ["inPBfight",false]) exitWith {["Вы уже зарегистрированы как участник"] call hints};
private _action = [
	"Хотите принять участие в пейнтбольном состязании?",
	"Пейнтбол",
	"Да",
	"Нет"
] call BIS_fnc_guiMessage;

if (_action) then {
	player SVAR ["inPBfight",true,true];
	if !(cameraView in ["INTERNAL","GUNNER"])  then {
		player switchCamera "INTERNAL";		
	};
	private _PBzone = _this select 3;
	["Не покидайте зеленый круг, иначе вы будете считаться проигравшим"] call hints;	
	["in",GVAR_RNAME(player)] remoteExecCall ["RRPClient_paintball_Message",RCLIENT];
	[_PBzone,getPosATL player] spawn {
		while {true} do {
			if (call RRPClient_system_isInterrupted) exitWith {				
				[player,"inPBfight"] call RRPClient_system_clearGlobalVar;
			};
			if (player distance getMarkerPos (_this select 0) > 260 OR !(player GVAR ["inPBfight",false])) exitWith {
				[player,"inPBfight"] call RRPClient_system_clearGlobalVar;
				if (NOTINVEH(player)) then {
					player setPosATL (_this select 1);
				};
				["Вы более не участник сражения"] call hints;				
				["out",GVAR_RNAME(player)] remoteExecCall ["RRPClient_paintball_Message",RCLIENT];
			};
			uiSleep 2;
		};
	};
};