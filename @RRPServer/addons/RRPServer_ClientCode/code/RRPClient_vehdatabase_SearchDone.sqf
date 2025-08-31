/*

	Filename: 	RRPClient_vehdatabase_SearchDone.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5600)) exitWith {};
(CONTROL(5600,5603)) ctrlEnable true;
private _data = CONTROL(5600,5604);
_data ctrlSetStructuredText parseText "";

private _retArray = param [0,[],[[]]];
if (EQUAL(_retArray,[])) exitWith {_data ctrlSetStructuredText parseText "Ничего не найдено в базе данных"};
_retArray = _retArray select 0;
_retArray params ["_side","_classname","_type","_pid","_servermap","_name"];
_type = switch (_type) do {
	case "Car" : {"Наземная"};
	case "Air" : {"Воздушная"};
	case "Ship" : {"Водная"};
	default {"Не удалось определить"};
};
_side = switch (_side) do {
	case "cop" : {"Полиция"};
	case "med" : {"МЧС"};
	case "civ" : {"Гражданский"};
	case "reb" : {"Бандит"};
	default {"Не удалось определить"};
};
_data ctrlSetStructuredText parseText format ["<t size='1.5'>Данные о технике</t><br/><br/>
<t size='0.9' color='%7'>Модель: %1<br/>
Тип: %2<br/>
Сторона: %3<br/>
Остров: %4<br/>
Владелец: %5<br/>
PID: %6</t>",getText(configFile >> "CfgVehicles" >> _classname >> "displayName"),
_type,
_side,
_servermap,
_name,
_pid
];