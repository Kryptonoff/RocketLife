class DefaultEventhandlers;
class CfgPatches
{
	class RRPServer_Network
	{
		units[]=
		{
			"C_man_1"
		};
		weapons[]={};
		requiredAddons[]=
		{
			"A3_Data_F",
			"A3_Soft_F",
			"A3_Soft_F_Offroad_01",
			"A3_Characters_F"
		};
		fileName="RRPServer_Network.pbo";
		author="FairyTale#5571";
	};
};
class CfgFunctions
{
	class RRPServer_Network
	{
		class Bootstrap
		{
			file="\RRPServer_Network\bootstrap";
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
class CfgNetwork
{
	class startSessionRequest
	{
		module = "session";
		payloads[] = 
		{
			"STRING"
		};
	};
	class requestPlayerData
	{
		module = "session";
		payloads[] = {};
	};
	class updateSessionRequest
	{
		module = "session";
		payloads[] = {"STRING"};
	};
};