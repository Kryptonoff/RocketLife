/*
	Project: Event Heandlers for RRP
	Author: FairyTale5571
	License: CC BY-ND
*/

params ["_id", "_uid", "_name", "_jip", "_owner"];

format ["Player %1 (%2) disconnected", _name,_uid] call RRPServer_util_log;
format ["clientDisconnect:%1",_uid] call RRPServer_DB_fireAndForget;

if (!isNil "HC_UID" && {_uid == HC_UID}) then
{
	RRPHC_enable = false;
	publicVariable "RRPHC_enable";
	HC_Life = false;
	publicVariable "HC_Life";
	[false] call RRPServer_system_transferOwnership;
	"Headless client disconnected! Broadcasted the vars!" call RRPServer_util_log;
	"Ready for receiving queries on the server machine." call RRPServer_util_log;
};
format ["Player %1 deleted",_name] call RRPServer_util_log;
true