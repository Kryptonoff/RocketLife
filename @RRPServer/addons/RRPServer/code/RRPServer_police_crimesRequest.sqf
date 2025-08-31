/*
	Project: Police Systems for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _unit = param [0,objNull,[objNull]];
if (isNull _unit) exitWith {};
private _ret = [_unit] call RRPServer_ws_wantedPerson;
[_ret] remoteExec ["RRPClient_police_crimesResponse",remoteExecutedOwner];
