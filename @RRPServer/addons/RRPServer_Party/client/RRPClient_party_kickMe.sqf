/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

["InfoTitleOnly",["Вас выгнали с тусовки, пичалька =("]] call SmartClient_gui_toaster_addTemplateToast;
[player] joinSilent (createGroup independent);
RRPClientPartyID = "";
call RRPClient_party_destroyPanel;
if (!isNull (uiNamespace getVariable ["RRPDialogTablet",displayNull])) then {["MainMenu",0] call RRPClient_tablet_slide};
