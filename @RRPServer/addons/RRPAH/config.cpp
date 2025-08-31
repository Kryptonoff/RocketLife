class CfgPatches
{
	class RRPAH
	{
		requiredVersion=0.12910999;
		requiredAddons[]={};
		units[]={};
		weapons[]={};
		magazines[]={};
		ammo[]={};
		author[]=
		{
			"Alexis aka FairyTale5571"
		};
		website[]=
		{
			"https://rimasrp.life"
		};
		contact[]=
		{
			"a3atlaslife@gmail.com",
			"FairyTale5571"
		};
		version="v1";
		licensed="a3atlaslife@gmail.com";
	};
};
class CfgFunctions
{
	class RRPAH
	{
		class main
		{
			file="RRPAH\bootstrap";
			class preInit
			{
				preInit=1;
			};
			class postInit
			{
				postInit=1;
			};
			class geters
			{
				postInit=1;
			};
			class seters
			{
				postInit=1;
			};
		};
	};
};
blacklistProccess[] = {
	"SpeedAutoClicker",		// Кликер
	"vlc.exe",				// Возможна мапа, нужно скринить
	"mpc-hc64.exe",			// Возможна мапа, нужно скринить
	"lagswitch",			// лагсвитч
	"lag switch.exe",		// лагсвитч
	"Lagg","switch",		// лагсвитч
	"vggigaofe", 			// cff loader
	"loader_", 				// мапхак
	"aim",					// перекрестье
	"GpaMonitor.exe"		// вх от интел
};
kickProccess[] = {
	"GpaMonitor.exe"
};