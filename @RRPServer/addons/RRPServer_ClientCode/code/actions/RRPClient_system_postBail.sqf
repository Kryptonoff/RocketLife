/*
	Filename: 	RRPClient_system_postBail.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private _unit = param [1,ObjNull,[ObjNull]];
if !(isNil "life_canpay_bail" && life_is_arrested  && life_jail_time > 0) exitWith {};
if (life_bail_paid) exitWith {};
if (isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if (!isNil "life_canpay_bail") exitWith {["Вы должны провести в тюрьме по крайней мере 3 минуты, прежде чем выйти под залог."] call hints};
if (BANK < life_bail_amount) exitWith {[format["На вашем банковском счете нету $%1, необходимых для выхода под залог",life_bail_amount]] call hints};

[[player,"atm","take",STR(life_bail_amount),[format["PostBail: Plr %2 (%3), ATM take (%1)",life_bail_amount,name player,steamid],"OtherMoneyLog"]],"system_moneyChange"] call RRPClient_system_hcExec;
_log = format ["PostBail: Take (atm) %3 to NAME:%1 (%2)",name player,steamid,life_bail_amount];	
["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
life_bail_paid = true;
[0,"%1 заплатил залог!",true,[GVAR_RNAME(player)]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
