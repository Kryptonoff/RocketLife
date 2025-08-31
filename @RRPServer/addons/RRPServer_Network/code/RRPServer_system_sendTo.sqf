/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_recipient", "_messageName", "_messageParameters", "_owner", "_publicMessage"];
_recipient = _this select 0;
_messageName = _this select 1;
_messageParameters = _this select 2;
switch (typeName _recipient) do 
{
	case "OBJECT": 
	{
		_owner = owner _recipient;
	};
	case "STRING": 
	{
		_owner = owner (_recipient call RRPServer_session_getPlayerObject);
	};
	default
	{
		_owner = _recipient;
	};
};
if (_owner > 0) then 
{
	_publicMessage = [_messageName, _messageParameters];
	_publicMessage remoteExecCall ["RRPClient_system_dispatchIncomingMessage", _owner];
};
_publicMessage = nil;