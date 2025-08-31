/* #Tedylu
$[
	1.063,
	["documents",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1000,"idDocument",[1,"2565",["0.654679 * safezoneW + safezoneX","0.180909 * safezoneH + safezoneY","0.0567155 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"giverName",[1,"",["0.360789 * safezoneW + safezoneX","0.218326 * safezoneH + safezoneY","0.159835 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1101,"giverSurName",[1,"",["0.360789 * safezoneW + safezoneX","0.268934 * safezoneH + safezoneY","0.159835 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1102,"giverUntil",[1,"",["0.613431 * safezoneW + safezoneX","0.268934 * safezoneH + safezoneY","0.0979631 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1103,"playerName",[1,"",["0.360789 * safezoneW + safezoneX","0.378965 * safezoneH + safezoneY","0.159835 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1104,"playerSurName",[1,"",["0.360789 * safezoneW + safezoneX","0.422978 * safezoneH + safezoneY","0.159835 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1105,"signature",[1,"",["0.654679 * safezoneW + safezoneX","0.422978 * safezoneH + safezoneY","0.0567155 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2300,"additionalInfo",[1,"",["0.304074 * safezoneW + safezoneX","0.511003 * safezoneH + safezoneY","0.391853 * safezoneW","0.220063 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1106,"dateText",[1,"",["0.350477 * safezoneW + safezoneX","0.896113 * safezoneH + safezoneY","0.159835 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1107,"giverSignature",[1,"",["0.634055 * safezoneW + safezoneX","0.896113 * safezoneH + safezoneY","0.0773393 * safezoneW","0.0330094 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[-1200,"documentImage",[1,"icons\doc1.paa",["0.28345 * safezoneW + safezoneX","0.0598744 * safezoneH + safezoneY","0.4331 * safezoneW","0.880251 * safezoneH"],[-1,-1,-1,0.51],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class RRPDialogShowDocument
{
	idd = 25000;
	movingEnable = 0;
	enableSimulation = 1;
	enableDisplay = 1;
	onLoad = "uiNamespace setVariable ['RRPDialogShowDocument', _this select 0];";
	onUnload = "uiNamespace setVariable ['RRPDialogShowDocument', displayNull];";
	onDestroy = "uiNamespace setVariable ['RRPDialogShowDocument', displayNull];";
	class Controls
	{
		class idDocument: RRP_RscStructuredText
		{
			idc = 25001;
			text = "";
			x = 0.654679 * safezoneW + safezoneX;
			y = 0.180909 * safezoneH + safezoneY;
			w = 0.0567155 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class giverName: RRP_RscStructuredText
		{
			idc = 25002;
			x = 0.360789 * safezoneW + safezoneX;
			y = 0.218326 * safezoneH + safezoneY;
			w = 0.159835 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class giverSurName: RRP_RscStructuredText
		{
			idc = 25003;
			x = 0.360789 * safezoneW + safezoneX;
			y = 0.268934 * safezoneH + safezoneY;
			w = 0.159835 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class giverUntil: RRP_RscStructuredText
		{
			idc = 25004;
			x = 0.613431 * safezoneW + safezoneX;
			y = 0.268934 * safezoneH + safezoneY;
			w = 0.0979631 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class playerName: RRP_RscStructuredText
		{
			idc = 25005;
			x = 0.360789 * safezoneW + safezoneX;
			y = 0.378965 * safezoneH + safezoneY;
			w = 0.159835 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class playerSurName: RRP_RscStructuredText
		{
			idc = 25006;
			x = 0.360789 * safezoneW + safezoneX;
			y = 0.422978 * safezoneH + safezoneY;
			w = 0.159835 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class signature: RRP_RscStructuredText
		{
			idc = 25007;
			x = 0.654679 * safezoneW + safezoneX;
			y = 0.422978 * safezoneH + safezoneY;
			w = 0.0567155 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class additionalInfo: RscControlsGroup
		{
			idc = 25008;
			x = 0.304074 * safezoneW + safezoneX;
			y = 0.511003 * safezoneH + safezoneY;
			w = 0.391853 * safezoneW;
			h = 0.220063 * safezoneH;
			class Controls
			{
				class additionalInfoText: RRP_RscStructuredText
				{
					idc = 25009;
					x = 0 * safezoneW;
					y = 0 * safezoneH;
					w = 0.391853 * safezoneW;
					h = 0.220063 * safezoneH;
			colorText[] = {1,1,1,1};
				};
			};
		};
		class dateText: RRP_RscStructuredText
		{
			idc = 25010;
			x = 0.350477 * safezoneW + safezoneX;
			y = 0.896113 * safezoneH + safezoneY;
			w = 0.159835 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class giverSignature: RRP_RscStructuredText
		{
			idc = 25011;
			x = 0.634055 * safezoneW + safezoneX;
			y = 0.896113 * safezoneH + safezoneY;
			w = 0.0773393 * safezoneW;
			h = 0.0330094 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class documentImage: RscPicture
		{
			idc = 25012;
			text = "\rimas_agent\assets\organizations\doc1.paa";
			x = 0.28345 * safezoneW + safezoneX;
			y = 0.0598744 * safezoneH + safezoneY;
			w = 0.4331 * safezoneW;
			h = 0.880251 * safezoneH;
		};
	};
};