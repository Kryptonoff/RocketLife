#include <tablet_common.hpp>

#include "slides\messager.hpp"
#include "slides\health.hpp"
#include "slides\achievment.hpp"
#include "slides\skills.hpp"
#include "slides\keys.hpp"
#include "slides\documents.hpp"
#include "slides\economy.hpp"
#include "slides\craft.hpp"
#include "slides\medic.hpp"
#include "slides\settings.hpp"
#include "slides\party_create.hpp"
#include "slides\party_manage.hpp"
#include "slides\groups.hpp"
#include "slides\bug.hpp"
#include "slides\house.hpp"
#include "slides\ltd.hpp"
#include "slides\car2go.hpp"
#include "slides\wiki.hpp"
#include "slides\wallpapers.hpp"
#include "slides\dispatch.hpp"
#include "slides\notes.hpp"
#include "slides\dynamic_economy.hpp"
#include "slides\cases.hpp"
#include "slides\communitygoals.hpp"
#include "slides\trx_store.hpp"
#include "slides\perks.hpp"

class RRPDialogTablet
{
	idd = 25000;
	onLoad = "uiNamespace setVariable [""RRPDialogTablet"",_this#0]";
	onUnload = "_this call RRPClient_tablet_close; uiNamespace setVariable [""RRPDialogTablet"",displayNull]";

	class controls 
	{
		class helloPicture: RscPicture
		{
			idc = 25400;
			text = "\rimas_agent\assets\tablet\hello.paa";
			show = "false";
			x = 0.190598 * safezoneW + safezoneX;
			y = 0.114985 * safezoneH + safezoneY;
			w = 0.629117 * safezoneW;
			h = 0.759031 * safezoneH;
		}; 
		class Background: helloPicture
		{
			idc = 1206;
			text = "\rimas_agent\assets\tablet\wallpapers\0.paa";
			show = "true";
		};
		class TabletPicture: helloPicture
		{
			idc = 1207;
			text = "\rimas_agent\assets\tablet\tablet.paa";
			show = "true";
		};
		class Slides: SlideTab
		{
			idc = 24001;
			show="true";
			class controls 
			{
				class MainMenu: SlideTab
				{
					idc = 25100;
					show = "true";
					x = 0;
					y = 0;
					class Controls
					{
					};
				};
			};
		};
		class LeftPage: SlideTab
        {
            idc = 25300;
            x = 0.225664 * safezoneW + safezoneX;
            y = 0.158986 * safezoneH + safezoneY;
            w = 0.159858 * safezoneW;
            h = 0.649026 * safezoneH;
			show = "true";
            class Controls
            {
                class timeAndDate: RscStructuredText
                {
                    idc = 25302;
                    text = ""; //--- ToDo: Localize;
                    x = 0.00309404 * safezoneW;
                    y = 0.00660024 * safezoneH;
                    w = 0.15264 * safezoneW;
                    h = 0.0989919 * safezoneH;
                };
				class money: RscStructuredText
				{
					idc = 25305;
					text = ""; //--- ToDo: Localize;
					x = 0.00285899 * safezoneW;
					y = 0.105527 * safezoneH;
					w = 0.15322 * safezoneW;
					h = 0.0814299 * safezoneH;
				};
                class NotificationCenter: ctrlControlsGroupNoScrollbars
                {
                    idc = 25304;
					x = 0.00309374 * safezoneW;
					y = 0.189062 * safezoneH;
					w = 0.154248 * safezoneW;
					h = 0.396146 * safezoneH;
					show = "true";
                    class Controls
                    {
                        class notifCenter: RscStructuredText
                        {
                            idc = 25310;
                            text = "<t font='SFCompactText'>Центр уведомлений</t>"; //--- ToDo: Localize;
                            x = 0.00206292 * safezoneW;
                            y = 0.00440099 * safezoneH;
                            w = 0.132002 * safezoneW;
                            h = 0.022001 * safezoneH;
                        };
                    };
                };
            };
        };
		class Warning: SlideTab
		{
			idc = 4030;
			show="false";
			x = 0.216385 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.577544 * safezoneW;
			h = 0.682 * safezoneH;
			class Controls
			{
				class Background: RscText
				{
					idc=-1;
					x=0;
					y=0;
					w = 0.577544 * safezoneW;
					h = 0.682 * safezoneH;
					colorBackground[]=
					{
						"41/255",
						"39/255",
						"46/255",
						0.5
					};
				};
				class OkayButton: TabletButton
				{
					idc=4031;
					text="Meh... Okay";
					// ["0.237211 * safezoneW","0.352 * safezoneH","0.0928072 * safezoneW","0.044 * safezoneH"]
					x="0.237211 * safezoneW";
					y="0.352 * safezoneH";
					w="0.0928072 * safezoneW";
					h="0.044 * safezoneH";
					onButtonClick="call RRPClient_tablet_hideWarning";
				};
				class Message: RscStructuredText
				{
					idc=4032;
					text="<t align='center'><t color='#e14141'>Whoops</t><br/><t color='#fcfdff' size='1.4'>Computer says no.</t></t>";
					x="0.118624 * safezoneW";
					y="0.264 * safezoneH";
					w="0.329981 * safezoneW";
					h="0.077 * safezoneH";
					colorBackground[]={0,0,0,0};
				};
			};
		};
		class Confirm: SlideTab
		{
			idc = 4020;
			show="false";
			// [0.216385 * safezoneW + safezoneX,0.148 * safezoneH + safezoneY,0.577544 * safezoneW,0.682 * safezoneH]
			x = 0.216385 * safezoneW + safezoneX;
			y = 0.148 * safezoneH + safezoneY;
			w = 0.577544 * safezoneW;
			h = 0.682 * safezoneH;
			class Controls
			{
				class Background: RscText
				{
					idc=-1;
					x=0;
					y=0;
					w = 0.577544 * safezoneW;
					h = 0.682 * safezoneH;
					colorBackground[]=
					{
						"41/255",
						"39/255",
						"46/255",
						0.5
					};
				};
				class Question: RscStructuredText
				{
					idc=4021;
					text="<t align='center'><t color='#00b2cd'>Confirm</t><br/><t color='#fcfdff' size='1.4'>Kick Eichi?</t></t>";
					x="0.118624 * safezoneW";
					y="0.264 * safezoneH";
					w="0.329981 * safezoneW";
					h="0.077 * safezoneH";
					colorBackground[]={0,0,0,0};
				};
				class YesButton: TabletButton
				{
					idc=4022;
					text="Kick";
					x="0.118624 * safezoneW";
					y="0.352 * safezoneH";
					w="0.0928072 * safezoneW";
					h="0.044 * safezoneH";
					onButtonClick="true call RRPClient_tablet_hideConfirm";
				};
				class NoButton: YesButton
				{
					idc=4023;
					text="Don't kick";
					x="0.355798 * safezoneW";
					onButtonClick="false call RRPClient_tablet_hideConfirm";
				};
			};
		};
		class StatusText: RscStructuredText
		{
			idc = 25401;
			text = "";
			x = 0.386554 * safezoneW + safezoneX;
			y = 0.161255 * safezoneH + safezoneY;
			w = 0.401187 * safezoneW;
			h = 0.0175971 * safezoneH;
		};
		
		class closePicture: RscPicture
		{
			idc = -1;
			text = "\rimas_agent\assets\tablet\apps\home.paa";
			x = 0.473177 * safezoneW + safezoneX;
			y = 0.808 * safezoneH + safezoneY;
			w = 0.0526088 * safezoneW;
			h = 0.0077 * safezoneH;
		};
		class CloseButton: RscPictureButtonMenu
		{
			idc = 1207;
			x = 0.469064 * safezoneW + safezoneX;
			y = 0.8058 * safezoneH + safezoneY;
			w = 0.0618715 * safezoneW;
			h = 0.0198 * safezoneH;
			tooltip = "Закрыть";
			onButtonClick = "closeDialog 0";
		};
	};
};

class AppNotification: RscControlsGroupNoScrollbars
{
	idc=-1;
	x=0;
	y=0;
	w="240 * pixelW";
	h="60 * pixelH";
	fade=1;
	class controls
	{
		class Background: RscPicture
		{
			idc=100;
			x=0;
			y=0;
			w="240 * pixelW";
			h="60 * pixelH";
			text = "rimas_agent\assets\telegram\MessageFromMiddle.paa";
			colorBackground[]=
			{
				"19/255",
				"22/255",
				"27/255",
				0.80000001
			};
		};
		class Stripe: RscText
		{
			idc=101;
			x=0;
			y=0;
			w="5 * pixelW";
			h="60 * pixelH";
			colorBackground[]=
			{
				"199/255",
				"38/255",
				"81/255",
				1
			};
		};
		class Text: RscStructuredText
		{
			idc=102;
			text="<t size='22' font='PuristaMedium'>Building disallowed!</t><br/><t color='#ff979ba1' size='19' font='PuristaLight'>Concrete mixer is nearby.</t>";
			x="10 * pixelW";
			y=0;
			w="(240 - 10) * pixelW";
			h="60 * pixelH";
			size="1 * pixelH";
			shadow=0;
			colorBackground[]={0,0,0,0};
			class Attributes
			{
				shadow=0;
			};
		};
	};
};