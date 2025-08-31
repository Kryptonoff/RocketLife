/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

try
{
	if (isNil "RRPClient_temp_waitRequest") throw "Приглашение не активно, вероятно истек его срок!";
	if (RRPClientPartyID != "") throw "Вы уже состоите в тусовке! Покиньте ее для начала!";
	private _group = groupFromNetId RRPClient_temp_waitRequest;
	[
		(findDisplay 46),
		{
			call RRPClient_party_acceptInvite
		},[],
			"Приглашение в тусовку",
			format ["Вы были приглашены в тусовку '%1'! Принимаете приглашение?",groupId _group],
		{
			call RRPClient_party_rejectInvite
		},[]
	] call RRPClient_util_prompt;

}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
false