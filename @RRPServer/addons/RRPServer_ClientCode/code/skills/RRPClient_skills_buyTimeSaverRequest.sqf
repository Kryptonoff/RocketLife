/*
	Project: Rimas Role Play
	Author: FairyTale5571
	License: CC BY-ND
*/

private _prof = param [0,"",[""]];
try {
	if (_prof isEqualTo "") throw "Данные не определены!";
	if (RRPClientAtmWaitingResponse) throw "Предыдущая операция еще не завершена!";
	private _configPath = getMissionConfig "CfgSkills" >> _prof;
	(missionNamespace getVariable [_prof, [0,0]]) params ["_currentLvl", "_currentXp"];
	 
	private _xpPerRc = getNumber(_configPath >> "xpPerRc");

	private _nextLevelXp = _currentLvl * (_currentLvl - 1) * 1500;
	if (_nextLevelXp < 1) then {_nextLevelXp = 1500;};

	private _neededXpToBuy = _nextLevelXp - _currentXp;
	private _cost = ceil(_neededXpToBuy / _xpPerRc);

	if (RRPClientCredits < _cost) throw "Недостаточно средств для покупки!";
	if (_currentLvl >= getNumber(_configPath >> "maxLevel")) throw "У вас уже максимальный уровень!";
	//["buyXP",[_prof]] call RRPClient_system_send;
	
	RRPClientAtmWaitingResponse = true;
	[player, _prof, _neededXpToBuy] remoteExecCall ["RRPServer_skills_buyXP",2];
	closeDialog 0;
	["InfoTitleAndText",["Навык!","Сохраняем ваше время..."]] call SmartClient_gui_toaster_addTemplateToast;
} catch {
	["ErrorTitleAndText",["Навык!",_exception]] call SmartClient_gui_toaster_addTemplateToast;
};