/*
	Filename: 	RRPClient_system_ticketGive.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
try{
	if(isNil {life_ticket_unit}) throw "Некого штрафовать";
	if(isNull life_ticket_unit) throw "Штраф выписан несуществующему человеку";
	private _val = ctrlText 2652;
	if(!([_val] call RRPClient_system_isnumber)) throw "Вы ввели неправильную сумму.";
	if((parseNumber _val) > 500000) throw "Сумма штрафа не может быть больше чем $500,000!";
	[0,"%1 выписал штраф в размере $%2 для %3",true,[GVAR_RNAME(player),[(parseNumber _val)] call RRPClient_util_numberText,GVAR_RNAME(life_ticket_unit)]] remoteExecCall ["RRPClient_system_broadcast",RCLIENT];
	[player,(parseNumber _val)] remoteExec ["RRPClient_system_ticketPrompt",life_ticket_unit];
	closeDialog 0;
}catch{
	["ErrorTitleAndText",[_exception]] call toast;
};