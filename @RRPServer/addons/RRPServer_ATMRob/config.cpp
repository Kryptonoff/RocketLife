class CfgPatches
{
	class RRPServer_ATMRob
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
	class RRPServer_ATMRob
	{
		class core
		{
			file="\RRPServer_ATMRob\bootstrap";
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
