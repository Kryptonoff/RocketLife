//RRPClient_slots_run
try {
	private _slots_machine = param [0, objNull, [objNull]];
	private _bet = profilenamespace getvariable ["RRP_SlotsBet", 10000];
	
	if (_bet > RRPClientCashMoney) throw "У вас недостаточно наличности.";
	if (_slots_machine getvariable ["SlotsRunning", false]) throw "Автоматом кто-то пользуется, подождите";

	// player switchMove "RRP_casino_slot_vgo_driver";
	// player playMoveNow "RRP_casino_slot_vgo_driver";
	// player attachTo [_slots_machine, [0,0,0], "ruchka", true];
	// player setdir 180;
	// _slots_machine animateSource ["ruchka", 0];
	// player switchMove "";
	// detach player;

	[_slots_machine, _bet, player] remoteExecCall ["RRPServer_slots_run", 2];
	["Однорукий бандит", format["Вы поставили $%1", [_bet] call RRPClient_util_numberText]] call toastInfo;
	[5,"игру"] call addXP;
} catch {
	["Однорукий бандит", _exception] call toastError
}
