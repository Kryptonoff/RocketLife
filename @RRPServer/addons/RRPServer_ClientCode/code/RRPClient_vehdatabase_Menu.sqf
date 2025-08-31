/*

	Filename: 	RRPClient_vehdatabase_Menu.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP
	
*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5600)) then {
	if !(createDialog "UnionDialogVehData") exitWith {};
};

private _title = CONTROL(5600,5601);
_title ctrlSetText "База данных техники";

private _data = CONTROL(5600,5604);
_data ctrlSetStructuredText parseText "Введите регистрационный номер транспортного средства и нажмите Поиск";