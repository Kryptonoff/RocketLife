/*

	Filename: 	RRPClient_inventory_setTitle.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_titleExternal", "", [""]],
	["_titlePlayer", "", [""]]
];
if (_titleExternal isEqualTo "") then {
	_titleExternal = switch (true) do {
		case (typeOf fl_inv_currentContainer isEqualTo "Land_LuggageHeap_03_F"): {format["Контейнер дома - Слоты: %1", (fl_inv_currentContainer GVAR ["house_box_slots", 0])]};
		case (typeOf fl_inv_currentContainer isEqualTo LIFE_SETTINGS(getText,"life_trunkClass")): {format["Контейнер банды - Слоты: %1", (fl_inv_currentContainer GVAR ["slots", 0])]};
		case (fl_inv_currentContainer getVariable ["shelter_container", false]): {format["Контейнер убежища - Уровень: %1", sr_shelter_container]};
		case (fl_inv_currentContainer getVariable ["safe_container", false]): {format["Сейфовая ячейка - Слоты: %1", sr_safe_slots]};
	
		default {getText(configFile >> "CfgVehicles" >> (typeOf fl_inv_currentContainer) >> "displayName")};
	};
};
if (_titlePlayer isEqualTo "") then {_titlePlayer = "Рюкзак"};


private _display = findDisplay 1000;
private _titleExternalBackground = _display displayCtrl 1019;
private _titlePlayerBackground = _display displayCtrl 1020;

_titleExternalBackground ctrlSetText _titleExternal;
_titlePlayerBackground ctrlSetText _titlePlayer;