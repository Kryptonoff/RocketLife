class UnionDialogSurgery {
	idd = 5400;
	name= "UnionDialogSurgery";
	movingEnable = 1;
	enableSimulation = 1;
	
	class controlsBackground {
		class bg: RRP_background
		{
			idc = -1;
			x = 0.005 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.671 * safezoneH;
		};		
	};
	
	class controls 
	{
		class Title : RRP_title 
		{
			idc = 5401;
			text = "Пластическая хирургия";
			x = 0.005 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.195937 * safezoneW;
			h = 0.022 * safezoneH;
		};

		
		class FacesList : RscListBox 
		{
			idc = 5402;
			text = "";
			onLBSelChanged = "[_this] call RRPClient_surgery_Change";
			
			x = 0.0120125 * safezoneW + safezoneX;
			y = 0.104 * safezoneH + safezoneY;
			w = 0.180469 * safezoneW;
			h = 0.528 * safezoneH;
		};
		
		class BuyButtonKey : RRP_btn_blue 
		{
			idc = -1;
			text = "Купить";
			onButtonClick = "call RRPClient_surgery_SetFace";
			
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class CloseButtonKey : RRP_btn_red 
		{
			idc = -1;
			text = "Закрыть";
			onButtonClick = "closeDialog 0;";
			
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class NVGOnBtn : RRP_btn_blue
		{
			idc = -1;
			text = "Темно";
			onButtonClick = "camUseNVG true";
			
			x = 0.0101562 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.042 * safezoneH;
		};

		class NVGOffBtn : RRP_btn_blue
		{
			idc = -1;
			text = "Светло";
			onButtonClick = "camUseNVG false";
			
			x = 0.102969 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.091875 * safezoneW;
			h = 0.042 * safezoneH;
		};		
	};
};