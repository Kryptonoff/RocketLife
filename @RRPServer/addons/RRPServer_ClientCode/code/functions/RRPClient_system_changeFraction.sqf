/*
	Project: Rimas Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private["_action","_price"];
try
{
	if (player getVariable ["isBeginner",false]) throw "Данная функция вам недоступна";
	if (count RRPClientGroupInfo isNotEqualTo 0) throw format["Сначала нужно покинуть организацию '%1'",RRPClientGroupInfo get "name"];
	if (!isNil "RRPClientWaitResponse") throw "Ожидайте ответ...";
	switch (player call getSide)do
	{
		case "civ": {
			private _price = 50000;
			if (RRPClientAtmMoney < _price) throw format ["У вас недостаточно средств на банковском счете! Стоимость услуги составляет $%1",[_price] call RRPClient_util_numberText];
			[
				(findDisplay 46),
				{
					[player,"reb",_this select 0] remoteExecCall ["RRPServer_system_changeFraction",2];
					RRPClientWaitResponse = true;
				},[_price],
				"Хотите сжечь паспорт?",
				format["Вы уверены что хотите предать свою родину и переметнутся к бандитам? Это будет стоить вам $%1",[_price] call RRPClient_util_numberText]
			] call RRPClient_util_prompt;
		};
		case "reb": {
			private _price = 30000;
			if (RRPClientAtmMoney < _price) throw format ["У вас недостаточно средств на банковском счете! Стоимость услуги составляет $%1",[_price] call RRPClient_util_numberText];
			[
				(findDisplay 46),
				{
					[player,"civ",_this select 0] remoteExecCall ["RRPServer_system_changeFraction",2];
					RRPClientWaitResponse = true;
				},[_price],
				"Хотите сжечь паспорт?",
				format["Вы уверены что хотите предать свою родину и переметнутся к бандитам? Это будет стоить вам $%1",[_price] call RRPClient_util_numberText]
			] call RRPClient_util_prompt;

		};
		default { throw "Фракция не определена" };
	};
}catch{
	["ErrorTitleOnly",[_exception]] call SmartClient_gui_toaster_addTemplateToast;
};
true
