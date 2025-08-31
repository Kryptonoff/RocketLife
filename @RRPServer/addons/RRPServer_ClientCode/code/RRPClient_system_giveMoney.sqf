/*	
	Filename: 	RRPClient_system_giveMoney.sqf
	Project: 	Rimas Altis Life RPG
*/
try{
	if (isNil {life_giveMoneyUnit}) throw "Ошибка";
	if (isNull life_giveMoneyUnit) throw "Ошибка";
	if (life_giveMoneyUnit isEqualTo player) throw "Вы не можете передать самому себе";

	private _val = ctrlText 5202;
	if !([_val] call RRPClient_system_isnumber) throw "Вы ввели неправильную сумму.";
	private _amount = parseNumber _val; 
	if (_amount > RRPClientCashMoney) throw "У вас недостаточно наличности.";
	if (_amount < 1) throw "Вы ввели неправильную сумму.";
	[player,life_giveMoneyUnit, _amount] remoteExecCall ["RRPServer_system_sendMoney",2];

	
	closeDialog 0;
}catch{
	["Деньги",_exception] call toastError;
};
