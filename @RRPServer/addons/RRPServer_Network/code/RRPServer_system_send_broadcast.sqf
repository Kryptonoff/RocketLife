/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_messageName", "_messageParameters", "_publicMessage"];
params ["_messageName", "_messageParameters"];
_publicMessage = [_messageName, _messageParameters];
_publicMessage remoteExecCall ["RRPClient_system_dispatchIncomingMessage", -2];
_publicMessage = nil;