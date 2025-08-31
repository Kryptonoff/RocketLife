/*
	Filename: 	RRPClient_evh_inventoryOpened.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
params ["_unit","_container","_secondaryContainer"];

if true exitWith {[_container] spawn RRPClient_inventory_open; true};

try
{
	private _isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
	if (EQUAL(_isPack,1)) throw "Вы не имеете права смотреть в чужой рюкзак!";
	if (_container isKindOf "MUTANT_HUM") throw "Нечего лутать...";
	if (_secondaryContainer isKindOf "MUTANT_HUM") throw "Нечего лутать...";
	if (RRPClientIsPlayingRussianRoulette) throw "Немного занят...";
	if ([_container] call RRPClient_system_isVehicleKind && {!(_container in life_vehicles) && {EQUAL((locked _container),2)}} ) throw "Вы не можете заглянуть в багажник когда автомобиль закрыт.";
	if ([_secondaryContainer] call RRPClient_system_isVehicleKind && {!(_secondaryContainer in life_vehicles) && {EQUAL((locked _secondaryContainer),2)}} ) throw "Вы не можете заглянуть в багажник когда автомобиль закрыт.";
	if (life_action_inUse OR (call RRPClient_system_isInputBlocked)) throw "Дождитесь окончания действия";
	if ([_container] call RRPClient_system_isContainerInUse) throw "Уже кем-то открыто";
	[] spawn RRPClient_invExt_openMenu;
	true call RRPClient_gui_util_blur;
	playSound "zipper";
	life_currentContainer = _container;
	life_currentSecondaryContainer = _secondaryContainer;
	life_ContainerOpened = true;
	[life_currentContainer,"openedByUnit",steamid] call CBA_fnc_setVarNet;
	[life_currentSecondaryContainer,"openedByUnit",steamid] call CBA_fnc_setVarNet;

	life_currentContainer spawn {
		uiSleep 0.5;
		while {!isNull _this} do {
			if (isNil {_this GVAR "openedByUnit"}) exitWith {closeDialog 0};
			if (_this GVAR ["openedByUnit",""] != steamid) exitWith {["DUPE",[format["Inventory dupe possible OpenedByUnit - %1 But STEAMID - %2",_this GVAR ["openedByUnit",""],steamid]]] remoteExecCall ["TON_fnc_customLog",RSERV]; closeDialog 0};
			uiSleep 0.03;
		};
	};
	life_currentSecondaryContainer spawn {
		uiSleep 0.5;
		while {!isNull _this} do {
			if (isNil {_this GVAR "openedByUnit"}) exitWith {closeDialog 0};
			if (_this GVAR ["openedByUnit",""] != steamid) exitWith {["DUPE",[format["Inventory dupe possible OpenedByUnit - %1 But STEAMID - %2",_this GVAR ["openedByUnit",""],steamid]]] remoteExecCall ["TON_fnc_customLog",RSERV]; closeDialog 0};
			uiSleep 0.03;
		};
	};
	false
}catch{
	["ErrorTitleAndText",[_exception]] call SmartClient_gui_toaster_addTemplateToast;
	true
};
