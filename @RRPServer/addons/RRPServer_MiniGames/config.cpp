class CfgPatches
{
	class RRPServer_MiniGames
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
	class RRPServer_MiniGames
	{
		class core
		{
			file="\RRPServer_MiniGames\bootstrap";
			class preInit
			{
				preInit=1;
			};
            class postInit
            {
                postInit=1;
            };
		};
	};
};
