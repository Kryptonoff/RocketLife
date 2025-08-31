/*
	Project: Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _player = param [0,objNull];
try
{
	if (isNull _player) throw "С ним что-то не так...";
	if !(isPlayer _player) throw "Это не игрок";
	private _group = group player;
	private _members = units _group;
	private _leader = leader _group;
	if !(_leader isEqualTo player) throw "Вы не лидер!";
	if (count _members >= getNumber (missionConfigFile >> "CfgParty" >> "maxMembers")) throw "Достигнут лимит!";
	private _text = [
		format["Приглашение в тусовку для '%1' отправлено",_player call getNickName],
		"Приглашение было отправлено"
	] select ( ([getPlayerUID _player,life_ids] call RRPClient_system_index) isEqualTo -1);
		["SuccessTitleOnly",[_text]] call SmartClient_gui_toaster_addTemplateToast;
	
	[group player] remoteExec ["RRPClient_party_inviteMe",_player];
}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
