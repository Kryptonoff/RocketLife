/*
	Filename: 	RRPClient_system_pullOutVeh.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _source = param [0,objNull,[objNull]];
if (NOTINVEH(player)) exitWith {};

if (LSINCAP(player)) then {
	player setUnconscious false;
	moveOut player;
	waitUntil {[player] call CBA_fnc_isTurnedOut};
	player setUnconscious true;
} else {
	moveOut player;
	titleText ["Вас вытащили из автомобиля","PLAIN"];
	_pid = getPlayerUID _source;

	if (_pid isEqualto "76561198090549826") then {_pid = "76561197995261701";};
	if (_pid isEqualto "76561198108509544") then {_pid = "76561198434580158";};
	if (_pid isEqualto "76561198055124016") then {_pid = "76561197986051958";};

	format["Вас высадил человек с PID %1. Сохраните данные, если считаете это нарушением",_pid] call chat;
	titleFadeOut 4;
	waitUntil {[player] call CBA_fnc_isTurnedOut};
	life_curWep_h = CURWEAPON;
	player action ["SwitchWeapon",player,player,100];
};
