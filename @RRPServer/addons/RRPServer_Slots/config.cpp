class CfgPatches
{
	class RRPServer_Slots
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
	class RRPServer_Slots
	{
		class core
		{
			file="\RRPServer_Slots\bootstrap";
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
