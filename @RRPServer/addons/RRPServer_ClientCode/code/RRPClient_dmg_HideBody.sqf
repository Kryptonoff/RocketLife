/*

	Filename: 	RRPClient_dmg_HideBody.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private ["_unit"];
_unit = cursorObject;
if !(EQUAL(CURWEAPON,"Extremo_Tool_Shovel")) exitWith {["ErrorTitleOnly",["У вас должна быть лопата в руках!"]] call toast};
if (isNull _unit) exitWith {};
call RRPClient_actions_inUse;
disableSerialization;
private _cP = 0;
titleText["Закапываем грешника","PLAIN"];
while {true} do {
	_cP = _cP + 0.05;
	[_cP,"gather"] call RRPClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call RRPClient_system_isInterrupted)) exitWith {};
	player forceWeaponFire ["Extremo_Tool_Shovel", "Hack"];
	uiSleep 0.5;
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;


if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

if (life_interrupted) exitWith {life_interrupted = false; titleText["Вы прервали действие","PLAIN"];};

titleText["Захоронение прошло успешно!","PLAIN"];

deleteVehicle _unit;