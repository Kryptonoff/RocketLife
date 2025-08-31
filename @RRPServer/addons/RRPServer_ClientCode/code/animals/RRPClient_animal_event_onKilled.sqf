/*
	Project: Rimas Role Play
	Author: Exile Mod
	License: CC BY-ND
	
	Desc:
		Exiled, if you read this, I am so sorry, but your code is beatiful!
*/

private["_animal", "_animalConfig", "_deathSound"];
_animal = _this select 0;
_animalConfig = configFile >> "CfgVehicles" >> typeOf _animal >> "RRP";
_deathSound = selectRandom (getArray (_animalConfig >> "deathSounds"));
playSound3D [_deathSound select 0, _animal, false, getPosASL _animal, _deathSound select 2, 1, _deathSound select 1];
RRPClientCurrentAnimal = objNull;
[AlarmAboutAnimal] call RRPClient_system_thread_removeTask;
call RRPClient_animal_scheduleRespawn;