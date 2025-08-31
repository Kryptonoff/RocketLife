/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_messageName", "_messageParameters", "_publicMessage"];
_messageName = _this select 0;
_messageParameters = param [1, [] , [[]] ];
_publicMessage = [SessionID, _messageName, _messageParameters];
_publicMessage remoteExecCall ["RRPServer_system_dispatchIncomingMessage", 2];
_publicMessage = nil;
