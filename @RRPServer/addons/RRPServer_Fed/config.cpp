class CfgPatches
{
	class RRPServer_Fed
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
	class RRPServer_Fed
	{
		class core
		{
			file="\RRPServer_Fed\bootstrap";
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
