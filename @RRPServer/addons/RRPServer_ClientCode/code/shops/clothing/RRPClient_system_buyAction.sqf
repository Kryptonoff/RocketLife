/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
try {

	disableSerialization;
    private ["_totalPrice","_display"];
	_display = uiNamespace getVariable ["RRPDialogClothingShop",displayNull];
	if (isNull _display) throw "RRPDialogClothingShop isNull";
	if (RRPClientWaitingMyCashResponse) throw "Предыдущая транзакция еще не завершена!";
	if ((time - life_action_delay) < 5) throw "Предыдущая транзакция еще не завершена!";
	if (count RRPClothingBasket < 1) throw "Ваша корзина пуста!";
	life_action_delay = time;

	{
		_x params ["_className","_count"];
		if (isClass(missionConfigFile >> "config_limitedItems" >> _className)) then {
			([_className] call RRPClient_shops_getLimitedItemInfo) params ["_maxLimit","_curLimit"];
			if (_curLimit >= _maxLimit) throw "Некоторых вещей нет в наличии!"
		};
	} forEach (uiNamespace getVariable ["ClothingShopItemsList", []]);

    _totalPrice = uiNamespace getVariable ["ClothingShopTotalPrice", 0];
	if !(_totalPrice call RRPCLient_system_changeMoney) throw "Ошибка при покупке";

    {
        _x params ["_className","_count"];
        for "_i" from 1 to _count do {
			[_className] call RRPClient_inventory_addItemToInventory;
		};
		if (isClass(missionConfigFile >> "config_limitedItems" >> _className)) then {
			[_className,_count] call RRPClient_shops_updateLimitItem;
		};
    } forEach (uiNamespace getVariable ["ClothingShopItemsList", []]);
	[format ["BUY weapon | mode: %1 |  Items: %2 | Sum: %3 | UID: ",currencyType,(uiNamespace getVariable ["ClothingShopItemsList", []]),_totalPrice, getPlayerUID player],"shopLog"] call RRPServer_system_logIt;
    closeDialog 0;
    call RRPClient_system_saveGear;
} catch {
	["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
