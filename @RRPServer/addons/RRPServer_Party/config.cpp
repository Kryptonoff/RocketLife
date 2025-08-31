class DefaultEventhandlers;
class CfgPatches
{
	class RRPServer_Party
	{
		units[]={};
		weapons[]={};
		requiredAddons[]=
		{
			"RRPServer"
		};
		fileName="RRPServer_Party.pbo";
		author="FairyTale#5571";
	};
};
class CfgFunctions
{
	class RRPServer_Party
	{
		class Bootstrap
		{
			file="\RRPServer_Party\bootstrap";
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