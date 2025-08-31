class CfgPatches
{
	class RRPServer_Rewards
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
	class RRPServer_Rewards
	{
		class core
		{
			file="\RRPServer_Rewards\bootstrap";
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

class CfgRewards
{
	class Logging
	{
		//If this is one it will use extDB to log to a file when someone claims an item
		rewardsLogging = 1;
	};
	
	class AllowedUIDS
	{
		//If this is 1 it will check for a valid input/caller - either a UID from an admin or mission or event
		checkRewards = 1;
		/**
		 ** Paste Admin UIDs in here to allow them to give rewards to players
		 ** 
		 ** NOTHING IN THE FOLLOWING ARRAY CAN BE EQUAL TO 8 CHARACTERS!!!!!!
		 **/
		AllowedRewardGivers[] = 
		{
			"76561198055124016", // fairy
			"76561198860385638", // bananoff
			"76561199093304994", // komarov
			"__SERVER__",
			"__DAILY__"
		};
	};
};
