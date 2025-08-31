/*
	
	Filename: 	RRPClient_system_canOpener.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_oldItem","_newItem","_progressName","_progressDone","_sleep","_sound","_doAction","_progress_rscLayer"];
_oldItem = param [0,"",[""]];

if (life_action_inUse OR (call RRPClient_system_isInterrupted)) exitWith {};
if !(EQUAL(CURWEAPON,"")) exitWith {["Освободите свои руки, уберите оружие за спину"] call hints};
call RRPClient_actions_inUse;

_doAction = false;

switch(true) do {
	case (_oldItem == "extItem_TacticalBacon"): {
		_progressName = "Открываем консерву бекона";
		_progressDone = "Вы открыли консерву.";
		_sleep = 0.05;		
		_newItem = "extItem_TacticalBacon_100";
		_doAction = true;
		_sound = "action_can_opener";
	};

	case (_oldItem == "extItem_BakedBeans"): {			
		_progressName = "Открываем тушенную фасоль";
		_progressDone = "Вы открыли тушенную фасоль.";
		_sleep = 0.05;		
		_newItem = "extItem_BakedBeans_100";
		_doAction = true;
		_sound = "action_can_opener";
	};
};

if (!_doAction) exitWith {life_action_inUse = false;life_interrupted = false;};
if ([_newItem, 1, backpackContainer player] call RRPClient_inventory_canAddItem < 1) exitWith {life_interrupted = false;life_action_inUse = false; ["Инвентарь переполнен"] call hints};

disableSerialization;
_cP = 0;

player say3D _sound;
titleText[_progressName,"PLAIN"];

while {true} do {	
	_cP = _cP + 0.01;
	[_cP] call RRPClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call RRPClient_system_isInterrupted)) exitWith {};	
	if (NOTINVEH(player)) then {
		player playActionNow "FT_Act_Craft_Thing";
	};
	uiSleep _sleep;
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

if (NOTINVEH(player)) then {
	player PlayActionNow "FT_Act_Gesture_Reset";
};

if (life_interrupted) exitWith {life_interrupted = false; titleText["Действие отменено","PLAIN"]};

if !([_oldItem] call RRPClient_system_removeItem) exitWith {["Не удалось удалить предмет"] call hints};
if !([_newItem] call RRPClient_inventory_addItemToInventory) exitWith {["Не удалось добавить предмет"] call hints};

titleText[_progressDone,"PLAIN"];