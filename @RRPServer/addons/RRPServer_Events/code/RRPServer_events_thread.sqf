/*
  Project: Aurora Role Play
  Author: FairyTale#5571
  License: CC BY-ND
*/

private["_events", "_eventKey", "_config", "_minTime", "_maxTime", "_randomTime", "_lastExecutedAt", "_minimumPlayersOnline", "_type", "_function", "_functionCode"];
_events = getArray (configFile >> "CfgEvents" >> "enabled");
"Event System Thread #1011" call RRPServer_util_debugConsole;
{
	format ["Event System Thread - %1 #1011",_x] call RRPServer_util_debugConsole;
	_eventKey = format ["Event%1LastExecutedAt", _x];
	_config = configFile >> "CfgEvents" >> _x;
	_minTime = getNumber (_config >> "minTime") * 60;
	_maxTime = getNumber (_config >> "maxTime") * 60;
	_randomTime = (_minTime max (random _maxTime));
	_lastExecutedAt = missionNamespace getVariable [_eventKey, 0];
	_condition = [getText (_config >> "condition")] call condition;
	if (time - _lastExecutedAt >= _randomTime) then
	{
		_minimumPlayersOnline = getNumber (_config >> "minOnlinePlayers");
		if ((count allPlayers) >= _minimumPlayersOnline) then 
		{
			_type = getText (_config >> "canSuspend");
			_function = getText (_config >> "fnc");
			_functionCode = call compile _function;
			if (_type isEqualTo 1) then 
			{
				format ["Spawning %1...", _function] call RRPServer_util_log;
				format ["Event System Thread - Spawning %1 #0100",_x] call RRPServer_util_debugConsole;
				[] spawn _functionCode;
			}
			else 
			{
				format ["Calling %1...", _function] call RRPServer_util_log;
				format ["Event System Thread - Calling %1 #0100",_x] call RRPServer_util_debugConsole;
				[] call _functionCode;
			};
			missionNamespace setVariable [_eventKey, time];
		}else{
			format ["Event System Thread - %1 Skip | not enough players #1001",_x] call RRPServer_util_debugConsole;
		};
	}else {
		format ["Event System Thread - %1 Skip | cooldown #1001",_x] call RRPServer_util_debugConsole;
	};
}forEach _events;
