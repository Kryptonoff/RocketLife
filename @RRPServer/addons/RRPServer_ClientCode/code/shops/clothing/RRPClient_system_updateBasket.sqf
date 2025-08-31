/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
private ["_totalPrice","_dialog","_BasketList","_ctrDescr","_itemsList"];
_dialog = uiNamespace getVariable ['RRPDialogClothingShop', displayNull];

_BasketList = _dialog displayCtrl 3108;

lbClear _basketList;
_totalPrice = 0;
_itemsList = [];
{
    private _class = _x # 0;
    (_class call RRPClient_clothing_getItemInfo) params ["_itemName","_condition","_conditionsMsg","_conditionsUse,","_conditionsUseMsg","_price"];

    private ["_itemInfo","_index","_amount"];
    _amount = (_x # 1);

    _itemInfo = [_class] call RRPClient_util_itemDetails;
    _index = _basketList lbAdd format["[x%1] - %2",_x # 1,[_itemName,if (_itemInfo isEqualTo []) then {"Такого предмета не существует"} else {_itemInfo select 1}] select (_itemName isEqualTo "")];

    ([_class] call RRPClient_shops_getLimitedItemInfo) params ["_maxLimit","_curLimit"];
    if ((_curLimit + _amount) > _maxLimit AND _maxLimit > -1) then {
        lbSetColor [_index, 0, [0.82, 0.82, 0.82, 1]];
        _basketList lbSetPictureRight [_index,"rimas_pack\icons\messages\error.paa"];
        _basketList lbSetTooltip [_index,format ["Вы выбрали больше чем есть в наличии. Осталось %1. Уберите лишнее с корзины что бы продолжить покупку!",_maxLimit - _curLimit]];
    };


    _price =  if (_itemInfo # 12 < 0) then {_price} else {_itemInfo # 12};
    _price = ["countPrice",_price] call RRPClient_shops_utils;
    _basketList lbSetData [_index,_class];
    _basketList lbSetTextRight [_index, format["  %1 %2", (_price * (_amount)),["getName"] call RRPClient_shops_utils]];
    _BasketList lbSetValue [_index, _price];
    _basketList lbSetPicture [_index,_itemInfo select 2];
    _totalPrice = (_totalPrice + (_price * _amount));
    _itemsList pushBack [_class,_amount];

} forEach RRPClothingBasket;

uiNamespace setVariable ["ClothingShopTotalPrice", _totalPrice];
uiNamespace setVariable ["ClothingShopItemsList", _itemsList];
private _ctrDescr = _dialog displayCtrl 3107;
_ctrDescr ctrlSetStructuredText parseText format ["<t size = '1.2' font = 'overwatch' >Общая цена: <t color = '#3f6b00'>%1%2</t></t><br/><t size = '0.85' >%3</t>",_totalPrice,(["getName"] call RRPClient_shops_utils), if (currencyType isEqualTo "atm") then {
    format ["Комиссия за оплату картой: <t color = '#3f6b00'>%1$</t>",["getComissionPrice",_totalPrice] call RRPClient_shops_utils]
    }];
