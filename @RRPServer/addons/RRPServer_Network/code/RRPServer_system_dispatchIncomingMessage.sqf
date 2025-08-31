/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_payload", "_sessionId", "_messageName", "_messageParameters", "_playerBySessionId", "_sessionID", "_SessionID", "_config", "_allowedParameters", "_moduleName", "_functionName", "_functionCode"];
_payload = _this;
try
{
	if (isNil "_payload") throw "Message payload is not defined!";
	if !(_payload isEqualType []) throw "Message payload is not a array!";
	if (count _payload != 3) throw format ["Wrong envelope field count! Payload: %1", _payload];
	_sessionId = _payload select 0;
	_messageName = _payload select 1;
	_messageParameters = _payload select 2;
	if (_messageName isEqualTo "startSessionRequest") then
	{
		_playerBySessionId = _sessionID call RRPServer_session_getPlayerObject;
		_SessionID = _playerBySessionId getVariable ["SessionID", -1];
		if !(_SessionID isEqualTo -1) throw "Trying to get a second session ID!";
	}
	else
	{
		if (count _sessionId != 8) throw format ["Invalid session ID found! Payload: %1", _payload];
		if !(_sessionId call RRPServer_session_isRegisteredId) throw format ["Unknown session ID found! Payload: %1", _payload];
	};
	if (isClass (missionConfigFile >> "CfgNetwork" >> _messageName)) then
	{
		_config = missionConfigFile >> "CfgNetwork" >> _messageName;
	}
	else
	{
		if (isClass (configFile >> "CfgNetwork" >> _messageName)) then
		{
			_config = configFile >> "CfgNetwork" >> _messageName;
		}
		else
		{
			throw format ["Forbidden message name! Payload: %1", _payload];
		};
	};
	_allowedParameters = getArray (_config >> "payloads");
	if (count _messageParameters != count _allowedParameters) throw format ["Parameter count mismatch! Payload: %1", _payload];
	{
		if (_x != typeName (_messageParameters select _forEachIndex)) throw format ["Parameter type mismatch! Index %1, Required %2, Found %3, Payload: %4", _forEachIndex, _x, (typeName (_messageParameters select _forEachIndex)), _payload];
	}
	forEach _allowedParameters;
	_moduleName = getText (_config >> "module");
	_functionName = format ["RRPServer_%1_%2", _moduleName, _messageName];
	_functionCode = missionNamespace getVariable [_functionName, ""];
	if (_functionCode isEqualTo "") then
	{
		throw format ["Invalid function call! Called: %1", _functionName];
	};
	[_sessionId, _messageParameters] call _functionCode;
}
catch
{
	format["Network message dispatch failed: %1", _exception]  call RRPServerNetwork_util_log;
	format["Server: Network message dispatch failed: %1 #1001", _exception] call RRPServer_util_debugConsole;
};
true
