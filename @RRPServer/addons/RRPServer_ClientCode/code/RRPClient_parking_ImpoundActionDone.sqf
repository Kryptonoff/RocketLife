/*
	
	Filename: 	RRPClient_parking_ImpoundActionDone.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\script_macros.hpp"
life_impound_inuse = false;
private _price = LIFE_SETTINGS(getNumber,"life_impound_car");
_price = _price + (_price - ["StreetCleaner", _price] call RRPClient_perks_activatePerk);

[[player,"atm","add",_price],"system_moneyChange"] call RRPClient_system_hcExec;

_log = format ["vehParking: atm (add) %3 to NAME:%1 (%2)",name player,getPlayerUID player,_price];	
["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];


["InfoTitleAndText",["Конфискация",
	 format["Техника отправлена на штрафстоянку! Вы получили $%1 за очистку улиц!",[_price] call RRPClient_util_numberText]]
] call toast;
