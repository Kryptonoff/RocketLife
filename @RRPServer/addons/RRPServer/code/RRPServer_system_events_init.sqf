addMissionEventHandler ["PlayerConnected",{_this call RRPServer_event_onPlayerConnected; false;}];
addMissionEventHandler ["PlayerDisconnected",{_this call RRPServer_event_onPlayerDisconnected; false;}];
addMissionEventHandler ["HandleDisconnect",{_this call RRPServer_system_clientDisconnect; false;}];

addMissionEventHandler ["EntityKilled", {
	params ["_killed", "_killedBy", "_instigator"];

	if (isPlayer _killed) then {
		[_killed] call mav_taxi_fnc_serverDequeueRequest;
		[_killed] call mav_taxi_fnc_serverUnitDied;
	};
}];

CBAr = compileFinal "format['CBAr called with: %1 ¯\_(ツ)_/¯',_this] call RRPServer_util_log;";
CBAt = compileFinal "format['CBAt called with: %1 ¯\_(ツ)_/¯',_this] call RRPServer_util_log;";

true
