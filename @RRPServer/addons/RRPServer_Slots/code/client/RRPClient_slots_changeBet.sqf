//RRPClient_slots_changeBet
private _display = findDisplay 7200;
private _bet = ctrlText (_display displayCtrl 7201);

try {
	if !([_bet] call RRPClient_system_isnumber) throw "Некорректный ввод. Введите сумму.";
	_bet = parseNumber(_bet);
	if (_bet <= 0) throw "Укажите положительное значение";
	if (_bet > RRPClientCashMoney) throw "У вас недостаточно наличности.";

	profilenamespace setvariable ["RRP_SlotsBet", _bet];
	saveProfileNamespace;
	["Однорукий бандит", "Вы успешно изменили ставку!"] call toastSuccess;
} catch {
	["Однорукий бандит", _exception] call toastError;
};
