//RRPServer_perks_buyXP
diag_log _this;
private _paramsCheck = params [
	["_player", objNull, [objNull]],
	["_neededXpToBuy", 0, [0]],
	["_needToPay", 0, [0]]
];

try {
	if !(_paramsCheck) throw "Произошла ошибка!";

	private _points = _player getVariable ["RRPPoint", 0];
	if (_points < _needToPay) throw "У вас недостаточно RC для покупки XP";

	if !([_player, "point", "take", _needToPay] call RRPServer_system_moneyChange) throw "Произошла ошибка в процессе снятия RC";

	format ["insertRcLog:%1:%2:%3:%4:%5:%6",serverid,name _player,getPlayerUID _player,"savedXP",_needToPay,
			format ["Купил опыт %1 XP",_neededXpToBuy]
		] call RRPServer_DB_lk_fireAndForget;
	[true, "Вы успешно купили XP!", _neededXpToBuy] remoteExecCall ["RRPClient_perks_buyXpDone", _player];

} catch {
	[false, _exception] remoteExecCall ["RRPClient_perks_buyXpDone", _player];
};