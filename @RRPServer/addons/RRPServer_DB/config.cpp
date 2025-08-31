class CfgPatches
{
	class RRPServer_DB
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
	class RRPServer_DB
	{
		class core
		{
			file="\RRPServer_DB\bootstrap";
			class preInit
			{
				preInit=1;
			};
		};
	};
};
