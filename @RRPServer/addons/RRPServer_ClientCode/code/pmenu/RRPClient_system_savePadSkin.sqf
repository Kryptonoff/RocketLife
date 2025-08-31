/*
	
	Filename: 	RRPClient_system_savePadSkin.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"
params ["_control","_index"];
private _data = _control lbData _index;
if (_data isEqualTo "") exitWith {};
life_myPadSkinID = _data;
ctrlSetText [1206, M_CONFIG(getText,"CfgWallpaper",life_myPadSkinID,"path")];
[["life_myPadSkinID",life_myPadSkinID,getPlayerUID player],"session_updateSettings"] call RRPClient_system_hcExec;
