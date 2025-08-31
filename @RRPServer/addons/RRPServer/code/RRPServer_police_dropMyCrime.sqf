/*
	Project: Police Systems for Aurora Role Play
	Author: FairyTale#5571
	License: CC BY-ND
*/

private _id = param [0,-1,[-1]];
private _crime = param [1,"",[""]];
private _player = param [2,objNull,[objNull]];
try
{
	if (_id isEqualTo -1) throw "Ошибка с ID преступления!";
	if (_crime isEqualTo "") throw "Не могу найти такое нарушение...";
	if !(getNumber(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "easy") isEqualTo 1) throw "Это преступление нельзя погасить! Обратитесь к сотруднику полиции!";
	if ((_player getVariable ["RRPCash",0]) < (getNumber(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "reward"))) throw "Недостаточно средств, чтобы погасить выбранное нарушение!";
	format ["copDB_setActiveCrime:0:%1",_id] call RRPServer_DB_fireAndForget;
	["SuccessTitleAndText",["Одобрен!",format ["Преступление '%1' было погашено!",getText(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "displayName")]]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
	[_player,"cash","take",STR(getNumber(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "reward")),[format["%1 (%2) погасил преступление '%3' за $%4",
		name _player,
		getPlayerUID _player,
		getText(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "displayName"),
		getNumber(missionConfigFile >> "LifeCfgCrimes" >> _crime >> "reward")
		],"DropCrime_Logs"]
	] call RRPServer_system_moneyChange;
	[] remoteExecCall ["RRPClient_police_dropCrimeResponse",_player];
}catch{
	["ErrorTitleAndText",["Ошибка!",_exception]] remoteExecCall ["SmartClient_gui_toaster_addTemplateToast",_player];
};
