/*
	
	Filename: 	RRPClient_system_jerryRefuel.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/

private["_oldItem","_vehicle","_amount","_progressName","_progressDone","_sleep","_newItem","_sound","_error","_ui","_progressBar","_titleText","_cP","_progress_rscLayer"];
_oldItem = param [0,"",[""]];
_vehicle = param [1,objNull,[objNull]];

if (isNull _vehicle OR _oldItem == "") exitWith {};
if (life_action_inUse OR (call RRPClient_system_isInterrupted)) exitWith {};
if !([_vehicle] call RRPClient_system_isVehicleKind) exitWith {["Данный вид техники нельзя заправить"] call hints};
if (player distance _vehicle > 7.5) exitWith {["Вы слишком далеко от техники"] call hints};

call RRPClient_actions_inUse;

switch(true) do {
	case (_oldItem == "extItem_Fuelcan"): {
		_progressName = "Заправляем технику";
		_progressDone = "Вы заправили технику.";
		_sleep = 0.25;		
		_newItem = "extItem_Fuelcan_empty";
		_sound = "action_refuel";
	};
};

if ([_newItem, 1, backpackContainer player] call RRPClient_inventory_canAddItem < 1) exitWith {life_interrupted = false;life_action_inUse = false; ["Инвентарь переполнен"] call hints};

disableSerialization;
_cP = 0;

player say3D _sound;
titleText[_progressName,"PLAIN"];
while {true} do {
	_cP = _cP + 0.01;
	[_cP] call RRPClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call RRPClient_system_isInterrupted)) exitWith {};	
	call RRPClient_animation_kneelWork;
	uiSleep _sleep;	
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

["AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] call RRPClient_system_animDo;

if (life_interrupted) exitWith {life_interrupted = false; ["Действие было прервано"] call hints};

if !([_oldItem] call RRPClient_system_removeItem) exitWith 	{["Не удалось удалить предмет"] call hints};
if !([_newItem] call RRPClient_inventory_addItemToInventory) exitWith 	{["Не удалось добавить предмет"] call hints};

switch (true) do {
	case (_vehicle isKindOF "LandVehicle"): {_amount = 0.5};	
	case (_vehicle isKindOf "Air"): {_amount = 0.2};	
	case (_vehicle isKindOf "Ship"): {_amount = 0.35};
	default {_amount = 0.5};
};

if(!local _vehicle) then {
	[_vehicle,(fuel _vehicle) + _amount] remoteExecCall ["RRPClient_system_setFuel",_vehicle];
} else {
	_vehicle setFuel ((fuel _vehicle) + _amount);
};

titleText[_progressDone,"PLAIN"];