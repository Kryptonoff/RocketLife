class CfgAnimals
{
	/**
	 * Вкл/Выкл
	 */
	enabled = 1;

	/**
		перечень животных
	*/
	animalTypes[] = 
	{
		"Animal_Rooster_Abstract",
		"Animal_Hen_Abstract",
		"Animal_Goat_Abstract",
		"Animal_Sheep_Abstract"
	};

	/**
	 * Example:
	 * Distance = 150
	 * Radius = 50
	 *
	 * => Minimum Distance from Player = 150 
	 * => Maximum Distance from Player = 150 + 50 * 2
	 */
	spawnDistance = 75;
	spawnRadius = 25;

	/**
	 * Specifies the minimum time in seconds between spawning animals.
	 * When the animal diededed, this time has to pass before it spawns
	 * a new one.
	 *
	 * It is a min/max setting, so the intervals will be uneven and a bit random.
	 * By default it will take 5 to 10 minutes to respawn a new animal.
	 */
	minimumSpawnDelay = 30;
	maximumSpawnDelay = 60;

	/**
	 * Clients will despawn animals if no player is in this radius around the animal
	 * This check is ran every 1 minute, so it is pretty unprecise, but performance-friendly. 
	 */
	keepAliveRadius = 500;

	/**
	 * Defines the minimum lifetime of an animal in seconds. During this time, right after spawning,
	 * it will not despawn. (+-0..1 minute delay)
	 */
	minimumLifetime = 3 * 60;
};