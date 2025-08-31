/*

	Filename: 	RRPClient_inventory_repackMagazines.sqf
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
private _needToRepack = 0;
private _magazineSize = 0;
private _magazinesAmmoFull = magazinesAmmoCargo _container;
{
	if (_itemClass isEqualTo (_x select 0)) then {
		_magazineSize = _magazineSize + (_x select 1);
		if ((_x select 1) != _magazineSizeMax) then {_needToRepack = _needToRepack + 1};
	};
} forEach _magazinesAmmoFull;
if (_needToRepack < 2) exitWith {["Вам не нужно перебирать патроны"] call toastInfo};
if !(currentWeapon player isEqualTo "") then {call RRPClient_inventory_holsterWeapon};

call RRPClient_actions_inUse;

disableSerialization;
titleText ["Перебираем патроны", "PLAIN"];
(findDisplay 1000) closeDisplay 1;

private _cP = 0;
private _sleep = 0.01 * _needToRepack;

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

if (isNull objectParent player) then {
	player PlayActionNow "FT_Act_Gesture_Reset";
};

if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]};

player removeMagazines _itemClass;

_container addMagazineAmmoCargo [_itemClass, (floor (_magazineSize / _magazineSizeMax)), _magazineSizeMax];

if ((_magazineSize % _magazineSizeMax) > 0) then {
	_container addMagazineAmmoCargo [_itemClass, 1, floor (_magazineSize % _magazineSizeMax)];
};
titleText ["Вы перебрали патроны", "PLAIN"];
