class CfgPatches
{
	class RRPServer_Farming
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
	class RRPServer_Farming
	{
		class core
		{
			file="\RRPServer_Farming\bootstrap";
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
