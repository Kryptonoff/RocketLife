/*
	Filename: 	RRPClient_system_receiveItem.sqf
	Project: 	Rimas Altis Life RPG
*/
#include "..\..\script_macros.hpp"
private["_unit","_val","_item","_from","_diff"];
_unit = _this select 0;
if (_unit != player) exitWith {};
_val = _this select 1;
_item = _this select 2;
_from = _this select 3;

_diff = [_item,(parseNumber _val),life_carryWeight,life_maxWeight] call RRPClient_system_calWeightDiff;

if (_diff != (parseNumber _val)) then {
	if ([true,_item,_diff] call RRPClient_system_handleInv) then {
		[format["%1 передал вам %2 но вы можете нести только %3 и %4 был возвращен.",GVAR_RNAME(_from),_val,_diff,((parseNumber _val) - _diff)],"error"] call hints;		
		[_from,_item,str((parseNumber _val) - _diff),_unit] remoteExecCall ["RRPClient_system_giveDiff",_from];
	} else {		
		[_from,_item,_val,_unit,false] remoteExecCall ["RRPClient_system_giveDiff",_from];
	};
} else {
	if ([true,_item,(parseNumber _val)] call RRPClient_system_handleInv) then {
		[format["%1 передал вам %2 %3 ",GVAR_RNAME(_from),_val,ITEM_NAME(_item)]] call hints;
	} else {
		[_from,_item,_val,_unit,false] remoteExecCall ["RRPClient_system_giveDiff",_from];
	};
};