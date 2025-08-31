class CfgPatches
{
	class RRPServer_Events
	{
		units[]={};
		weapons[]={};
		requiredVersion=1;
		requiredAddons[]=
		{
			"RRPServer",
			"rimas_agent"
		};
	};
};
class CfgFunctions
{
	class RRPServer_Events
	{
		class core
		{
			file="\RRPServer_Events\bootstrap";
			class postInit
			{
				postInit=1;
			};
			class preInit
			{
				preInit=1;
			};
		};
	};
};

class CfgEvents
{
	enabled[] = {};
	class SantaFly
	{
		canSuspend = 0;
		fnc = "RRPServer_ambient_flySanta";
		// в минутах
		minTime = 5;
		maxTime = 30;
		minOnlinePlayers = 1;
		condition = "missionNamespace getVariable ['CurrentSeasson',''] isequalto 'Christmas'";
	};
	class HeliCrash
	{
		canSuspend = 0;
		fnc = "RRPServer_ambient_heliCrashes";
		// в минутах
		minTime = 5;
		maxTime = 60;
		minOnlinePlayers = 1;
		class config
		{
			marker = 0;
			maxCrashes = 2;
			smoke = 1;
			wrecks[]=
			{
				"Land_Wreck_Heli_Attack_01_F",
				"Land_Wreck_Heli_Attack_02_F"
			};
			SpawnLoot = 0; // Спавнить лут
			SecondLootChance = 3; // Шанс спавна двойного лута
			LootMinMax[] = {3,7}; // Лута от и до
			LootRadius = 10; // Радиус спавна лута от краша
			LootItems[] = {};
		};
	};
};