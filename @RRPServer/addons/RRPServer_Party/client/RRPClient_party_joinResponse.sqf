
params ["_group"];
RRPClientPartyID = netId _group;
call RRPClient_party_createPanel;
["party_manage",1] call RRPClient_tablet_slide;
["InfoTitleOnly",[format["Вы присоединились к тусовке '%1'!",groupId _group]]] call SmartClient_gui_toaster_addTemplateToast;
RRPClient_temp_waitRequest = nil;