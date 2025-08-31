try {
    private ["_totalPrice","_display"];

    _display = uiNamespace getVariable ["RRPDialogWeaponShop",displayNull];
    if (isNull _display) throw "RRPDialogWeaponShop isNull";
    if (RRPClientWaitingMyCashResponse) throw "Предыдущая транзакция еще не завершена!";
    if ((time - life_action_delay) < 5) throw "Предыдущая транзакция еще не завершена!";
    if (!canBuy) throw "";
    life_action_delay = time;

    _totalPrice = uiNamespace getVariable ["WeaponShopTotalPrice",0];
    if (_totalPrice <= 0) throw "Ошибка при расчете цены...";


    switch (weaponShopMode) do {
        case ("sell"): {
            if !(str(["getPlayerInv"] call RRPClient_shops_utils) isEqualTo str rawInventory) throw "Нельзя изменять содержимое инвентаря!";
            {
                _x params ["_className","_count"];
                for "_i" from 1 to _count do {
                    switch (true) do {
                        case (primaryWeapon player isEqualTo _className): {
                            player removeWeapon _className;
                        };
                        case (secondaryWeapon player isEqualTo _className): {
                            player removeWeapon _className;
                        };
                        case (handgunWeapon player isEqualTo _className): {
                            player removeWeapon _className;
                        };
                        default {
                            player removeItem _className;
                        };
                    };
                };
            } forEach (uiNamespace getVariable ["WeaponShopItemsList", []]);
            if !(_totalPrice call RRPCLient_system_changeMoney) throw "Ошибка при продаже";
            [format ["BUY weapon | mode: %1 |  Items: %2 | Sum: %3 | UID: ",currencyType,(uiNamespace getVariable ["WeaponShopItemsList", []]),_totalPrice, getPlayerUID player],"shopLog"] call RRPServer_system_logIt;
            ["SuccessTitleAndText", ["Вещи проданы!", format ["На сумму %1$",_totalPrice]]] call SmartClient_gui_toaster_addTemplateToast;
        };

        case ("buy"): {
            if !(_totalPrice call RRPCLient_system_changeMoney) throw "Ошибка при покупке";
            {
                _x params ["_className","_count"];
                for "_i" from 1 to _count do {
                    [_className] call RRPClient_inventory_addItemToInventory;
                };
                if (isClass(missionConfigFile >> "config_limitedItems" >> _className)) then {
                    [_className,_count] call RRPClient_shops_updateLimitItem;
                };
            } forEach (uiNamespace getVariable ["WeaponShopItemsList", []]);
            [format ["BUY weapon | mode: %1 |  Items: %2 | Sum: %3 | UID: ",currencyType,(uiNamespace getVariable ["WeaponShopItemsList", []]),_totalPrice, getPlayerUID player],"shopLog"] call RRPServer_system_logIt;
        };
    };

    closeDialog 0;
    call RRPClient_system_saveGear;
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
