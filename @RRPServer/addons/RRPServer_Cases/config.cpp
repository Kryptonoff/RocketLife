class CfgPatches
{
	class RRPServer_Cases
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
	class RRPServer_Cases
	{
		class core
		{
			file="\RRPServer_Cases\bootstrap";
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

class CfgBP
{
	maxLevels = 100;
	bonusLevels = 10;

};
