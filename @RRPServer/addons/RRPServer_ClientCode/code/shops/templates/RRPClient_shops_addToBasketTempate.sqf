/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_display","_TemplateList","_tempates","_selectIndex","_curSelect","_selectedTemplate","_filtredTemplate","_badCondItems","_mode","_shopName"];
(["tempateSwitcher"] call RRPClient_shops_utils) params ["_idcList","_idcSetName","_arrayName","_dialogName","_basketVarName"];

try {
    _display = uiNamespace getVariable [_dialogName,displayNull];
    _templateList = _display displayCtrl _idcList;
    _tempates = profileNameSpace getVariable [_arrayName,[]];
    _curSelect = (lbCurSel _templateList);
    if (_curSelect isEqualTo -1) throw "Вы не выбрали шаблон";
    _selectIndex = _templateList lbData _curSelect;

    _mode = if (_dialogName isEqualTo "RRPDialogWeaponShop") then {"weapon"} else {"clothing"};

    if (_mode isEqualTo "weapon") then {
        if (weaponShopMode isEqualTo "sell") throw "Вы не можете пользоватся шаблонами при продаже вещей!";
    };

    _filtredTemplate = [];
    _badCondItems = "";
    if !(_shopName isEqualTo currentShop) throw "";
    _selectedTemplate = ((_tempates # (parseNumber  _selectIndex)) # 0);
    _shopName = (_tempates # (parseNumber  _selectIndex)) # 2;
    {
        private ["_condition","_class","_itemInfo","_displayName"];
        _class = _x # 0;

        _itemInfo = [_class] call RRPClient_util_itemDetails;
        _displayName = _itemInfo # 1;
        _condition = if (_mode isEqualTo "clothing") then {
                getText(missionConfigFile >> "clothing_settings" >> _class >> "condition_sell")
            } else {
                getText(missionConfigFile >> "LifeCfgItems" >> _class >> "conditions_buy")
        };

        if ([_condition] call RRPClient_util_conditionsCheck) then {
            _filtredTemplate pushBack (_x);
        } else {
            _badCondItems =  _badCondItems + format ["%1<br/>",_displayName];
        };
    } forEach _selectedTemplate;

    if (count _badCondItems > 0) then {
        ["WarningTitleAndText", ["На вещи с этого списка ограничен доступ, они не попали в корзину :(", parseText _badCondItems]] call SmartClient_gui_toaster_addTemplateToast;
    };

     missionNamespace setVariable [_basketVarName, _filtredTemplate];
     call (if (_mode isEqualTo "weapon") then {RRPClient_weapon_updateBasket} else {RRPClient_system_updateBasket});

} catch {
    ["WarningTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
