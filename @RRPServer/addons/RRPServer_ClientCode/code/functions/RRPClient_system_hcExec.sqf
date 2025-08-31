/*

	Filename: 	RRPClient_system_hcExec.sqf
	Project: 	Rimas Altis Life RPG
	Author:		Merrick & Affect
	Steam:		76561198006439083 & 76561198053094990
	Web:		Rimas RP

*/
#include "..\..\script_macros.hpp"

["HcExec",_this,false] call RRPClient_util_logArray;

params [
	["_vars",[],[[],objNull,0,""]],
	["_func","",[""]],
	["_call",true,[false]]
];

_ignore = ["system_moneyChange","system_keyManagement","garage_setPlate"];

if (_func isEqualTo "") exitWith {"hcExec - function is empty" call RRPClient_system_log};
if (_func in _ignore) exitWith {
	private _function = format ["RRPServer_%1",_func];
	private _target = 2;
	if (_call) then {
		_vars remoteExecCall [_function,2];
		diag_log format ["EXEC CALL: %1 - %2 - %3",_function,2,_vars];	
	} else {
		_vars remoteExec [_function,2];
		diag_log format ["EXEC: %1 - %2 - %3",_function,2,_vars];	
	};
};
private ["_function","_target"];
switch (true) do { 
	case (RRPHC_enable) : {
		format ["%1 called for HC, Args: %2",_func,_vars] call debugConsole;
		_function = format ["RRPHC_%1",_func];
		_target = HC_Life;
	}; 
	default {
		_function = format ["RRPServer_%1",_func];
		_target = 2;
	}; 
};

if (isNil "_function" OR {isNil "_target"}) exitWith {"hcExec - function is nil OR target isNil" call RRPClient_system_log};

if (_call) then {
	_vars remoteExecCall [_function,_target];
	diag_log format ["EXEC CALL: %1 - %2 - %3",_function,_target,_vars];	
} else {
	_vars remoteExec [_function,_target];
	diag_log format ["EXEC: %1 - %2 - %3",_function,_target,_vars];	
};
