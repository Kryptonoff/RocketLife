/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

private ["_totalPrice","_dialog","_BasketList","_ctrDescr","_itemsList", "_btn"];
_dialog = uiNamespace getVariable ['RRPDialogWeaponShop', displayNull];

_BasketList = _dialog displayCtrl 38412;
_btn = _dialog displayCtrl 38413;
lbClear _basketList;
_totalPrice = 0;
_itemsList = [];
canBuy = true;
_btn ctrlEnable true;
{
    private  ["_class","_condition","_conditionsMsg","_priceSell","_priceSellFix"];
    _class = _x # 0;
    _condition = getText(missionConfigFile >> "LifeCfgItems" >> _class >> "conditions_buy");
    _conditionsMsg = getText(missionConfigFile >> "LifeCfgItems" >> _class >> "conditions_buy_message");
    _priceSellFix = getNumber(missionConfigFile >> "LifeCfgItems" >> _class >> "fix_sell_price");
    _priceSell = getNumber(missionConfigFile >> "LifeCfgItems" >> _class >> "price");

    private ["_itemInfo","_index","_amount"];
    _amount = (_x # 1);

    _itemInfo = [_class] call RRPClient_util_itemDetails;
    _index = _basketList lbAdd format["[x%1] - %2",_x # 1,_itemInfo # 1];

    ([_class] call RRPClient_shops_getLimitedItemInfo) params ["_maxLimit","_curLimit"];
    if ((_curLimit + _amount) > _maxLimit AND _maxLimit > -1) then {
        lbSetColor [_index, 0, [0.82, 0.82, 0.82, 1]];
        _basketList lbSetPictureRight [_index,"rimas_pack\icons\messages\error.paa"];
        _basketList lbSetTooltip [_index,format ["Данного товара нет в наличии. Уберите лишнее с корзины что бы продолжить покупку!",_maxLimit - _curLimit]];
        canBuy = false;
        _btn ctrlEnable false;
    };

    private _price = if (weaponShopMode isEqualTo "buy") then {["countPrice", _itemInfo # 12] call RRPClient_shops_utils} else {
        if (_priceSellFix < 1) then {round(_priceSell * 0.3)} else {_priceSellFix};
    };
    _basketList lbSetData [_index,_x # 0];
    _basketList lbSetTextRight [_index, format["  %1 %2", (_price * (_x # 1)),["getName"] call RRPClient_shops_utils]];
    _BasketList lbSetValue [_index, _price];
    _basketList lbSetPicture [_index,_itemInfo select 2];
    _totalPrice = (_totalPrice + (_price * (_x # 1)));
    _itemsList pushBack [_class,_x # 1];

} forEach RRPWeaponBasket;

uiNamespace setVariable ["WeaponShopTotalPrice", _totalPrice];
uiNamespace setVariable ["WeaponShopItemsList", _itemsList];

private ["_ctrDescr","_comission"];
_ctrDescr = _dialog displayCtrl 388656;
_comission = if (currencyType isEqualTo "atm") then {format ["Комиссия за оплату картой: <t color = '#3f6b00'>%1$</t>",["getComissionPrice",_totalPrice] call RRPClient_shops_utils]} else {""};
_ctrDescr ctrlSetStructuredText parseText (if (weaponShopMode isEqualTo "buy") then {
    format ["<br/><t size = '1.2' font = 'overwatch' >Общая цена: <t color = '#3f6b00'>%1%2</t></t><br/>%3",_totalPrice,(["getName"] call RRPClient_shops_utils),_comission]
} else {
    format ["<br/><t size = '1.2' font = 'overwatch' >Общая цена прожади: <t color = '#3f6b00'>%1%2</t></t><br/>",_totalPrice,["getName"] call RRPClient_shops_utils]
});
