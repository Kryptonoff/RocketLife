class CfgPatches
{
	class RRPServer_Metrics
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
	class RRPServer_Metrics
	{
		class core
		{
			file="\RRPServer_Metrics\bootstrap";
			class preInit {
				preInit = 1;
			};
			class postInit
			{
				postInit=1;
			};
		};
	};
};
