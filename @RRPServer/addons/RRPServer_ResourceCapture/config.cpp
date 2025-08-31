class CfgPatches
{
	class RRPServer_ResourceCapture
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
	class RRPServer_ResourceCapture
	{
		class core
		{
			file="\RRPServer_ResourceCapture\bootstrap";
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
