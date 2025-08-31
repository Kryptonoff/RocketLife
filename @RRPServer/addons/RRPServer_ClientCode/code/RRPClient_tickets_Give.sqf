/*	
	Filename: 	RRPClient_tickets_Give.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\script_macros.hpp"
try{
	if (isNil {life_ticket_unit}) throw "Ошибка";
	if (isNull life_ticket_unit) throw "Ошибка";
	private _val = ctrlText 5202;
	if !([_val] call RRPClient_system_isnumber) throw "Вы ввели неправильную сумму.";
	if ((parseNumber _val) > 500000) throw format[ "Сумма счета не может быть больше чем $%1!",[500000] call RRPClient_util_numberText];
	[0,format[ "%1 выписал счет в размере $%2 для %3",GVAR_RNAME(player),[(parseNumber _val)] call RRPClient_util_numberText,GVAR_RNAME(life_ticket_unit)]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
	[player,(parseNumber _val)] remoteExec ["RRPClient_tickets_Prompt",life_ticket_unit];
	closeDialog 0;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};