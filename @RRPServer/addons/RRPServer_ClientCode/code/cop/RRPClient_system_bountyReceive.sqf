/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
params [
	["_val","",["",0]],
	["_total","",["",0]]
];

private _tax = 0;
private _money = _val;
private _txt = "";

if (_val > 50000) then {
	_tax = round(_money * (server_tax/100));
	ADD(life_tmp_tax,_money);
	SUB(_money,_tax);
	_txt = format [". Налог составил: $%1",[_tax] call RRPClient_util_numberText];
};

if (ISPSIDE("cop")) then {
	_money = ["priceUp",_money] call RRPClient_system_VIP;
};

if (EQUAL(_val,_total)) then {
	titleText[format["Вы получили награду $%1 за поимку преступника%2",[_money] call RRPClient_util_numberText,_txt],"PLAIN"];
} else {
	titleText[format["Вы получили награду за убийство преступника в размере $%1, если бы вы его арестовали, вы бы получили награду в размере $%2%3",[_money] call RRPClient_util_numberText,[_total] call RRPClient_util_numberText,_txt],"PLAIN"];
};

[[player,"atm","add",_money],"system_moneyChange"] call RRPClient_system_hcExec;

_log = format ["bountyReceive: atm (add) %3 to NAME:%1 (%2)",name player,steamid,_money];
["MoneyLog",_log] remoteExecCall ["FNC_A3_CUSTOMLOG",2];
