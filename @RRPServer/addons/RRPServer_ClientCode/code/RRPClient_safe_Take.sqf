/*
	Filename: 	RRPClient_safe_Take.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
try {
	disableSerialization;
	if ((lbCurSel 3502) == -1) throw "Вам необходимо выбрать предмет!";
	private _ctrl = CONTROL_DATA(3502);
	private _num = ctrlText 3505;
	private _safeInfo = life_safeObj GVAR ["safe",0];

	//Error checks
	if !([_num] call RRPClient_system_isnumber) throw "Неверный формат номера";
	_num = parseNumber(_num);
	if (_num < 1) throw "Вы не можете ввести значение ниже 1!";
	if (_ctrl != "goldbar") throw "Выне можете положить в сейф ничего кроме золота.";
	if (_num > _safeInfo) throw format[ "В сейфе отсутствует %1 золотых слитков!",_num];

	//Secondary checks
	_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call RRPClient_system_calWeightDiff;
	if (EQUAL(_num,0)) throw "Ваш инвентарь переполнен.";


	//Take it
	if !([true,_ctrl,_num] call RRPClient_system_handleInv) throw "Не удалось добавить в инвентарь.";
	life_safeObj SVAR ["safe",_safeInfo - _num,TRUE];
	[life_safeObj] call RRPClient_safe_Inventory;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};