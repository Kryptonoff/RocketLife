class CfgPatches
{
	class RRPServer_Economy
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
	class RRPServer_Economy
	{
		class core
		{
			file="\RRPServer_Economy\bootstrap";
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

refreshEconomy = 15 * 60; //Время как часто обновлять
