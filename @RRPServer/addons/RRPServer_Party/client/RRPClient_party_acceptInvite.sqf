/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _group = groupFromNetId RRPClient_temp_waitRequest;
if (count _members >= getNumber (missionConfigFile >> "CfgParty" >> "maxMembers")) exitWith
{
	["InfoTitleOnly",["Достигнут лимит тусовки!"]] call SmartClient_gui_toaster_addTemplateToast;
	RRPClient_temp_waitRequest = nil;
};

[
	_group,
	netId player
] remoteExecCall ["RRPServer_party_joinRequest",2];	
