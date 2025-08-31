/*
    Author(s):
    Arrra (original)
    SteamID: 76561198090549826
    Discord: arrra#9745
    cc by-nc-nd
*/
disableSerialization;
try {
    private ["_display","_tempatesList","_tmpName","_basket"];
    (["tempateSwitcher"] call RRPClient_shops_utils) params ["_idcList","_idcSetName","_arrayName","_dialogName","_basketVarName"];
    _basket = missionNamespace getVariable [_basketVarName,[]];

    if !(isNull (uiNamespace getVariable ["RRPDialogWeaponShop",displayNull])) then {
        if (weaponShopMode isEqualTo "sell") throw "Вы не можете пользоватся шаблонами при продаже вещей!";
    };

    _display = uiNamespace getVariable [_dialogName,displayNull];
    if (isNull _display) throw format ["dialog %1 is null",_dialogName];
    if (count _basket < 1) throw "Для сохранения шаблона добавьте что-то в корзину!";
    _tmpName = (ctrlText _idcSetName);
    if (_tmpName in [""," ","Название шаблона"]) throw "Задайте название шаблону";

    _tempatesList = profileNameSpace getVariable [_arrayName,[]];
    _tempatesList pushBack [_basket,_tmpName,currentShop];
    profileNameSpace setVariable [_arrayName, _tempatesList];
    ["SuccessTitleOnly",format ["Шаблон %1 сохранен",_tmpName]] call toast;
    saveProfileNamespace;

    call RRPClient_shops_renderListTemplates;
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
}
