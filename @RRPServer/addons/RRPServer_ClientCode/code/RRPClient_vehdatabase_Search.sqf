/*
	Filename: 	RRPClient_system_vehdatabaseSearch.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
disableSerialization;
if (isNull (findDisplay 5600)) exitWith {};
private _plate = ctrlText 5602;
if (EQUAL(_plate,"")) exitWith {["Введите регистрационный номер"] call hints};
(CONTROL(5600,5603)) ctrlEnable false;
["Отправка информации на сервер. Пожалуйста, подождите..."] call hints;

[_plate,player] remoteExecCall ["RRPServer_garage_vehSearch",2];
