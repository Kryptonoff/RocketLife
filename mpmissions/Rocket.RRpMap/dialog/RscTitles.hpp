class helpmessage
{
	idd=1111;
	onLoad="uiNamespace setVariable ['helpmessage',_this select 0]";
	name="helpmessage";
	duration=20;
	movingEnable=0;
	fadein=0.5;
	fadeout=0.5;
	class controls
	{
		class htlp_txt_bg: RscText
		{
			idc=1110;
			text="";
			x="0.5-(300 * 1 * pixelW * (pixelGridBase/18))";
			y="safeZoneY + safeZoneH -(190 * 1*pixelH*(pixelGridBase/18))";
			w="640 * 1 * pixelW * (pixelGridBase/18)";
			h="40 * 1 * pixelH * (pixelGridBase/18)";
			size=0.032000002;
			colorBackground[]={0.40000001,0.40000001,0.40000001,0.60000002};
		};
		class htlp_txt_bg_sq: RscPicture
		{
			idc=-1;
			text="\rimas_agent\assets\icon_mod.paa";
			x="0.5-(300 * 1 * pixelW * (pixelGridBase/18))";
			y="safeZoneY+safeZoneH - (190 * 1 * pixelH * (pixelGridBase/18))";
			w="40 * 1 * pixelW * (pixelGridBase/18)";
			h="40 * 1 * pixelH * (pixelGridBase/18)";
		};
		class htlp_txt: RscStructuredText
		{
			idc=1112;
			text="";
			x="0.5-(300*		1*pixelW*(pixelGridBase/18))+(40*		1*pixelW*(pixelGridBase/18))";
			y="safeZoneY+safeZoneH-(180*		1*pixelH*(pixelGridBase/18))";
			w="600 * 1 * pixelW * (pixelGridBase/18)";
			h="40 *	1 * pixelH * (pixelGridBase/18)";
			size=0.032000002;
			colorBackground[]={0,0,0,0};
			class Attributes
			{
				font="RobotoCondensed";
				color="#99D678";
				align="left";
				valign="middle";
				shadow=1;
			};
		};
	};
};


