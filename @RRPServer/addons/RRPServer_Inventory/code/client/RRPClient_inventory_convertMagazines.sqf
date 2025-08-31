/*

	Filename: 	RRPClient_inventory_convertMagazines.sqf
	Project: 	Fatum Altis Life RPG
	Author:		UncleFedor
	E-mail:		dev@extremo.club
	Web:		http://altislife.extremo.club/

*/
#include "..\..\script_macros.hpp"
params [
	["_itemClass", "", [""]]
];

private _magazineSizeMax = getNumber (configfile >> "CfgMagazines" >> _itemClass >> "count");
private _container = backpackContainer player;
private _needToRemove = [];
private _magazineSize = 0;
private _magazineSizeOriginal = 0;
private _magazinesAmmoFull = magazinesAmmoCargo _container;
{
	if ((((_x select 0) call RRPClient_inventory_itemType) select 1) in ["Bullet", "ShotgunShell"] AND _x#0 isNotEqualTo _itemClass) then {
		_magazineSize = _magazineSize + (_x select 1);
		_needToRemove pushBackUnique (_x select 0);	
	} else {
		if (_x#0 isEqualTo _itemClass) then {_magazineSizeOriginal = _magazineSizeOriginal + _x#1};
	};
} forEach _magazinesAmmoFull;

if (_needToRemove isEqualTo []) exitWith {hint "У вас нет магазинов для конвертации"};
_needToRemove pushBack _itemClass;

_magazineSize = round (_magazineSize * 0.25) + _magazineSizeOriginal;
private _fullMagazines = floor (_magazineSize / _magazineSizeMax);
private _lastNotFullMagazine = floor (_magazineSize % _magazineSizeMax);
private _lastNotFullMagazineText = ["", format[" и один магазин с %1 патронов", _lastNotFullMagazine]] select (_lastNotFullMagazine isNotEqualTo 0);

private _action = [
	format["Вы собираетесь конвертировать все имеющиеся магазины (кроме заряженных) в магазины типа '%1' с коэффициентом 2 к 1. Получится %2 полных магазинов%3. Уверены?", _itemClass call RRPClient_inventory_getItemName, _fullMagazines, _lastNotFullMagazineText],
	"Конвертация магазинов",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if !(_action) exitWith {};

if !(currentWeapon player isEqualTo "") then {call RRPClient_inventory_holsterWeapon};

call RRPClient_actions_inUse;

disableSerialization;
titleText ["Конвертируем магазины", "PLAIN"];
(findDisplay 1000) closeDisplay 1;

private _cP = 0;
private _sleep = 0.01 * count _needToRemove;

while {true} do {	
	_cP = _cP + 0.01;
	[_cP] call RRPClient_system_progressBar;	
	if (_cP >= 1 OR life_interrupted OR (call RRPClient_system_isInterrupted)) exitWith {};	
	if (isNull objectParent player) then {
		player playActionNow "FT_Act_Craft_Thing";
	};
	uiSleep _sleep;
};

["life_progress"] call RRPClient_gui_DestroyRscLayer;
life_action_inUse = false;

if (call RRPClient_system_isInterrupted) exitWith {life_interrupted = false};

if (isNull objectParent player) then {player PlayActionNow "FT_Act_Gesture_Reset"};

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

{player removeMagazines _x} forEach _needToRemove;

_container addMagazineAmmoCargo [_itemClass, _fullMagazines, _magazineSizeMax];
if (_lastNotFullMagazine > 0) then {_container addMagazineAmmoCargo [_itemClass, 1, _lastNotFullMagazine]};

titleText ["Вы конвертировали магазины", "PLAIN"];