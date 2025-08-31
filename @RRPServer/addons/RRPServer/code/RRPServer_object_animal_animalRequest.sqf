/*
	Project: Aurora Role Play
	Author: Exile Mod
	License: CC BY-ND
	
	Desc:
		Exiled, if you read this, I am so sorry, but your code is beatiful!
*/

private["_sessionId", "_parameters", "_netId", "_animal", "_player"];
params ["_netId","_player"];
_animal = objectFromNetId _netId;
if (isNull _animal) then 
{
	(format ["Failed to retrieve animal with Net-ID %1. Probably network lag?", _netId]) call RRPServer_util_log;
}
else 
{
	_animal setVariable ["SpawnedAt", time];
	_animal setVariable ["WasGutted", false];
	_animal setVariable ["CanBeGutted", false, true];
	_animal addMPEventHandler ["MPKilled", { _this call RRPServer_event_onAnimalKilled; }];
	if !(isNull _player) then
	{
		missionNamespace setVariable [format ["Animal%1", getPlayerUID _player], _animal];
	};
};
