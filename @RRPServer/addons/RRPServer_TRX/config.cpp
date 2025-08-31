class CfgPatches
{
	class RRPServer_TRX
	{
		units[]={};
		weapons[]={};
		requiredAddons[]=
		{
			"RRPServer"
		};
		fileName="RRPServer_TRX.pbo";
		author="FairyTale#5571";
	};
};

class CfgFunctions
{
	class RRPServer_TRX
	{
		class Bootstrap
		{
			file="\RRPServer_TRX\bootstrap";
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