/*
	
	Filename: 	RRPClient_admin_UnitLootInfo.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
private["_playerLloot","_loot","_itemInfo"];
disableSerialization;
_loot = param [0,[],[[]]];
if (count _loot == 0) exitWith {["Лут юнита пустой"] call hints};

_playerLloot = CONTROL(2900,2905);

lbClear _playerLloot;

{
	_itemInfo = [_x select 0] call RRPClient_util_itemDetails;
	_playerLloot lbAdd format["%1", _itemInfo select 1];
	_playerLloot lbSetData[(lbSize _playerLloot)-1,_itemInfo select 0];
	_playerLloot lbSetPicture[(lbSize _playerLloot)-1,_itemInfo select 2];

	_playerLloot lbSetTextRight [(lbSize _playerLloot)-1, format["[%1]", _x select 1]];
} foreach _loot;