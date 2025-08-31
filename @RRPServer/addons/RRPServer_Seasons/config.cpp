class CfgPatches
{
	class RRPServer_Seasons
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
	class RRPServer_Seasons
	{
		class core
		{
			file="\RRPServer_Seasons\bootstrap";
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

class CfgSeasons
{
	/**
	 * Structure: 
	 * 0 - start date, MMDD 
	 * 1 - end date, MMDD
	 * 2 - Name season
	*/
	dates[] = {
		{10,21,		11,11,		"Hallowen"},
		{12,20,		12,31,		"Christmas"},
		{1,1,		1,5,		"Christmas"}
	};
};