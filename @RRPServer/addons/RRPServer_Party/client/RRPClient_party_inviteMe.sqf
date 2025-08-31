/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

if (!canSuspend) exitWith {_this spawn RRPClient_party_inviteMe};
private _group = _this select 0; 
private _groupName = groupID _group;
private _members = units _group;
if (count _members >= getNumber (missionConfigFile >> "CfgParty" >> "maxMembers")) exitWith
{
	["InfoTitleOnly",["Достигнут лимит тусовки!"]] call SmartClient_gui_toaster_addTemplateToast;
};
	
if !(isNil "RRPClient_temp_waitRequest") exitWith {};
if !(RRPClientPartyID isEqualTo "") exitWith {};
["InfoTitleAndText",[format["Вы были приглашены в тусовку '%1'!",_groupName],"Принять предложение можно в планшете, по кнопке 'Тусовка!'"]] call SmartClient_gui_toaster_addTemplateToast;
RRPClient_temp_waitRequest = netId _group;
private _time = time;
waitUntil {_time + 300 < time}; 
if (isNil "RRPClient_temp_waitRequest") exitWith {};
RRPClient_temp_waitRequest = nil;
["InfoTitleOnly",[format["Срок приглашения в тусовку '%1' истек!",_groupName]]] call SmartClient_gui_toaster_addTemplateToast;
