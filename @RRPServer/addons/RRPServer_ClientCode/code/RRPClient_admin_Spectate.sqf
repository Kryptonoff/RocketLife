/*
	Filename: 	RRPClient_admin_Spectate.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

while {dialog} do {
	closeDialog 0;
	uiSleep 0.01;
};

["Initialize", [player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
waitUntil {!isNull (findDisplay 60492)};
AM_Exit = (findDisplay 60492) displayAddEventHandler ["KeyDown","if ((_this select 1) == 68) then {(findDisplay 60492) displayRemoveEventHandler ['KeyDown',AM_Exit];['Слежение остановлено'] call hints;[""Terminate""] call BIS_fnc_EGSpectator;};false"];

["Вы перешли в режим наблюдателя.\n\n Нажмите F10 чтобы прекратить."] call hints;