class CfgPatches
{
	class RRPServer_CommunityGoals
	{
		units[]={};
		weapons[]={};
		requiredAddons[]=
		{
			"RRPServer"
		};
		fileName="RRPServer_CommunityGoals.pbo";
		author="FairyTale#5571";
	};
};
class CfgFunctions
{
	class RRPServer_CommunityGoals
	{
		class Bootstrap
		{
			file="\RRPServer_CommunityGoals\bootstrap";
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