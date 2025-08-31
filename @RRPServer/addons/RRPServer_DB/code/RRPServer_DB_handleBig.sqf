/*
	Project: Async functions for extDB3
	Author: FairyTale5571
	License: CC BY-ND
*/

private["_key","_result","_pipe"];
_key = _this;
_time = diag_tickTime;
if(DB3_DEBUG) then { format ["HandleBig - %1",_parameters] call RRPServer_DB_debug;};
_result = "";
while{true} do
{
	_pipe = "extDB3" callExtension format["5:%1", _key];
	if(_pipe isEqualTo "") exitWith {};
	_result = _result + _pipe;
};
if(DB3_DEBUG) then {format ["HandleBig - Result Time:%1",(diag_tickTime) - _time] call RRPServer_DB_debug;};
(parseSimpleArray _result)