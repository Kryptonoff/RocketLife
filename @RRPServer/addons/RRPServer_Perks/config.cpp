class CfgPatches
{
	class RRPServer_Perks
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
	class RRPServer_Perks
	{
		class core
		{
			file="\RRPServer_Perks\bootstrap";
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
