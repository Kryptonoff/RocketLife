/*

	Filename: 	RRPClient_system_buffMe.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
if (life_action_inUse) exitWith {};
private _item = param [0,"",[""]];
if (EQUAL(_item,"")) exitWith {};

private _buffType = "";
private _drug = "";
private _buffTime = 0;
private _chance = 0;

switch (_item) do {
	case "extItem_Buffout": {
		_buffType = "speed_buff";
		_drug = "";
		_buffTime = 4;
		_buffTime = ["buffout",_buffTime] call RRPClient_system_VIP;
		_chance = 0;
	};
	case "extItem_ItemJet": {
		_buffType = "speed_buff";
		_drug = "light";
		_buffTime = 10;
		_chance = 10;
	};
	case "extItem_ItemPsycho": {
		_buffType = "speed_buff";
		_drug = "hard";
		_buffTime = 15;
		_chance = 15;
	};

	case "extItem_ItemRadX": {
		_buffType = "radx_buff";
		_buffTime = 20;
	};

	case "extItem_ItemTurbo": {
		_buffType = "turbo_buff";
		_drug = "light";
		_chance = 10;
		_buffTime = 15;
	};

	case "extItem_redgull": {
		_buffType = "redgull_buff";
	};
};

if (_buffType == "") exitWith {};
_buffTime = _buffTime * 60;
_hint = "";
switch(true) do {
	case (_buffType == "speed_buff" && {life_speed_buff}): {_hint = "Вы уже находитесь под эффектом, ускоряющим регенерацию бодрости!"};
	case (_buffType == "radx_buff" && {life_radx_used}): {_hint = "Вы уже находитесь под эффектом защиты от радиации!"};
	case (_buffType == "turbo_buff" && {life_turbo_used}): {_hint = "Вы уже находитесь под эффектом от трубо!"};

	case (_buffType == "redgull_buff"): {
		call RRPClient_actions_inUse;
		titleText["Пьем Энергетик...","PLAIN"];
		player say3D "action_drink_soda";
		if (NOTINVEH(player)) then {
			player playAction "FT_Act_Drink_Water";
			uiSleep 10;
		} else {uiSleep 5};

		[_item] call RRPClient_system_removeItem;

		player setFatigue 0;
		_hint = "Энергетик дал вам заряд бодрости!";
		life_action_inUse = false;
	};

	case (_buffType == "speed_buff" && {!life_speed_buff}): {
		call RRPClient_actions_inUse;
		titleText["Принимаем препарат...","PLAIN"];

		if (NOTINVEH(player)) then {
			if (_item == "extItem_Buffout") then {
				player playAction "FT_Act_Eat_Bread";
				player say3D "action_painkiller_3";
				uiSleep 10;
			} else {
				call RRPClient_animation_kneelWork;
				uiSleep 6;
			};
		} else {uiSleep 5};

		[_item] call RRPClient_system_removeItem;
		life_action_inUse = false;

		["life_speed_buff","buff",_buffTime] spawn RRPClient_system_addBuff;

		if (_drug != "" && {random(100) < _chance}) then {
			switch(_drug) do {
				case "light": {
					RRPClientNarcomania = 1;
					_hint = "У вас появилась легкая зависимость..."
				};
				case "hard": {
					RRPClientNarcomania = 2;
					["adjective",1] call RRPClient_ach_gateway;
					_hint = "У вас появилась тяжелая зависимость..."
				};
			};
		};

		if (RRPClientThirst >= 30) then {
			RRPClientThirst = RRPClientThirst - 10;
		};
	};

	case (_buffType == "radx_buff" && [!life_radx_used]): {
		call RRPClient_actions_inUse;
		titleText["Принимаем препарат...","PLAIN"];

		if (NOTINVEH(player)) then {
			call RRPClient_animation_kneelWork;
			uiSleep 6;
		} else {uiSleep 5};

		[_item] call RRPClient_system_removeItem;
		life_action_inUse = false;

		["life_radx_used","buff",_buffTime] spawn RRPClient_system_addBuff;
	};

	case (_buffType == "turbo_buff" && {!life_turbo_used}): {
		call RRPClient_actions_inUse;
		titleText["Принимаем препарат...","PLAIN"];

		if (NOTINVEH(player)) then {
			call RRPClient_animation_kneelWork;
			uiSleep 6;
		} else {uiSleep 5};

		[_item] call RRPClient_system_removeItem;
		life_action_inUse = false;

		["life_turbo_used","buff",_buffTime] spawn RRPClient_system_addBuff;

		if (_drug != "" && {random(100) < _chance}) then {
			switch(_drug) do {
				case "light": {
					RRPClientNarcomania = 1;
					_hint = "У вас появилась легкая зависимость..."
				};
				case "hard": {
					RRPClientNarcomania = 2;
					_hint = "У вас появилась тяжелая зависимость..."
				};
			};
		};
	};
};
[_hint] call hints
