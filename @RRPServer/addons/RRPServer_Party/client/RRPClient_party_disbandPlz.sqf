/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

["InfoTitleOnly",[format["Тусовка '%1' была распущена!",groupId (group player)]]] call SmartClient_gui_toaster_addTemplateToast;
private _display = uiNamespace getVariable ["RRPDialogTablet",displayNull];
if !(isNull _display) then 
{
	["MainMenu",0] call RRPClient_tablet_slide;
};
[player] joinSilent (createGroup independent);
RRPClientPartyID = "";
call RRPClient_party_destroyPanel;
