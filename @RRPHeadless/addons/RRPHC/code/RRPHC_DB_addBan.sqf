/**
	Project: Ban via Database for Aurora Role Play
	Author: FairyTale5571
	License: CC BY-ND
	
	Using:
	[
		1: STRING - player to ban uid
		2: SCALAR - in minutes
		3: STRING - reason
	] remoteExec ["RRPHC_DB_addBan",2];
*/

params ["_uid","_time","_reason"];
format ["newBan:%1:%2:%3",_time,_reason,_uid] call RRPHC_DB_fireAndForget;
_getTime = ["Minutes",_time] call RRPHC_util_addDate;

_player = _uid call RRPClient_util_objectFromPlayerUID;
[_getTime,_reason] remoteExec ["RRPClient_system_banMeBitch",_player];