/*
	Project: Aurora Role Play
	Name: RRPClient_perks_buyXp
	Author: FairyTale#5571
	License: CC BY-ND
*/
[] spawn{
try {
	if (RRPClientAtmWaitingResponse) throw "Предыдущая операция еще не завершена!";

	private _required = [VRP_Level] call RRPClient_perks_getRequiredXP;
	private _currentXP = VRP_XP;
	private _neededXpToBuy = _required - _currentXP;
	if (_neededXpToBuy < 1) throw "У вас уже максимальный уровень!";
	private _xpForRuble = getNumber(missionConfigFile >> "CfgProgression" >> "Leveling" >> "xpForRuble");
	private _needToPay = ceil((_neededXpToBuy / _xpForRuble) * 6.6);

	private _action = [
		format["Вы можете сохранить свое время и приобрести %1 XP за %2 RC чтобы побыстрее перейти на новый уровень", _neededXpToBuy, _needToPay],
		"Save time",
		"Да",
		"Нет"
	] call BIS_fnc_guiMessage;

	if !(_action) throw "Вы отказались от покупки XP";
	if (RRPClientCredits < _needToPay) throw "У вас недостаточно RC для покупки XP";

	[player, _neededXpToBuy, _needToPay] remoteExecCall ["RRPServer_perks_buyXP", 2];
} catch {
	["Save time", _exception] call toastError;
};}