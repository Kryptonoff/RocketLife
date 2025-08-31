/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
try {
    private ["_shop","_display","_curIndex","_groupID","_config"];
    _curIndex = param [1,-1,[0]];
    _shop = missionNamespace getVariable ["currentShop",""];

    if (_shop isEqualTo "") throw "undefined class shop arg";
    if !(isClass(missionConfigFile >> "LifeCfgWeaponShops" >>_shop)) throw "undefined class shop";
    _display = uiNamespace getVariable ["RRPDialogWeaponShop",displayNull];
    weaponShopMode = if (_curIndex isEqualTo -1) then {'buy'} else {(_display displayCtrl 38402) lbData _curIndex};

    if (weaponShopMode isEqualTo "buy") then {
        {
            (_display displayCtrl _x) ctrlEnable true;
        } forEach [38417,38418,38419,38420,38421,38422,38423];
    } else {
        {
            (_display displayCtrl _x) ctrlEnable false;
        } forEach [38417,38418,38419,38420,38421,38422,38423];
    };

    _groupID = getNumber(missionConfigFile >> "LifeCfgWeaponShops" >>_shop >> "groupID");
    private ["_itemList","_exlusiveItems"];
    _itemList = _display displayCtrl 38403;

    lbClear _itemList;
    switch (weaponShopMode) do {
    	case 'buy': {
            (_display displayCtrl 38406) ctrlEnable true;
            _exlusiveItems  = [];
            if (getNumber(missionConfigFile >> "LifeCfgWeaponShops" >> _shop >> "pushVIPitems") isEqualTo 1) then {
                private _donateItems = (getArray(missionConfigFile >> "LifeCfgWeaponShops" >> "exlusive_weapons" >> "items"));
                {_x pushBack "exlusive"} forEach _donateItems;
                _exlusiveItems = _exlusiveItems + _donateItems;

                private _donateItemsLK = (['weapon', ''] call RRPClient_system_getPurchasedItemsList);
                {_x pushBack "exlusive"} forEach _donateItemsLK;
                _exlusiveItems = _exlusiveItems + _donateItemsLK;

                private _donateGrpItemsLK = (_groupID call RRPClient_system_getGroupRentItems);
                {_x pushBack "groupsItems"} forEach _donateGrpItemsLK;
                _exlusiveItems = _exlusiveItems + _donateGrpItemsLK;
            };

            if (_groupID > 0) then {
                    private _labsItems = getArray(missionConfigFile >> "LifeCfgWeaponShops" >> "labs_items" >> "items");
                    {_x pushBack "labs"} forEach _labsItems;
                _exlusiveItems = _exlusiveItems + _labsItems;
            };

            _config = _exlusiveItems + (getArray(missionConfigFile >> "LifeCfgWeaponShops" >> _shop >> "items"));

    		{
                diag_log format ["item: %1",_x];
    			_x params [["_class","",[""]],["_del",-1,[0]],["_exlusive","",[""]]];
                (_class call RRPClient_weapon_getItemInfo) params ["_conditionsBuy","_conditionsBuyMsg","_conditionUse","_conditionUseMsg","_sellPrice","_conditionSellPrice","_price"];

                if !(isClass(missionConfigFile >> "LifeCfgItems" >> _class)) then { continue };
                if !([_conditionsBuy] call RRPClient_util_conditionsCheck) then { continue };

    			if ([_class] call RRPClient_util_isAddonsConfigCheck) then {
                    private ["_itemInfo","_index"];
                    _itemInfo = [_class] call RRPClient_util_itemDetails;
                    ([_class] call RRPClient_shops_getLimitedItemInfo) params ["_maxLimit","_curLimit"];
    				if (_price > 0) then {
                        _index = _itemList lbAdd format["%1",_itemInfo # 1];
                        _itemList lbSetData[_index,_class];
                        _price = ["countPrice",_price] call RRPClient_shops_utils;
    					_itemList lbSetTextRight [_index, format["  %1 %2", [_price] call RRPClient_util_numberText,["getName"] call RRPClient_shops_utils]];
    					_itemList lbSetValue[_index,_del];
    					_itemList lbSetPicture[_index,_itemInfo select 2];

                        if (_curLimit >= _maxLimit AND _maxLimit > -1) then {
                            lbSetColor [_index, 0, [0.82, 0.82, 0.82, 1]];
                            _itemList lbSetPictureRight [_index,"\RRP_icons\shop\exlusiveContent.paa"];
                            _itemList lbSetTooltip [_index,"Нет в наличии"];
                        };

                        if (_exlusive isEqualTo "exlusive") then {
                            _itemList lbSetPictureRight [_index,"\RRP_icons\shop\exlusiveContent.paa"];
                        };

                        if (_exlusive isEqualTo "groupsItems") then {
                            _itemList lbSetPictureRight [_index,"\rimas_agent\assets\pic\gang_weapon.paa"];
                        };

                        if (_exlusive isEqualTo "labs") then {
                            _itemList lbSetPictureRight [_index,"\rimas_agent\assets\pic\labs_items.paa"];
                        };
    				};
    			};
    		} foreach _config;
    		(_display displayCtrl 38413) ctrlSetText (("Купить") + " содержимое корзины");
    	};
        case 'sell': {
            (_display displayCtrl 38406) ctrlEnable false;

            rawInventory = ["getPlayerInv"] call RRPClient_shops_utils;
            private _playerInventory = [];
            {
                if !(_x isEqualTo "") then {_playerInventory pushBack _x};
            } forEach rawInventory;
            playerInventory = _playerInventory call BIS_fnc_consolidateArray;
            ((_display displayCtrl 38413)) ctrlSetText (("Продать") + " содержимое корзины");
            call RRPClient_system_renderListItemsSell
        };
    };
    call RRPClient_weapon_updateBasket;
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
