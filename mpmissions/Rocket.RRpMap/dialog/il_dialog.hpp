class RRPDialog_illegal
{
	idd = 4679540;
	movingEnabled = 0;
	enableSimulation = 1;
	onLoad = "true call RRPClient_gui_util_blur;";
	onUnload = "false call RRPClient_gui_util_blur;";
	
	class controlsBackground {	
		class MainBackground: RRP_background 
		{
			idc = -1;
			text = "";		
			x = 0.15;
			y = 0.3;
			w = 0.7;
			h = 0.424;
		};
		
		class Title : RRP_title 
		{
			idc = -1;
			text = "Отмывка денег";		
			x = 0.15;
			y = 0.2625;
			w = 0.662499;
			h = 0.04;
		};
		
		class closeImage_main : RRP_btn_exit_text
		{
			idc = -1;
			x = 0.8125;
			y = 0.2625;
			w = 0.0375;
			h = 0.04;
		};
	};
	
	class controls 
	{
		class Main_information : RRP_RscStructuredText
		{
			idc = 4679541;
			text = "";		
			x = 0.175;
			y = 0.38;
			w = 0.65;
			h = 0.2;
		};
		
		class progress_text : RscText
		{
			idc = 4679542;
			text = "";		
			
			font="RobotoCondensed";
			shadow = 0;
			
			x = 0.475;
			y = 0.58;
			w = 0.06;
			h = 0.04;
		};
		
		class ProgressBar_action: Life_V3_RscProcessBar
		{
            idc = 4679543;
			type = 8;
			style = 0;
            x = 0.175;
            y = 0.62;
            w = 0.65;
            h = 0.01;
			shadow = 0;
        };

		class Button_action : RRP_btn_blue
		{
			idc = 4679544;
			text = "Отмыть деньги";
			font = "RobotoCondensed";
			onButtonClick = "[] spawn RRPClient_legal_action;";
			
			x = 0.175;
			y = 0.64;
			w = 0.65;
			h = 0.06;
		};
	};
};