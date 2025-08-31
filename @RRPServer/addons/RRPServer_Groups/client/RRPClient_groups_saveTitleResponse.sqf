/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

RRPClientGroupInfo = _this select 0;
["InfoTitleAndText",["Организация","Звания были обновлены!"]] call SmartClient_gui_toaster_addTemplateToast;
call RRPClient_groups_updateListMembers;
