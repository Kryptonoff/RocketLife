/*
	Project: Rimas Role Play
	Author: ???
	License: CC BY-ND
*/
private _netId = param [0,"",[""]];
private _object = objectFromNetId _netId;
if (_object isKindOf "LandVehicle" || _object isKindOf "Ship" || _object isKindOf "Air") then
{
	if (isServer) then {
		if (!local _object) then {_object setOwner 2};
		_object removeAllEventHandlers "HandleDamage";
		_object addEventHandler ["HandleDamage", RRPClient_system_HandlerDamVeh];
		} else {
			[(netID _object)] remoteExec ["RRPClient_system_SetVehFixExpl", 2];
	};
};
