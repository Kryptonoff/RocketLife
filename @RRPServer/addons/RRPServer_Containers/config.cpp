class CfgPatches
{
	class RRPServer_Containers
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
	class RRPServer_Containers
	{
		class core
		{
			file="\RRPServer_Containers\bootstrap";
			class preInit
			{
				preInit=1;
			};
		};
	};
};
