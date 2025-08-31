/*
    Author(s):
    SteamID: 76561198090549826
    Discord: arrra#9745
*/

try {
	private ["_type","_itemInfo","_amount","_price"];
	if life_action_inUse throw "Вы уже выполняете какое-то действие!";
	if RRPLockToSellResource throw "Обновление цен, ожидайте...";

	call RRPClient_actions_inUse;

	_type = getText(missionConfigFile >> "CfgFed" >> "awardItem");
	_itemInfo = _type call RRPClient_economy_getResInfo;
	if (_itemInfo isEqualTo "") throw ("Не опрделен ресурс:" + _type);

	_amount = missionNamespace getVariable [format ["life_inv_%1", getText(missionConfigFile >> "VirtualItems" >> _type >> "variable")],0];
	if (_amount isEqualTo 0) throw "У вас нет предметов для возврата";

	_price = ((_type call RRPClient_economy_getResInfo select 2) * _amount);
	_price = round(_price * getNumber(missionConfigFile >> "CfgFed" >> "returnComission"));

	if !([false,_type,_amount] call RRPClient_system_handleInv) throw "Не получилось удалить предметы";

	[1, "add", _price] remoteExecCall ["RRPServer_groups_moneyChange", 2];

	call RRPClient_system_saveGear;
	life_action_inUse = false;

	["SuccessTitleAndText", ["Предмет возвращен", format["Вы вернули %1 %2. $%3 начислены на счет вашей организации",_amount,getText(missionConfigFile >> "VirtualItems" >> _type >> "displayName"),[_price] call RRPClient_util_numberText]]] call SmartClient_gui_toaster_addTemplateToast;
	[50,"возврат золота"] call addXP;
} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
	life_action_inUse = false;
};
