/*

	Filename: 	RRPClient_system_containerActions.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
private _box = param [0,objNull,[objNull]];
if (isNull _box) exitWith {};

_box addAction ["<img image='\rimas_pack\icons\ui\s_icon_box.paa' /> Хранилище снаряжения",{[cursorObject] spawn RRPClient_inventory_open},"",0,false,false,"",'isNull objectParent _this', 4];
// _box addAction ["<img image='\rimas_pack\icons\ui\s_icon_box.paa' /> Хранилище ресурсов",RRPClient_system_openInventory,"",0,false,false,"",'isNull objectParent _this', 4];