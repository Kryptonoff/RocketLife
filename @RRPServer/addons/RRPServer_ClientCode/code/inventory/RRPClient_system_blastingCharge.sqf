/*
	Filename: 	RRPClient_system_blastingCharge.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	private _vault = param [0,ObjNull,[ObjNull]];
	if (isNull _vault) exitWith {};

	private _minCops = LIFE_SETTINGS(getNumber,"life_cop_min") * 2;
	if (["cop"] call RRPClient_system_playerCount < _minCops) throw format["Должно быть минимум %1 полицейских на острове, чтобы продолжить.",_minCops];
	if (typeOf _vault != LIFE_SETTINGS(getText,"life_vaultBoxClass")) throw "Это используется только на хранилище";
	if (_vault GVAR ["chargeplaced",false]) throw "На это хранилище уже установлена взрывчатка.";
	if (_vault GVAR ["safe_open",false]) throw "Дверь уже открыта";

	if !(["extItem_blastingcharge"] call RRPClient_system_removeItem) throw "В инвентаре нет необходимых предметов";

	_vault SVAR ["chargeplaced",true,true];
	[0,"Взрывной пакет установлен на хранилище Национального Резерва. Вы должны разминировать ее до конца таймера!"] remoteExecCall ["RRPClient_system_broadcast","cop" call RRPClient_util_getPlayersBySide];
	["Таймер запущен! Держите копов подальше от хранилища!"] call hints;
	private _handle = [] spawn RRPClient_system_demoChargeTimer;
	[] remoteExec ["RRPClient_system_demoChargeTimer",west];

	waitUntil {scriptDone _handle};
	uiSleep 0.9;
	if !(fed_bank GVAR ["chargeplaced",false]) throw "Бомба была обезврежена!";

	private _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
	[fed_bank,"chargeplaced"] call RRPClient_system_clearGlobalVar;
	fed_bank SVAR ["safe_open",true,true];

	throw "Хранилище открыто";
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};