if !(params [
	["_machine", objNull, [objNull]]
]) exitWith {};

_machine setVariable ["don_user", "", true];
_machine setVariable ["multiplier", 0, true];
_machine setVariable ["donMachine", true];
[_machine] call RRPClient_don_update;