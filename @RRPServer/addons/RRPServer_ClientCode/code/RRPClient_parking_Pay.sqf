/*
	
	Filename: 	RRPClient_parking_Pay.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
try
{
	disableSerialization;
	_display = findDisplay 5700;
	if (EQUAL((lbCurSel 5702),-1)) throw "Вы ничего не выбрали";
	private _vid = CONTROL_VALUE(5702);
	_hash = _display getVariable "cache";
	_data = _hash get _key;
	_data params ["_classname","_parking","_plate"]; 
	if (EQUAL(_plate,"")) throw "Номер не указан";
	if (EQUAL(_parking,[])) throw "Информация о штрафе не указана";
	private _price = _parking select 0;
	if (BANK < _price) throw "Недостаточно денег на банковском счете";
	closeDialog 0;
	["InfoTitleAndText",["Отправка информации на сервер. Пожалуйста, подождите..."]] call toast;
	[[_vid,_price,netId player],"garage_vehicleParkingPay"] call RRPClient_system_hcExec;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};
true
