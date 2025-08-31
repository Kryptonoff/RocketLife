/*
	Filename: 	fn_insurancePayRequest.sqf
	Project: 	Union Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		http://unionrp.ru/
*/


private ["_vid","_pid","_unit","_price","_vehicle","_type"];
params
[
	["_vid",-1,[0]],
	["_pid","",[""]],
	["_unit",ObjNull,[ObjNull]],
	["_type","",[""]]
];

str _this call RRPServer_util_debugConsole;

if ( isNull _unit || {_pid isEqualTo ""} || {_vid isEqualTo -1}) exitWith {
	life_action_inUse = false;
	(owner _unit) publicVariableClient "life_action_inUse";
	["Error. Что то пошло не так","error"] remoteExecCall ["RRPClient_system_hint",(owner _unit)];
};

format ["insurancePay:%1",_vid] call RRPServer_DB_fireAndForget;
_price = format ["getInsurPay:%1",_vid] call RRPServer_DB_selectSingleField;
if (_price isEqualTo 0) exitWith 
{

	life_action_inUse = false;
	(owner _unit) publicVariableClient "life_action_inUse";
	["У техники не указана цена, обратитесь к администрации за компенсацией","warning"] remoteExecCall ["RRPClient_system_hint",(owner _unit)];
};

[_price] remoteExecCall ["RRPClient_system_insurancePayDone",(owner _unit)];
