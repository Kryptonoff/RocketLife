/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

_this params ["_mode","_numb"];
switch (_mode) do {
    case ("getRcCoef"): {getNumber(missionConfigFile >> "shopSettings" >> "rc_coef")};
    case ("getComission"): {["atmComission",getNumber(missionConfigFile >> "shopSettings" >> "commission")] call RRPClient_system_VIP};
    case ("countRcPrice") : {ceil (_numb * (["getRcCoef"] call RRPClient_shops_utils))};
    case ("getComissionPrice") : {ceil (_numb * ((["getComission"] call RRPClient_shops_utils)/100))};
    case ("countPrice") : {
        if !(currencyType isEqualTo 'rc') then {["priceSell",_numb] call RRPClient_system_VIP
        } else {
            ["countRcPrice",_numb] call RRPClient_shops_utils
        }
};
    case ("update"): {
        currencyType = (uiNamespace getVariable ["RRPDialogClothingShop",displayNull]) displayCtrl 31011 lbData lbCurSel 31011;
        call RRPClient_system_renderAssortmentList;
        call RRPClient_system_updateBasket;

    };

    case ("updateWeapon"): {
        if (weaponShopMode isEqualTo 'buy') then {
            currencyType = (uiNamespace getVariable ["RRPDialogWeaponShop",displayNull]) displayCtrl 38428 lbData lbCurSel 38428;
            call RRPClient_system_renderListItems;
            call RRPClient_weapon_updateBasket;
        } else {
            RRPWeaponBasket = [];
        };
    };

    case ("getName"): {
        {
            if (_x # 0 isEqualTo currencyType) exitWith {_x # 1}
        } forEach getArray(missionConfigFile >> "shopSettings" >> "currencyList")
    };

    case ("setSwitchBuySell"): {
        weaponShopMode = (uiNamespace getVariable ["RRPDialogWeaponShop",displayNull]) displayCtrl 38402 lbData lbCurSel 38402;
    };

    case ("getPlayerInv"): {
        ((uniformItems player) + (vestItems player) + (backPackItems player) + [primaryWeapon player] + [secondaryWeapon player] + [handgunWeapon player])
    };

    case ("tempateSwitcher"): {
        if (isNull (uiNamespace getVariable ["RRPDialogClothingShop",displayNull])) then {
            [38418,38419,"PRNS_Templates","RRPDialogWeaponShop","RRPWeaponBasket"]
        } else {
            [3114,3115,"PRNS_Templates","RRPDialogClothingShop","RRPClothingBasket"]
        };
    };

    case ("countSellPrice"): {
        if (getNumber(missionConfigFile >> "LifeCfgItems" >> _this >> "fix_sell_price") isEqualTo 0) then {round(getNumber(missionConfigFile >> "LifeCfgItems" >> _this >> "price") * 0.3)} else {getNumber(missionConfigFile >> "LifeCfgItems" >> _this >> "fix_sell_price")}
    };
};
