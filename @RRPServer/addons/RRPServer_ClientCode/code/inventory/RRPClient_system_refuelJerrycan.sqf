/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _oldItem = param [0,"",[""]];
if (life_action_inUse OR (call RRPClient_system_isInterrupted)) exitWith {};
call RRPClient_actions_inUse;

private _doAction = false;

private["_newItem","_progressName","_progressDone","_sleep","_sound"];

_cost = 50;
_progressName = format ["Пополняем канистру! Стоимость $%1!",_cost];
_progressDone = "Вы пополнили канистру.";
_sleep = 0.15; 
_newItem = "extItem_Fuelcan";
_doAction = true;
_sound = "action_refuel";

if !(([cursorObject] call RRPClient_util_getModelName) in (["fs_feed_F",
			"FuelStation_Feed_F",
			"FuelStation_01_pump_F",
			"FuelStation_02_pump_F",
			"fuelstation_01_pump_malevil_f",
			"FuelStation_03_pump_F",
			"fs_feed_F"] call RRPClient_util_array_toLower)) then 
{
	["Вы должны быть рядом с заправкой"] call hints;
	_doAction = false;
};

if (RRPClientCashMoney < _cost) then {_doAction = false;titleText [format["Стоимость заправки канистры $%1! У вас недостаточно средств!",_cost],"PLAIN"]};
if (!_doAction) exitWith {life_action_inUse = false;life_interrupted = false;};


disableSerialization;
private _cP = 0;
player say3D _sound;
titleText[_progressName,"PLAIN"];
while {true} do {
	_cP = _cP + 0.01;
	[_cP] call RRPClient_system_progressBar; 
	if (_cP >= 1 OR {life_interrupted} OR {(call RRPClient_system_isInterrupted)}) exitWith {}; 
	call RRPClient_animation_kneelWork;
	uiSleep _sleep; 
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; titleText["Действие отменено","PLAIN"]};

if !([_oldItem] call RRPClient_system_removeItem) exitWith {["Не удалось удалить предмет"] call hints};
if !([_newItem] call RRPClient_inventory_addItemToInventory) exitWith {["Не удалось добавить предмет"] call hints};
[[player,"cash","take",_cost],"system_moneyChange"] call RRPClient_system_hcExec;

titleText[_progressDone,"PLAIN"];
