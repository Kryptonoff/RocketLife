class RRPDialogKeypad
{
	idd=24010;
	onLoad="uiNamespace setVariable ['RRPDialogKeypad', _this select 0]";
	onUnload="uiNamespace setVariable ['RRPDialogKeypad', displayNull]";
	onKeyUp="_this call RRPClient_keyPad_onKeyUp";
	class controlsBackground
	{
		class background: RscPicture
		{
			idc = -1;
			text = "\rimas_agent\assets\keypad\keyPad.paa";
			x = 0.386521 * safezoneW + safezoneX;
			y = 0.158958 * safezoneH + safezoneY;
			w = 0.206325 * safezoneW;
			h = 0.649079 * safezoneH;
		};
	};
	class controls
	{
		class buttonFake: RscButton
		{
			idc=4013;
			x="1 * safezoneW + safezoneX";
			y="1 * safezoneH + safezoneY";
			w="0 * safezoneW";
			h="0 * safezoneH";
		};
		class b0: RscButton
		{
			idc=4003;
			text="";
			x = 0.469051 * safezoneW + safezoneX;
			y = 0.667993 * safezoneH + safezoneY;
			w = 0.0426499 * safezoneW;
			h = 0.0651454 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="0 call RRPClient_keyPad_addDigit";
		};
		class b1: RscButton
		{
			idc=4004;
			text="";
			x = 0.413894 * safezoneW + safezoneX;
			y = 0.389005 * safezoneH + safezoneY;
			w = 0.0402105 * safezoneW;
			h = 0.0620353 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="1 call RRPClient_keyPad_addDigit";
		};
		class b2: RscButton
		{
			idc=4005;
			text="";
			x = 0.469097 * safezoneW + safezoneX;
			y = 0.389225 * safezoneH + safezoneY;
			w = 0.0402105 * safezoneW;
			h = 0.0620352 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="2 call RRPClient_keyPad_addDigit";
		};
		class b3: RscButton
		{
			idc=4006;
			text="";
			x = 0.525011 * safezoneW + safezoneX;
			y = 0.390219 * safezoneH + safezoneY;
			w = 0.0395679 * safezoneW;
			h = 0.0601256 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="3 call RRPClient_keyPad_addDigit";
		};
		class b4: RscButton
		{
			idc=4007;
			text="";
			x = 0.414421 * safezoneW + safezoneX;
			y = 0.48009 * safezoneH + safezoneY;
			w = 0.0394858 * safezoneW;
			h = 0.0657113 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="4 call RRPClient_keyPad_addDigit";
		};
		class b5: RscButton
		{
			idc=4008;
			text="";
			x = 0.468524 * safezoneW + safezoneX;
			y = 0.479983 * safezoneH + safezoneY;
			w = 0.0415952 * safezoneW;
			h = 0.0641521 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="5 call RRPClient_keyPad_addDigit";
		};
		class b6: RscButton
		{
			idc=4009;
			text="";
			x = 0.525309 * safezoneW + safezoneX;
			y = 0.48219 * safezoneH + safezoneY;
			w = 0.0402103 * safezoneW;
			h = 0.0619589 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="6 call RRPClient_keyPad_addDigit";
		};
		class b7: RscButton
		{
			idc=4010;
			text="";
			x = 0.412873 * safezoneW + safezoneX;
			y = 0.574929 * safezoneH + safezoneY;
			w = 0.0426498 * safezoneW;
			h = 0.0651454 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="7 call RRPClient_keyPad_addDigit";
		};
		class b8: RscButton
		{
			idc=4011;
			text="";
			x = 0.468547 * safezoneW + safezoneX;
			y = 0.574922 * safezoneH + safezoneY;
			w = 0.0431771 * safezoneW;
			h = 0.0661385 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="8 call RRPClient_keyPad_addDigit";
		};
		class b9: RscButton
		{
			idc=4012;
			text="";
			x = 0.525836 * safezoneW + safezoneX;
			y = 0.576028 * safezoneH + safezoneY;
			w = 0.0410677 * safezoneW;
			h = 0.0641523 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="9 call RRPClient_keyPad_addDigit";
		};
		class bOK: RscButton
		{
			idc=4000;
			text="";
			x = 0.414421 * safezoneW + safezoneX;
			y = 0.669094 * safezoneH + safezoneY;
			w = 0.0394858 * safezoneW;
			h = 0.0651453 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			colorDisabled[]={1,1,1,0.40000001};
			onMouseButtonClick="_this call RRPClient_keyPad_addDigit";
		};
		class bCancel: RscButton
		{
			idc=4002;
			text="";
			x = 0.526318 * safezoneW + safezoneX;
			y = 0.669283 * safezoneH + safezoneY;
			w = 0.0417925 * safezoneW;
			h = 0.0649383 * safezoneH;
			colorBackground[]={0.098039202,0.098039202,0.098039202,0};
			colorBackgroundActive[]={0.098039202,0.098039202,0.098039202,0.60000002};
			onMouseButtonClick="closeDialog 0";
		};
		class editBox: RscText
		{
			idc=4001;
			text="";
			font="OPTICalculator";
			style=2;
			x = 0.324623 * safezoneW + safezoneX;
			y = 0.246969 * safezoneH + safezoneY;
			w = 0.330121 * safezoneW;
			h = 0.0880107 * safezoneH;
			colorText[]={0.714,0.169,0.169,1};
			sizeEx="3 * (0.04)";
			shadow=0;
		};
	};
};
class RRPDialogScanKeypad
{
	idd=24010;
	onLoad="uiNamespace setVariable ['RRPDialogScanKeypad', _this select 0]";
	onUnload="uiNamespace setVariable ['RRPDialogScanKeypad', displayNull]";
	class controlsBackground
	{
	};
	class controls
	{
		
		class backgroundCold: RscPicture
		{
			idc=4000;
			text="\rimas_agent\assets\keypad\keyPad_cold.paa";
			x = 0.386521 * safezoneW + safezoneX;
			y = 0.158958 * safezoneH + safezoneY;
			w = 0.206325 * safezoneW;
			h = 0.649079 * safezoneH;
		};
		class backgroundHot: RscPicture
		{
			idc=4001;
			text="\rimas_agent\assets\keypad\keyPad_hot.paa";
			x = 0.386521 * safezoneW + safezoneX;
			y = 0.158958 * safezoneH + safezoneY;
			w = 0.206325 * safezoneW;
			h = 0.649079 * safezoneH;
		};
		class b0: RscPictureKeepAspect
		{
			idc=4003;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.469051 * safezoneW + safezoneX;
			y = 0.667993 * safezoneH + safezoneY;
			w = 0.0426499 * safezoneW;
			h = 0.0651454 * safezoneH;
		};
		class b1: RscPictureKeepAspect
		{
			idc=4004;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.413894 * safezoneW + safezoneX;
			y = 0.389005 * safezoneH + safezoneY;
			w = 0.0402105 * safezoneW;
			h = 0.0620353 * safezoneH;
		};
		class b2: RscPictureKeepAspect
		{
			idc=4005;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.469097 * safezoneW + safezoneX;
			y = 0.389225 * safezoneH + safezoneY;
			w = 0.0402105 * safezoneW;
			h = 0.0620352 * safezoneH;
		};
		class b3: RscPictureKeepAspect
		{
			idc=4006;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.525011 * safezoneW + safezoneX;
			y = 0.390219 * safezoneH + safezoneY;
			w = 0.0395679 * safezoneW;
			h = 0.0601256 * safezoneH;
		};
		class b4: RscPictureKeepAspect
		{
			idc=4007;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.414421 * safezoneW + safezoneX;
			y = 0.48009 * safezoneH + safezoneY;
			w = 0.0394858 * safezoneW;
			h = 0.0657113 * safezoneH;
		};
		class b5: RscPictureKeepAspect
		{
			idc=4008;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.468524 * safezoneW + safezoneX;
			y = 0.479983 * safezoneH + safezoneY;
			w = 0.0415952 * safezoneW;
			h = 0.0641521 * safezoneH;
		};
		class b6: RscPictureKeepAspect
		{
			idc=4009;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.525309 * safezoneW + safezoneX;
			y = 0.48219 * safezoneH + safezoneY;
			w = 0.0402103 * safezoneW;
			h = 0.0619589 * safezoneH;
		};
		class b7: RscPictureKeepAspect
		{
			idc=4010;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.412873 * safezoneW + safezoneX;
			y = 0.574929 * safezoneH + safezoneY;
			w = 0.0426498 * safezoneW;
			h = 0.0651454 * safezoneH;
		};
		class b8: RscPictureKeepAspect
		{
			idc=4011;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.468547 * safezoneW + safezoneX;
			y = 0.574922 * safezoneH + safezoneY;
			w = 0.0431771 * safezoneW;
			h = 0.0661385 * safezoneH;
		};
		class b9: RscPictureKeepAspect
		{
			idc=4012;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.525836 * safezoneW + safezoneX;
			y = 0.576028 * safezoneH + safezoneY;
			w = 0.0410677 * safezoneW;
			h = 0.0641523 * safezoneH;
		};
		class bOK: RscPictureKeepAspect
		{
			idc=4000;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.414421 * safezoneW + safezoneX;
			y = 0.669094 * safezoneH + safezoneY;
			w = 0.0394858 * safezoneW;
			h = 0.0651453 * safezoneH;
		};
		class bCancel: RscPictureKeepAspect
		{
			idc=4002;
			text="\rimas_agent\assets\keypad\finger_ca.paa";
			x = 0.526318 * safezoneW + safezoneX;
			y = 0.669283 * safezoneH + safezoneY;
			w = 0.0417925 * safezoneW;
			h = 0.0649383 * safezoneH;
		};
	};
};
