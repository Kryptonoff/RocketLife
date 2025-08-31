/*

	Filename: 	RRPClient_message_copToTargetMenu.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
if (life_action_inUse) exitWith {};
call RRPClient_actions_inUse;
disableSerialization;
["ExtremoRscMouseTarget","PLAIN"] call RRPClient_gui_CreateRscLayer;
private _uiDisp = GVAR_UINS ["ExtremoRscMouseTarget",displayNull];
private _mouseText = _uiDisp displayCtrl 666001;
private _infoText = _uiDisp displayCtrl 666002;

_infoText ctrlSetStructuredText parseText format ["<t size='1.15' align='center' valign='middle'><br/>Выберите цель и нажмите <t color='#ffd200'>T</t><br/>Нажмите <t color='#f30404'>Esc</t> чтобы выйти</t>"];
_mouseText ctrlSetStructuredText parseText "";
life_uiTarget = objNull;
CTTM_EHId = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call RRPClient_message_copToTargetKeyHandler"];

waitUntil {
	if ([cursorObject] call RRPClient_system_isVehicleKind) then {
		_mouseText ctrlSetStructuredText parseText format ["<t align='center' size='1.5'>%1</t>",getText(configFile >> "CfgVehicles" >> (typeOf cursorObject) >> "displayName")];
	} else {_mouseText ctrlSetStructuredText parseText ""};
	uiSleep 0.1;
	isNull (GVAR_UINS ["ExtremoRscMouseTarget",displayNull]) OR call RRPClient_system_isInterrupted OR life_interrupted
};

life_action_inUse = false;

if (call RRPClient_system_isInterrupted OR life_interrupted) then {
	life_interrupted = false;
	["ExtremoRscMouseTarget"] call RRPClient_gui_DestroyRscLayer;
};

(findDisplay 46) displayRemoveEventHandler ["KeyDown", CTTM_EHId];