/*
	Filename: 	RRPClient_safe_Open.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
try {
	if (dialog) exitWith {}; //A dialog is already open.
	life_safeObj = param [0,ObjNull,[ObjNull]];
	if (isNull life_safeObj) exitWith {};
	if !(ISPSIDE("reb")) exitWith {};
	if ((life_safeObj GVAR ["safe",-1]) < 1) throw "Сейф пуст!";
	if (life_safeObj GVAR ["inUse",false]) throw "Сейф уже кем-то используется...";
	private _minCops = LIFE_SETTINGS(getNumber,"life_cop_min") * 2;
	if (["cop"] call RRPClient_system_playerCount < _minCops) throw format["Должно быть минимум %1 полицейских на острове, чтобы продолжить.",_minCops];
	if !(createDialog "UnionDialogFederalSafe") throw "Не удалось создать диалог.";
	disableSerialization;
	ctrlSetText[3501,("Инвентарь сейфа")];
	[life_safeObj] call RRPClient_safe_Inventory;
	life_safeObj SVAR ["inUse",true,true];
	life_safeObj spawn {
		waitUntil {isNull (findDisplay 3500)};	
		[_this,"inUse"] call RRPClient_system_clearGlobalVar;
	};
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};