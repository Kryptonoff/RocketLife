/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if ((leader group player) isEqualTo player) exitWith {["InfoTitleOnly",["Вы не можете покинуть тусовку, пока не передадите лидерство другому!"]] call SmartClient_gui_toaster_addTemplateToast;};
["InfoTitleOnly",[format["%1 покинул тусовку!",player call getNickName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",group player];
["MainMenu",0] call RRPClient_tablet_slide;
[player] joinSilent (createGroup independent);
RRPClientPartyID = "";
call RRPClient_party_destroyPanel;
