/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

params [
    ["_control",controlNull,[controlNull]],
    ["_index",-1,[0]]
];

try {
    private ["_display"];
    if (isNull _control OR _index isEqualTo -1) exitWith {closeDialog 0;};
    _display = uiNamespace getVariable ["RRPDialogWeaponShop",displayNull];

    private ["_priceTag","_magsButtonAddCat","_magsList","_magsCount","_magsBG","_class","_itemInfo","_infoDesc","_Filter","_price"];

    _priceTag = _display displayCtrl 38404;
    _magsButtonAddCat = _display displayCtrl 38409;
    _magsList = _display displayCtrl 38407;
    _magsCount = _display displayCtrl 38408;
    _magsBG = _display displayCtrl 38410;

    _class = _control lbData _index;
    (_class call RRPClient_weapon_getItemInfo) params ["_conditionsBuy","_conditionsBuyMsg","_conditionUse","_conditionUseMsg","_sellPrice","_conditionSellPrice","_price"];
    _itemInfo = [_class] call RRPClient_util_itemDetails;
    _conditionsBuy = if !(_conditionsBuy isEqualTo "") then {call (compile _conditionsBuy) }else {true};
    [_class,_itemInfo select 4] spawn RRPClient_system_shopBoxWeaponRotate;

    _infoDesc = if !((_itemInfo select 3) isEqualTo "") then {
        format["%1",_itemInfo select 3];
    } else {""};

    _Filter = uiNamespace getVariable["Weapon_Shop_Filter",0];
    if (_Filter isEqualTo 1) then {
        _priceTag ctrlSetStructuredText parseText format ["<t size='0.85'>Цена продажи: <t color='#3f6b00'>$%1</t><br/><br/><t size='0.85' color='%3'>%2</t>",0,_infoDesc];
    } else {
        _price = ["countPrice",_price] call RRPClient_shops_utils;
        if (_conditionsBuyMsg isEqualTo "") then {
            _conditionsBuyMsg = "У вас нет доступа"
        };

        ([_class] call RRPClient_shops_getLimitedItemInfo) params ["_maxLimit","_curLimit"];

        _priceTag ctrlSetStructuredText parseText (if (weaponShopMode isEqualTo "buy") then {
            format ["<t size='1' >Цена: <t color='#3f6b00'>%1</t><br/><t size='0.85'>Доступ: %2<br/><t size='0.85'>Лимит: %3</t><br/><br/><t size='0.85'>%4</t>",
            (format["  %1 %2", [_price] call RRPClient_util_numberText,["getName"] call RRPClient_shops_utils]),
            if (_conditionsBuy) then {"Доступно"} else {_conditionsBuyMsg},
            if (_maxLimit isEqualTo -1 AND _curLimit isEqualTo -1) then {"Нет лимита на покупку"} else {format ["%1/%2",_curLimit,_maxLimit]},
            _infoDesc]
        } else {
            format ["<t size='1' >Цена: <t color='#3f6b00'>%1</t><br/><t size='0.85'>Доступ: %2<br/><br/><br/><t size='0.85'>%3</t>",_sellPrice,if (_conditionsBuy) then {"Доступно"} else {_conditionsBuyMsg},_infoDesc]
        });


        if (count (_itemInfo select 7) > 0 AND weaponShopMode isEqualTo 'buy') then {
            (_itemInfo # 7) call RRPClient_system_updateMagsList;
        } else {
            if (ctrlshown _magsBG) then {
                _magsList ctrlShow false;
                _magsCount ctrlShow false;
                _magsButtonAddCat ctrlShow false;
                _magsBG ctrlShow false;
            };
        };

    };
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
