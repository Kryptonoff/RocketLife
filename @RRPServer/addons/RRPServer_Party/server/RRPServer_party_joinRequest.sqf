
params ["_group","_netPlayer"]

try{
	private _player = objectFromNetId _netPlayer;
	if (isNull _player) throw "Приглашаемый не определен";
	if (isNull _group) throw "Тусовка не определена";

	_mutex = _group getVariable ["mutex",false];
	if (_mutex) throw "Что то пошло не так, попробуйте еще раз!";
	_group setVariable ["mutex",true];
	
	if (count _members >= getNumber (missionConfigFile >> "CfgParty" >> "maxMembers")) throw "Достигнут лимит!";
	if (count (units _group) >= getNumber (missionConfigFile >> "CfgParty" >> "maxMembers")) throw "В этой тусовке достигнут лимит участников!";
	["InfoTitleOnly",[format["'%1' присоединился к тусовке!",_player call getNickName]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_group];
	[_player] joinSilent _group;
	[_group] remoteExecCall ["RRPClient_party_joinResponse",_player];
	_group setVariable ["mutex",false];
}catch{
	["ErrorTitleAndText",["Тусовка!",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",remoteExecutedOwner];
	_group setVariable ["mutex",false];

};