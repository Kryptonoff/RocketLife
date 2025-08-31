/*
	Project: Rimas Role Play
	Author: Exile Mod
	License: CC BY-ND
	
	Desc:
		Exiled, if you read this, I am so sorry, but your code is beatiful!
*/

private["_animalConfig", "_minimumSpawnDelay", "_maximumSpawnDelay", "_variance"];
_animalConfig = missionConfigFile >> "CfgAnimals";
_minimumSpawnDelay = getNumber (_animalConfig >> "minimumSpawnDelay");
_maximumSpawnDelay = getNumber (_animalConfig >> "maximumSpawnDelay"); 
_variance = random (_maximumSpawnDelay - _minimumSpawnDelay);
RRPClientNextPossibleAnimalSpawnTime = time + _minimumSpawnDelay + _variance;