class RscExileRussianRoulette
{
	idd=24031;
	duration=999999;
	fadein=1;
	fadeout=1;
	onLoad="uiNamespace setVariable ['RscExileRussianRoulette', _this select 0];";
	onUnload="uiNamespace setVariable ['RscExileRussianRoulette', displayNull]";
	class controls
	{
		class PotBackground: RRP_background_fade
		{
			idc=4000;
			x="safeZoneX + 30 * pixelW";
			y="safeZoneY + 30 * pixelH";
			w="250 * pixelW";
			h="70 * pixelH";
		};
		class PotValue: RRP_RscStructuredText
		{
			idc=4007;
			text="<t size='1.6' font='RobotoCondensed' align='center' shadow='false'>10,000<t color='#3fd4fc'></t></t>";
			x="safeZoneX + 30 * pixelW";
			y="safeZoneY + (30+17) * pixelH";
			w="250 * pixelW";
			h="70 * pixelH";
		};
		class InfoWindow: RRP_background_fade
		{
			idc=4001;
			x="safeZoneX + 30 * pixelW";
			y="safeZoneY + (30+70+5) * pixelH";
			w="250 * pixelW";
			h="180 * pixelH";
		};
		class PlayerList: RRP_RscStructuredText
		{
			idc=4006;
			text="<t shadow='false'><t color='#3fd4fc'>Player 1</t><br/><t>Player 2</t><br/><t color='#808080'>Player 2</t><br/><t>Player 4</t><br/><t color='#808080'>(open)</t><br/><t color='#808080'>(open)</t></t>";
			x="safeZoneX + (30+2) * pixelW";
			y="safeZoneY + (30+70+5+5) * pixelH";
			w="(250-2) * pixelW";
			h="(180-5) * pixelH";
		};
		class ShotBackground: RRP_background_fade
		{
			idc=4002;
			x="safeZoneX + safeZoneW * 0.5 - 45 * pixelW";
			y="safezoneY + 30 * pixelH";
			w="90 * pixelW";
			h="70 * pixelH";
		};
		class ShotValue: RRP_RscStructuredText
		{
			idc=4008;
			text="<t align='center' size='2' color='#ffffff' shadow='false' font='RobotoCondensed'>1</t>";
			x="safeZoneX + safeZoneW * 0.5 - 45 * pixelW";
			y="safeZoneY + 30 * pixelH";
			w="90 * pixelW";
			h="70 * pixelH";
		};
		class ShotLabel: RRP_RscStructuredText
		{
			idc=4005;
			text="<t align='center' size='0.75' color='#3fd4fc' font='RobotoCondensedLight' shadow='false'>РАУНД</t>";
			x="safeZoneX + safeZoneW * 0.5 - 45 * pixelW";
			y="safezoneY + (30+45) * pixelH";
			w="90 * pixelW";
			h="25 * pixelH";
		};
		class TimeBackground: RRP_background_fade
		{
			idc=4004;
			x="safeZoneX + safeZoneW * 0.5 - 45 * pixelW";
			y="safezoneY + (30+70+5) * pixelH";
			w="90 * pixelW";
			h="25 * pixelH";
		};
		class TimeValue: RRP_RscStructuredText
		{
			idc=4009;
			text="<t align='center' size='0.7' color='#ffffff' shadow='false' font='RobotoCondensed'>00.000</t>";
			x="safeZoneX + safeZoneW * 0.5 - 45 * pixelW";
			y="safezoneY + (30+70+5+5) * pixelH";
			w="90 * pixelW";
			h="25 * pixelH";
		};
		class PressSpaceHint: RRP_RscStructuredText
		{
			idc=4003;
			text="<t align='center' size='2' color='#ffffff' shadow='false'>Press <t color='#3fd4fc'>SPACE</t> to fire</t>";
			x="safeZoneX + safeZoneW * 0.5 - 225 * pixelW";
			y="safeZoneY + safeZoneH - (60+49) * pixelH";
			w="550 * pixelW";
			h="49 * pixelH";
			colorBackground[]={0.26, 0.24, 0.31,0.8};
		};
	};
};
