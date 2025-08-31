/*
	Project: Companies for Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

#include "..\..\script_macros.hpp"
params [
	["_done",false,[true]],
	["_message",[],["",[]]]
];

/*
	RRPClientLTDsData
	#1 -SCALAR = id
	#2 -STRING = ltdName
	#3 -SCALAR = bank
*/

disableSerialization;
life_action_inUse = false;

if (_done) then 
{
	[player,"atm","take",STR(1000)] remoteExecCall ["RRPServer_system_moneyChange",2];
	if (_message isEqualType []) then {RRPClientLTDsData = _message};
	["SuccessTitleAndText",["Бизнес",format["Поздравляем! Вы стали владельцем фирмы ""%1""",RRPClientLTDsData select 1]]] call toast;	
	['business',1] call RRPClient_ach_gateway;
	closeDialog 0;
} else {
	(CONTROL(7100,7103)) ctrlEnable true;
	if (_message isEqualType "") then {["ErrorTitleAndText",["Бизнес",_message]] call toast};
};