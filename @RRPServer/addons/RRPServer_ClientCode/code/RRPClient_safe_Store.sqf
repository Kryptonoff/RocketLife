/*
	Filename: 	RRPClient_safe_Store.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
try {
	disableSerialization;
	private _ctrl = CONTROL_DATA(3503);
	private _num = ctrlText 3506;

	//Error checks
	if !([_num] call RRPClient_system_isnumber) throw "Неверный формат номера";
	_num = parseNumber(_num);
	if (_num < 1) throw "Вы не можете ввести значение ниже 1!";
	if (_ctrl != "goldbar") throw  "Выне можете положить в сейф ничего кроме золота.";
	if (_num > life_inv_goldbar) throw format[ "У вас нет %1 золотых слитков",_num];

	//Store it.
	if !([false,_ctrl,_num] call RRPClient_system_handleInv) throw  "Не удалось удалить предметы из инвентаря,чтобы положить в сейф.";
	private _safeInfo = life_safeObj GVAR ["safe",0];
	life_safeObj SVAR ["safe",_safeInfo + _num,true];

	[life_safeObj] call RRPClient_safe_Inventory;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};
