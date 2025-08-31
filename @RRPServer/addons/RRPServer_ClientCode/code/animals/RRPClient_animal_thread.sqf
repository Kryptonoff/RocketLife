/*
	Project: Rimas Role Play
	Author: Exile Mod
	License: CC BY-ND
	
	Desc:
		Exiled, if you read this, I am so sorry, but your code is beatiful!
*/

private["_animalConfig", "_possibleAnimalSpawns", "_animalTypesToCheck", "_spawnDistance", "_spawnRadius", "_centerPosition", "_animalBaseClassName", "_arithmetic", "_places", "_place", "_placePosition", "_placeRating", "_animalToSpawn", "_minimumLifetime", "_spawnedAt", "_keepAliveRadius"];
_animalConfig = missionConfigFile >> "CfgAnimals";
// systemChat "!!!!!!!!!!!!AnimalThreadWarning!";
// diag_log "!!!!!!!!!!!!AnimalThreadWarning!";
if (isNull RRPClientCurrentAnimal) then
{
	if (alive player) then
	{
		if (time >= RRPClientNextPossibleAnimalSpawnTime) then
		{
			if ((getPosWorld player) call RRPClient_util_world_isInHuntingRange) then
			{
				_possibleAnimalSpawns = [];
				_animalTypesToCheck = getArray (_animalConfig >> "animalTypes");
				_spawnDistance = getNumber (_animalConfig >> "spawnDistance");
				_spawnRadius = getNumber (_animalConfig >> "spawnRadius");
				_centerPosition = player modelToWorld [0, _spawnDistance + _spawnRadius, 0];
				_centerPosition set [2, 0];
				{
					_animalBaseClassName = _x;
					_arithmetic = getText (configFile >> "CfgVehicles" >> _animalBaseClassName >> "RRP" >> "bestPlaces");
					_places = selectBestPlaces [_centerPosition, _spawnRadius, _arithmetic, 5, 1];
					if !(_places isEqualTo []) then
					{
						_place = _places select 0;
						_placePosition = _place select 0;
						_placeRating = _place select 1;
						_possibleAnimalSpawns pushBack [_animalBaseClassName, _placePosition];
					};
				}
				forEach _animalTypesToCheck;
				if !(_possibleAnimalSpawns isEqualTo []) then 
				{
					_animalToSpawn = selectRandom _possibleAnimalSpawns;
					_animalToSpawn call RRPClient_animal_spawn;
				};
			};
		};
	};
}
else
{
	_minimumLifetime = getNumber (_animalConfig >> "minimumLifetime");
	_spawnedAt = RRPClientCurrentAnimal getVariable ["SpawnedAt", 0];
	if ((time - _spawnedAt) >= _minimumLifetime) then
	{
		_keepAliveRadius = getNumber (_animalConfig >> "keepAliveRadius");
		if !([RRPClientCurrentAnimal, _keepAliveRadius] call RRPClient_util_world_isAlivePlayerInRange) then
		{
			deleteVehicle RRPClientCurrentAnimal;
			RRPClientCurrentAnimal = objNull;
			["InfoTitleOnly", ["Животное умерло..."]] call SmartClient_gui_toaster_addTemplateToast;
			call RRPClient_animal_scheduleRespawn;
		};
	};
};