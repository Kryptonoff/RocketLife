/* #Foqymi
$[
	1.063,
	["container_manage",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[-1000,"background: RRP_background",[1,"",["0.344886 * safezoneW + safezoneX","0.291034 * safezoneH + safezoneY","0.316945 * safezoneW","0.40705 * safezoneH"],[-1,-1,-1,-1],[0.26,0.24,0.31,0.5],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[1001,"title: RRP_title",[1,"Container Manage",["0.344886 * safezoneW + safezoneX","0.269038 * safezoneH + safezoneY","0.30732 * safezoneW","0.0219964 * safezoneH"],[-1,-1,-1,-1],[0.16,0.16,0.19,1],[-1,-1,-1,-1],"","-1"],["idc = -1;"]],
	[-1600,"Exit: RRP_btn_exit_text",[1,"X",["0.652109 * safezoneW + safezoneX","0.269038 * safezoneH + safezoneY","0.00969463 * safezoneW","0.0219964 * safezoneH"],[-1,-1,-1,-1],[0.98,0.01,0.38,1],[-1,-1,-1,-1],"","-1"],[]],
	[2400,"JoinGame",[1,"<-Join",["0.438111 * safezoneW + safezoneX","0.328427 * safezoneH + safezoneY","0.0825183 * safezoneW","0.0329946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1500,"FriendList",[1,"",["0.350436 * safezoneW + safezoneX","0.328426 * safezoneH + safezoneY","0.0825183 * safezoneW","0.109982 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1501,"MemberList",[1,"",["0.572204 * safezoneW + safezoneX","0.328426 * safezoneH + safezoneY","0.0825183 * safezoneW","0.109982 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2401,"RemoveBtn",[1,"Remove",["0.486589 * safezoneW + safezoneX","0.403214 * safezoneH + safezoneY","0.0825183 * safezoneW","0.0329946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1502,"TextureList",[1,"",["0.350436 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0825183 * safezoneW","0.142977 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2402,"SetTextureBtn",[1,"<-Set Texture",["0.350436 * safezoneW + safezoneX","0.653975 * safezoneH + safezoneY","0.0825183 * safezoneW","0.0329946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"TexturesText",[1,"Select Texture",["0.350436 * safezoneW + safezoneX","0.478004 * safezoneH + safezoneY","0.0825183 * safezoneW","0.0219964 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1503,"LabelList",[1,"",["0.572204 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.0825183 * safezoneW","0.142977 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2403,"SetLabelBtn",[1,"Set Label",["0.572204 * safezoneW + safezoneX","0.653975 * safezoneH + safezoneY","0.0825183 * safezoneW","0.0329946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1004,"ToAdd",[1,"Add friend",["0.350436 * safezoneW + safezoneX","0.302032 * safezoneH + safezoneY","0.0825183 * safezoneW","0.0219964 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1005,"MembersText",[1,"Members",["0.572203 * safezoneW + safezoneX","0.302032 * safezoneH + safezoneY","0.0825183 * safezoneW","0.0219964 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1003,"SelectPictureText",[1,"Select Picture",["0.572204 * safezoneW + safezoneX","0.478004 * safezoneH + safezoneY","0.0825183 * safezoneW","0.0219964 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2404,"UpgradeBtn",[1,"Upgrade",["0.438111 * safezoneW + safezoneX","0.653975 * safezoneH + safezoneY","0.128935 * safezoneW","0.0329946 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1100,"UpgradeText",[1,"",["0.438111 * safezoneW + safezoneX","0.5 * safezoneH + safezoneY","0.128935 * safezoneW","0.142977 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]
]
*/

class RRPDialogContainerManage
{
	
	idd = 26200;
	onLoad = "uiNamespace setVariable ['RRPDialogContainerManage',_this # 0]";
	onUnload = "uiNamespace setVariable ['RRPDialogContainerManage',displayNull]";
	name = "RRPDialogContainerManage";
	class controlsBackground
	{
		class background: RRP_background_fade
		{
			idc = -1;
			x = 0.344886 * safezoneW + safezoneX;
			y = 0.291034 * safezoneH + safezoneY;
			w = 0.316945 * safezoneW;
			h = 0.40705 * safezoneH;
		};
		class title: RRP_title
		{
			idc = -1;

			text = "Управление "; //--- ToDo: Localize;
			x = 0.344886 * safezoneW + safezoneX;
			y = 0.269038 * safezoneH + safezoneY;
			w = 0.30732 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
		class Exit: RRP_btn_exit_text
		{
			idc = -1;
			text = "X"; //--- ToDo: Localize;
			x = 0.652109 * safezoneW + safezoneX;
			y = 0.269038 * safezoneH + safezoneY;
			w = 0.00969463 * safezoneW;
			h = 0.0219964 * safezoneH;
		};
	};
	class controls
	{
            class ToAdd: RRP_btn_blue
            {
                idc = 26201;
                text = "Добавить"; //--- ToDo: Localize;
                x = 0.438111 * safezoneW + safezoneX;
                y = 0.328427 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.0329946 * safezoneH;
				onButtonClick = "[""addMember""] call RRPClient_containers_gang_manage";

            };
            class ToAddText: RRP_RscStructuredText
            {
                idc = 26202;
                text = "Добавить в ящик"; //--- ToDo: Localize;
                x = 0.350436 * safezoneW + safezoneX;
                y = 0.302032 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.0219964 * safezoneH;
            };
            class FriendList: RRP_RscListBox
            {
                idc = 26203;
                x = 0.350436 * safezoneW + safezoneX;
                y = 0.328426 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.109982 * safezoneH;
            };
            class MembersText: RRP_RscStructuredText
            {
                idc = 26204;
                text = "Имеют доступ"; //--- ToDo: Localize;
                x = 0.572203 * safezoneW + safezoneX;
                y = 0.302032 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.0219964 * safezoneH;
            };
            class MemberList: RRP_RscListBox
            {
                idc = 26205;
                x = 0.572204 * safezoneW + safezoneX;
                y = 0.328426 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.109982 * safezoneH;
            };
            class RemoveBtn: RRP_btn_blue
            {
                idc = 26206;
                text = "Удалит"; //--- ToDo: Localize;
                x = 0.486589 * safezoneW + safezoneX;
                y = 0.403214 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.0329946 * safezoneH;
				onButtonClick = "[""removeMember""] call RRPClient_containers_gang_manage";
            };
            class TextureList: RRP_RscListBox
            {
                idc = 26207;
                x = 0.350436 * safezoneW + safezoneX;
                y = 0.5 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.142977 * safezoneH;
            };
            class SetTextureBtn: RRP_btn_blue
            {
                idc = 26208;
                text = "Уст. текстуру"; //--- ToDo: Localize;
                x = 0.350436 * safezoneW + safezoneX;
                y = 0.653975 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.0329946 * safezoneH;
				onButtonClick = "[""setColor""] call RRPClient_containers_gang_manage";
            };
            class TexturesText: RRP_RscStructuredText
            {
                idc = 26209;
                text = "Выберите текстуру"; //--- ToDo: Localize;
                x = 0.350436 * safezoneW + safezoneX;
                y = 0.478004 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.0219964 * safezoneH;
            };
            class SelectPictureText: RRP_RscStructuredText
            {
                idc = 26210;
                text = "Выберите наклейку"; //--- ToDo: Localize;
                x = 0.572204 * safezoneW + safezoneX;
                y = 0.478004 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.0219964 * safezoneH;
            };
            class LabelList: RRP_RscListBox
            {
                idc = 26211;
                x = 0.572204 * safezoneW + safezoneX;
                y = 0.5 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.142977 * safezoneH;
            };
            class SetLabelBtn: RRP_btn_blue
            {
                idc = 26212;
                text = "Уст. наклейку"; //--- ToDo: Localize;
                x = 0.572204 * safezoneW + safezoneX;
                y = 0.653975 * safezoneH + safezoneY;
                w = 0.0825183 * safezoneW;
                h = 0.0329946 * safezoneH;
				onButtonClick = "[""setPicture""] call RRPClient_containers_gang_manage";
            };
            class UpgradeBtn: RRP_btn_blue
            {
                idc = 26213;
                text = "Улучшить"; //--- ToDo: Localize;
                x = 0.438111 * safezoneW + safezoneX;
                y = 0.653975 * safezoneH + safezoneY;
                w = 0.128935 * safezoneW;
                h = 0.0329946 * safezoneH;
				onButtonClick = "[""addSlot""] call RRPClient_containers_gang_manage";
            };
            class UpgradeText: RscStructuredText
            {
                idc = 26214;
				text = "<t>Можно улучшить<br/>Тут написать стату ящика</t>";
                x = 0.438111 * safezoneW + safezoneX;
                y = 0.5 * safezoneH + safezoneY;
                w = 0.128935 * safezoneW;
                h = 0.142977 * safezoneH;
            };
        };
};

