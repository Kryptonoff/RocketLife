/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

["InfoTitleOnly",[format["'%1' отклонил приглашение!",player call getNickName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",leader (groupFromNetId RRPClient_temp_waitRequest)];
RRPClient_temp_waitRequest = nil;
