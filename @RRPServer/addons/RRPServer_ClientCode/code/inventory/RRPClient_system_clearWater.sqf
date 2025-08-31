/*
	
	Filename: 	RRPClient_system_clearWater.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

private["_clearComponent","_itemsOld","_newItem","_progressName","_progressDone","_sleep","_sourcesArray","_source","_error","_sound","_doAction","_progress_rscLayer"];
_clearComponent = param [0,"",[""]];

if (life_action_inUse OR (call RRPClient_system_isInterrupted)) exitWith {};
call RRPClient_actions_inUse;

_error = false;
_doAction = false;

switch(true) do {
	case (_clearComponent == "extItem_Waterpure"): {
		switch(true) do {
			case ("extItem_canteen_dirty" in (magazines player)): {				
				_progressName = "Очищаем фляжку с грязной водой";
				_progressDone = "Вы очистили воду во фляжке.";
				_sleep = 0.05;
				_itemsOld = [_clearComponent,"extItem_canteen_dirty"];
				_newItem = "extItem_canteen_clean_3";
				_doAction = true;
				_sound = "action_painkiller_0";
			};
			case ("extItem_bottle_dirty" in (magazines player)): {
				["extItem_Waterpure","extItem_bottle_dirty"] spawn RRPClient_system_clearWater;
				_progressName = "Очищаем бутылку с грязной водой";
				_progressDone = "Вы очистили воду в бутылке.";
				_sleep = 0.05;
				_itemsOld = [_clearComponent,"extItem_bottle_dirty"];
				_newItem = "extItem_bottleclean_100";
				_doAction = true;
				_sound = "action_painkiller_0";
			};
			default {["У вас нет грязной воды для очистки"] call hints};
		}; 
	};
};

if (!_doAction) exitWith {life_action_inUse = false;life_interrupted = false;};
if ([_newItem, 1, backpackContainer player] call RRPClient_inventory_canAddItem < 1) exitWith {life_interrupted = false;life_action_inUse = false; ["Инвентарь переполнен"] call hints };

player say3D _sound;
disableSerialization;
_cP = 0;
titleText[_progressName,"PLAIN"];
while {true} do {	
	_cP = _cP + 0.01;	
	[_cP] call RRPClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call RRPClient_system_isInterrupted))  exitWith {};	
	if (isNull objectParent player) then {
		player playActionNow "FT_Act_Craft_Thing";
	};
	uiSleep _sleep;
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

if (isNull objectParent player) then {
	player PlayActionNow "FT_Act_Gesture_Reset";
};

if (life_interrupted) exitWith {life_interrupted = false; titleText["Действие отменено","PLAIN"]};

{	
	if !([_x] call RRPClient_system_removeItem) exitWith {_error = true};
} forEach _itemsOld;

if (_error) exitWith {titleText["В инвентаре нет необходимых предметов","PLAIN"];};
[_newItem] call RRPClient_inventory_addItemToInventory;
titleText[_progressDone,"PLAIN"];