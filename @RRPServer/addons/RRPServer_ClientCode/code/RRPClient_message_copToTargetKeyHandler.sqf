/*

	Filename: 	RRPClient_message_copToTargetKeyHandler.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
params ["_ctrl","_code","_shift","_ctrlKey","_alt"];
if (isNull (GVAR_UINS ["ExtremoRscMouseTarget",displayNull])) exitWith {false};

private _handled = false;
private _targetKey = 20; //T
private _exitKey = 1; //Esc

switch (true) do {
	case (EQUAL(_code,_targetKey)): {
		_handled = true;
		["ExtremoRscMouseTarget"] call RRPClient_gui_DestroyRscLayer;
		life_uiTarget = cursorObject;		
		[] spawn RRPClient_message_copToTargetSendMenu;
		"CopToTargetKeyHandler - life_uiTarget is target and close ExtremoRscMouseTarget" call RRPClient_system_log;
	};
	case (EQUAL(_code,_exitKey)): {
		_handled = true;
		["ExtremoRscMouseTarget"] call RRPClient_gui_DestroyRscLayer;
		"CopToTargetKeyHandler - close ExtremoRscMouseTarget" call RRPClient_system_log;
	};
};

_handled