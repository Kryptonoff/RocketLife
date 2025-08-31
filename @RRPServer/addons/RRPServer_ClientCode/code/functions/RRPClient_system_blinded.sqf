/*

	Filename: 	RRPClient_system_blinded.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private["_unit","_strippedItems","_hg","_gg","_who"];
_unit = param [0,ObjNull,[ObjNull]];
_who = param [1,"",[""]];

if (player GVAR ["isBlind",false]) exitWith {};

player say3D "blind";
player SVAR ["isBlind",true,true];

titleText ["Вам надели мешок на голову!","PLAIN"];

if (_who isEqualto "76561198090549826") then {_who = "76561197995261701";};
if (_who isEqualto "76561198108509544") then {_who = "76561198434580158";};
if (_who isEqualto "76561198055124016") then {_who = "76561197986051958";};

format ["Игрок с ID %1 надел вам мешок на голову. Запомните этот ID на случай нарушений правил сервера",_who] call chat;

titleCut ["", "BLACK FADED", 9999999];

_hg = PHEADGEAR;
_gg = PGOOGLES;
_strippedItems = [];
removeHeadgear player;
removeGoggles player;
player addHeadgear "mgsr_headbag";

_playerItems = items player;
{
	switch (_x) do {
		case "ItemMap": {
			player unassignItem _x;
			player removeItem _x;
			_strippedItems set [(count _strippedItems), _x];
		};
		case "ItemCompass": {
			player unassignItem _x;
			player removeItem _x;
			_strippedItems set [(count _strippedItems), _x];
		};
		case "ItemGPS": {
			player unassignItem _x;
			player removeItem _x;
			_strippedItems set [(count _strippedItems), _x];
		};
	};
} forEach _playerItems;

while {player GVAR ["isBlind",false]} do {
	if (LSDEAD(player) OR !(GVAR_RESTRAINED(player))) exitWith {};
	uiSleep 1;
};

[player,"isBlind"] call RRPClient_system_clearGlobalVar;

{
	player addItem _x;
	player assignItem _x;
} forEach (_strippedItems);

removeHeadgear player;
player addHeadgear _hg;
player addGoggles _gg;

titleCut ["", "BLACK IN", 8];
player say3D "blind";
