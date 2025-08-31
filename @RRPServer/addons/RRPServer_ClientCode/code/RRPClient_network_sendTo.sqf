/*

	Filename: 	RRPClient_network_sendTo.sqf
	Project: 	Rimas Role Play
	Author:		FairyTale5571
	E-mail:		a3atlaslife@gmail.com

*/

params [
	["_vars",[],[[]]],
	["_func","",[""]],
	["_call",true,[false]]
];
if (_func isEqualTo "") exitWith {"hcExec - function is empty" call RRPClient_system_log};

private ["_function","_target"];
switch (true) do 
{
	case (RRPHC_enable) : {
		_function = format ["RRPHC_%1",_func];
		_target = HC_Life;
	}; 
	default {
		_function = format ["%1_%2",_tag,_func];
		_target = 2;
	}; 
};

if (isNil "_function" OR isNil "_target") exitWith {"hcExec - function is nil OR target isNil" call RRPClient_system_log};

if (_call) then {
	_vars remoteExecCall [_function,_target];	
} else {
	_vars remoteExec [_function,_target];	
};