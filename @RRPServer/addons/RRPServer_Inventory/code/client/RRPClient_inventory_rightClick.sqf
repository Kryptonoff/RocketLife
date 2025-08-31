/*

	Filename: 	RRPClient_inventory_rightClick.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]],
	["_itemAmount", 1, [0]],
	["_itemAmmo", -1, [-1]]
];
private _display = findDisplay 1000;
if !(isNull (_display displayCtrl 9300)) exitWith {};

private _mousePos = getMousePosition;
private _posX = (_mousePos select 0) - 0.015;
private _posY = (_mousePos select 1) - 0.015;
private _count = 0;

private _ctrlBackground = _display ctrlCreate ["RscText", 9300];
_ctrlBackground ctrlSetBackgroundColor [0, 0, 0, 0.75];
[_itemClass] call RRPClient_inventory_itemType params ["_itemCategory", "_itemType"];

if (_itemCategory != "Magazine" OR _itemType isEqualTo "UnknownMagazine") then {
	_ctrlBtn = _display ctrlCreate ["RscActiveText", 9301, _ctrlBackground];
	_ctrlBtn ctrlSetPosition [_posX, _posY, 0.2, 0.05];
	_ctrlBtn ctrlSetTextColor [1, 1, 1, 0.85];
	_ctrlBtn ctrlSetActiveColor [1, 1, 1, 1];
	_ctrlBtn ctrlSetText "Использовать";
	_ctrlBtn ctrlSetEventHandler ["ButtonClick", format["['%1', cursorObject] spawn RRPClient_inventory_itemAction; [] spawn RRPClient_inventory_closeRightMenu", _itemClass]];
	_ctrlBtn ctrlCommit 0;

	_count = _count + 1;
};

if (_itemCategory isEqualTo "Magazine" AND _itemType != "UnknownMagazine") then {
	_ctrlBtn = _display ctrlCreate ["RscActiveText", 9302, _ctrlBackground];
	_ctrlBtn ctrlSetPosition [_posX, _posY + (_count * 0.05), 0.2, 0.05];
	_ctrlBtn ctrlSetTextColor [1, 1, 1, 0.85];
	_ctrlBtn ctrlSetActiveColor [1, 1, 1, 1];
	_ctrlBtn ctrlSetText "Перепаковать";
	_ctrlBtn ctrlSetEventHandler ["ButtonClick", format["['%1'] spawn RRPClient_inventory_repackMagazines; [] spawn RRPClient_inventory_closeRightMenu", _itemClass]];
	_ctrlBtn ctrlCommit 0;

	_count = _count + 1;
};

if (_itemCategory isEqualTo "Magazine" AND _itemType != "UnknownMagazine" AND sr_shelter_craft isEqualTo 3) then {
	_ctrlBtn = _display ctrlCreate ["RscActiveText", 9303, _ctrlBackground];
	_ctrlBtn ctrlSetPosition [_posX, _posY + (_count * 0.05), 0.2, 0.05];
	_ctrlBtn ctrlSetTextColor [1, 1, 1, 0.85];
	_ctrlBtn ctrlSetActiveColor [1, 1, 1, 1];
	_ctrlBtn ctrlSetText "Конвертировать";
	_ctrlBtn ctrlSetEventHandler ["ButtonClick", format["['%1'] spawn RRPClient_inventory_convertMagazines; [] spawn RRPClient_inventory_closeRightMenu", _itemClass]];
	_ctrlBtn ctrlCommit 0;

	_count = _count + 1;
};

if (_count != 0) then {
	_ctrlBackground ctrlSetPosition [_posX, _posY, 0.2, (_count * 0.055)];
	_ctrlBackground ctrlCommit 0;
};

ctrlSetFocus (_display displayCtrl 6215);
/*private _ctrlBtn = _display ctrlCreate ["RscActiveText", 1302];
_ctrlBtn ctrlSetPosition [_mousePos select 0, (_mousePos select 1) + 0.05, 0.2, 0.05];
_ctrlBtn ctrlSetTextColor [1, 1, 1, 1];
_ctrlBtn ctrlSetText "Перепаковать";
_ctrlBtn buttonSetAction "hint 'Жмяк'";
_ctrlBtn ctrlCommit 0;*/