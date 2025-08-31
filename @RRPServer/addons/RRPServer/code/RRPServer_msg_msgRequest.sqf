/*	file: fn_msgRequest.sqf	
Author: Silex		
Fills the Messagelist
*/
private ["_query","_queryResult","_uid","_player"];

_player = param [0,objNull,[objNull]];
_uid = getPlayerUID _player;
_time = diag_tickTime;
_queryResult = format ["msgRequest:%1",_uid] call RRPServer_DB_selectFull;
diag_log format ["msgReq - Result - Time:%1",(diag_tickTime) - _time];
if(count _queryResult == 0) exitWith {};
	{[1,_x] remoteExec ["RRPClient_system_smartphone",_player];
}forEach _queryResult;
diag_log format ["msgReq - End - Time:%1",(diag_tickTime) - _time];
