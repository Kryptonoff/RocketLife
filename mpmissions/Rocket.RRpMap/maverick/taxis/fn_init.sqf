/*--------------------------------------------------------------------------
    Author:		Maverick Applications
    Website:	https://maverick-applications.com

    You're not allowed to use this file without permission from the author!
---------------------------------------------------------------------------*/

format ["Taxi init: isServer %1 | hasInterface %2",isServer,hasInterface] call RRPClient_system_log;

0 spawn {
	// Server
	if (isServer) then {
		// Create eventhandlers to delete people off the queue list automatically when someoen dies or disconnects
		addMissionEventHandler ["EntityKilled", {
			params ["_killed", "_killedBy", "_instigator"];

			if (isPlayer _killed) then {
				[_killed] call mav_taxi_fnc_serverDequeueRequest;
				[_killed] call mav_taxi_fnc_serverUnitDied;
			};
		}];

	};

	// Client
	if (hasInterface) then {};

	// Keyhandler
	if(!hasInterface) exitWith {};
};