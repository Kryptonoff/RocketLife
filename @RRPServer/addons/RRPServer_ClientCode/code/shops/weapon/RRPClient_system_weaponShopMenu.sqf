/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/

try{
    RRPWeaponBasket = [];
    private ["_shopSide","_conditions","_display","_sellMode"];
    currentShop = param [0,""];
    if (currentShop isEqualTo "") throw "Магазин не определен";
    if (server_restartSoon) throw "Надвигается буря. Все магазины закрыты.";
    if !(isClass(missionConfigFile >> "LifeCfgWeaponShops" >> currentShop)) throw "Магазин не определен";

    _shopSide = getText(missionConfigFile >> "LifeCfgWeaponShops" >> currentShop >> "side");
    _sellMode = (getNumber(missionConfigFile >> "LifeCfgWeaponShops" >> currentShop >> "sellMode") isEqualTo 1);

    _conditions = getText(missionConfigFile >> "LifeCfgWeaponShops" >> currentShop >> "conditions");
    if !([_conditions] call RRPClient_util_conditionsCheck) throw (getText(missionConfigFile >> "LifeCfgWeaponShops" >> currentShop >> "conditionMessage"));

    if !(createDialog "RRPDialogWeaponShop") throw "Ошибка при создании диалога";
    _display = uiNamespace getVariable ["RRPDialogWeaponShop",displayNull];
    ctrlSetText[38401,getText(missionConfigFile >> "LifeCfgWeaponShops" >> currentShop >> "displayName")];

    private ["_magsButtonAddCat","_magsList","_magsCount","_magsBG","_filters","_moneySwitch","_filter"];
    _magsButtonAddCat = _display displayCtrl 38409;
    _magsList = _display displayCtrl 38407;
    _magsCount = _display displayCtrl 38408;
    _magsBG = _display displayCtrl 38410;
    _filters = _display displayCtrl 38402;
    _filter = _display displayCtrl 3842811;
    _moneySwitch = _display displayCtrl 38428;
    lbClear _filters;
    _filters lbSetData [(_filters lbAdd  "Магазин"),'buy'];
    if (_sellMode) then {_filters lbSetData [(_filters lbAdd  "Мой инвентарь"),'sell']};
    _filters lbSetCurSel 0;

    _magsButtonAddCat ctrlShow false;
    _magsList ctrlShow false;
    _magsCount ctrlShow false;
    _magsBG ctrlShow false;

    {
        _x params ["_class","_text","_img"];
        private _index = _moneySwitch lbAdd _text;
        _moneySwitch lbSetData [_index, _class];
        _moneySwitch lbSetPictureRight [_index, _img];
    } forEach getArray(missionConfigFile >> "shopSettings" >> "currencyList");
    _moneySwitch lbSetCurSel 0;
    currencyType = _moneySwitch lbData 0;

    {
        _x params ["_typeClass","_typeName"];
        private _index = _filter lbAdd _typeName;
        _filter lbSetData [_index, _typeClass];

    } forEach [
        ["All","Без фильтра"],
        ["rifle","Винтовки"],
        ["pistols","Пистолеты"],
        ["launcher","Гранатометы"],
        ["accessory","Обвесы"],
        ["grenades","Метательные"],
        ["equipment","Снаряжение"],
        ["other","Прочее"]
    ];
    _filter lbSetCurSel 0;

    call RRPClient_system_renderListItems;
    call call RRPClient_shops_renderListTemplates;
    call RRPClient_system_saveGear;
}catch {
    [_exception] call toastError;
};
