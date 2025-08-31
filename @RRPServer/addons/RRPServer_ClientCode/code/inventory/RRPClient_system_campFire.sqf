/*
	Filename: 	RRPClient_system_campFire.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_campFire","_item","_progressName","_progressDone","_sleep","_sound","_ui","_progressBar","_titleText","_cP","_progress_rscLayer"];
_item = param [0,"",[""]];

if (life_action_inUse OR (call RRPClient_system_isInterrupted)) exitWith {};
private _camps = nearestObjects[getPosATL player,["Campfire_burning_F"],30];
if (count _camps > 0) exitWith {["В радиусе 30 метров уже есть костер. Воспользуйтесь им."] call hints};
call RRPClient_actions_inUse;

_progressName = "Создаем костер";
_progressDone = "Костер готов";
_sleep = 0.05;
_sound = "action_crafting_0";

disableSerialization;
_cP = 0;

player say3D _sound;
titleText[_progressName,"PLAIN"];
while {true} do
{
	_cP = _cP + 0.01;
	[_cP,"process"] call RRPClient_system_progressBar;
	if (_cP >= 1 OR life_interrupted OR (call RRPClient_system_isInterrupted)) exitWith {};
	player playActionNow "FT_Act_Craft_Thing";
	uiSleep _sleep;
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

player PlayActionNow "FT_Act_Gesture_Reset";

if (life_interrupted) exitWith {life_interrupted = false; titleText["Действие отменено","PLAIN"]};
if !([_item] call RRPClient_system_removeItem) exitWith {["В инвентаре нет необходимых предметов"] call hints};

_campFire = createVehicle ["Campfire_burning_F",getPosATL player,[],0,"FORM"];
waitUntil {!isNull _campFire};

titleText[_progressDone,"PLAIN"];