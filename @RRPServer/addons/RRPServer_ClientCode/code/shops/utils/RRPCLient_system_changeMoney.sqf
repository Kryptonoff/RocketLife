/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private _res = false;
if (weaponShopMode isEqualTo "sell" AND (isNull (uiNamespace getVariable ["RRPDialogClothingShop",displayNull]))) then {
    [player,"cash","add",STR(_this)] remoteExecCall ["RRPServer_system_moneyChange",2];
    ["SuccessTitleOnly",[format ["Продали на сумму %1 %2",_this,["getName"] call RRPClient_shops_utils]]] call toast;
    _res = true;
} else {
    switch (currencyType) do {
        case ('rc'): {
            if (RRPClientCredits < _this) throw format ["Недостаточно %1 RC",_this - RRPClientCredits];
            [player,"point","take",STR(_this)] remoteExecCall ["RRPServer_system_moneyChange",2];
            ["SuccessTitleOnly",[format ["Покупка на сумму %1 %2",_this,["getName"] call RRPClient_shops_utils]]] call toast;
        };

        case ('atm'): {
            private _comission = ["getComissionPrice",_this] call RRPClient_shops_utils;
            if (RRPClientAtmMoney < _this) throw format ["Недостаточно %1$",_this - RRPClientAtmMoney];
            [player,"atm","take",STR(_this + _comission)] remoteExecCall ["RRPServer_system_moneyChange",2];
            ["SuccessTitleAndText",[format ["Покупка на %1$",_this], format ["Комиссия: %1$",_comission]]] call SmartClient_gui_toaster_addTemplateToast;
        };

        case ('cash'): {
            if (RRPClientCashMoney < _this) throw format ["Недостаточно %1$",_this - RRPClientCashMoney];
            [player,"cash","take",STR(_this)] remoteExecCall ["RRPServer_system_moneyChange",2];
            ["SuccessTitleOnly",[format ["Покупка на сумму %1 %2",_this,["getName"] call RRPClient_shops_utils]]] call toast;
        };

    };
    _res = true;
};


_res
