/*
	Filename: 	RRPClient_system_healHospital.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
if(CASH < 100) exitWith {[format["У вас нет $%1 необходимых для лечения",100]] call hints};
titleText["Пожалуйста не двигайтесь","PLAIN"];
uiSleep 8;
if(player distance (_this select 0) > 5) exitWith {titleText["Вы должны быть не далее чем в 5 метрах от доктора во время лечения","PLAIN"]};
titleText["Вы полностью излечились.","PLAIN"];
player setDamage 0;
[[player,"cash","take",STR(100),[format["healHosp, Plr: %1 (%2) cash (take) 100",name player,steamid],"OtherMoneyLog"]],"system_moneyChange"] call RRPClient_system_hcExec;
