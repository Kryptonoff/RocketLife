/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/
 
private["_payload", "_messageName", "_messageParameters", "_config", "_allowedParameters", "_moduleName", "_functionName", "_functionCode", "_message"];
_payload = _this;
try 
{
	if (isNil "_payload") throw "Message payload is not defined!";
	if !(_payload isEqualType []) throw "Message payload is not an array!";
	if (count _payload != 2) throw format ["Wrong envelope field count! Payload: %1", _payload]; 
	_messageName = _payload select 0;
	_messageParameters = _payload select 1;
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
		if (_x != typeName (_messageParameters select _forEachIndex)) throw format ["Parameter type mismatch! Payload: %1", _payload];
	}
	forEach _allowedParameters;
	_moduleName = getText(_config >> "module");
	_functionName = format["RRPClient_%1_%2", _moduleName, _messageName];
	_functionCode = missionNamespace getVariable [_functionName,""];
	if (_functionCode isEqualTo "") then 
	{
		throw format ["Invalid function call! Called: %1", _functionName];
	};
	_messageParameters call _functionCode;
}
catch
{
	format["Network message dispatch failed: %1", _exception] call RRPClient_system_log;
	format["Client: Network message dispatch failed: %1 #1001", _exception] remoteExecCall ["RRPServer_util_debugConsole",2];
};
true