/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

["UpdateRank",_this,false] call RRPClient_util_logArray;
RRPClientGroupInfo = _this select 0;
RRPClientGroupLevel = _this select 1;
player setVariable ["lvl",RRPClientGroupLevel,true];
call RRPClient_tags_setTags;
call RRPClient_system_setTag;
["InfoTitleAndText",["Организация",format["Вы были %1!",_this select 2]]] call SmartClient_gui_toaster_addTemplateToast;
call RRPClient_groups_updateListMembers;