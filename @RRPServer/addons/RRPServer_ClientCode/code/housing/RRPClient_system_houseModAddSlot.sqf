/*
	Filename: 	RRPClient_system_houseModAddSlot.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
disableSerialization;
private _house = RRPClientSelectedHouse;
if (isNull _house) exitWith {closeDialog 0};

private _house_box = _house GVAR ["house_box",objNull];
if (isNull _house_box) exitWith { ["Хранилище закрыто. Отоприте его перед добавлением слотов."] call hints };

private _house_box_slots = _house_box GVAR ["house_box_slots",0];
private _numberCrates = M_CONFIG2(getNumber,"LifeCfgHousing",worldName,typeOf _house,"numberCrates");
if (_numberCrates <= _house_box_slots) exitWith 
{
	["ErrorTitleAndText",["Мой дом","Достигнуто максимум слотов!"]] call toast;

};

private _valToPay = 3000;
private _action = [
	parseText format ["Кол-во слотов в хранилище: %1 из %2<br/><br/>Вы уверены, что хотите добавить еще один слот? Это обойдется вам в $%3",_house_box_slots,_numberCrates,[_valToPay] call RRPClient_util_numberText],
	"Добавление слота",
	"Да",
	"Нет"
] call BIS_fnc_guiMessage;

if (_action) then 
{
	if (BANK < _valToPay) exitWith { ["У вас нет необходимой суммы на банковском счете"] call hints };
	[player,"atm","take",STR(_valToPay)] remoteExecCall ["RRPServer_system_moneyChange",2];
	
	_log = format ["houseModAddSlot: atm (take) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_valToPay];	
	["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
	
	_house_box_slots = _house_box_slots + 1;
	_house_box SVAR ["house_box_slots",_house_box_slots,true];
	
	[_house,_house_box_slots,player] remoteExecCall ["RRPServer_house_updateHouseSlots",2];
	closeDialog 0;
};