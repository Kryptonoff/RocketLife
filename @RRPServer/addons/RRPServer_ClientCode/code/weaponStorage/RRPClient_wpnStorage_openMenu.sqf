/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
private ["_display","_ctrlStrDescription","_idShop","_balance","_toolboxs","_soldAmount","_licenseStorage","_displayName","_ctrlLbitems","_wpnStorageID"];
try {
    if !(createDialog "RRPWeaponStorageDialog") throw "Ошибка при создании диалога!";
    _display = uiNamespace getVariable ["RRPWeaponStorageDialog",displayNull];
    wpnStorageObj = _this;
    _wpnStorageID = wpnStorageObj getVariable ["id", -1];

    if (wpnStorageObj getVariable ["dontUse", false]) throw "Уже кем-то используеться!";
    wpnStorageObj setVariable ["dontUse", true, true];

    _balance = wpnStorageObj getVariable ["balance", -1];
    _licenseStorage = wpnStorageObj getVariable ["licenseStorage", -1];
    _displayName = wpnStorageObj getVariable ["displayName", -1];

    _ctrlStrDescription = _display displayCtrl 1203;
    _ctrlLbitems = _display displayCtrl 1204;
    _ctrlStrDescription ctrlSetStructuredText parseText format ["<t size='1.4' >Владелец: %1</t><br/><t size='0.8' >Баланс: %2$</t>",_displayName,_balance];

    lbClear _ctrlLbitems;
    {
      _x params ["_item", "_price"];
      _value = missionNamespace getVariable [format ["life_inv_%1",getText(missionConfigFile >> "VirtualItems" >> _item >> "variable")],0];
      private _index = _ctrlLbitems lbAdd format ["%1",getText(missionConfigFile >> "VirtualItems" >> _item >> "displayName")];
      _ctrlLbitems lbSetTextRight [_index,format ["%1$", _price]];
      _ctrlLbitems lbSetData [_index,_item];
      _ctrlLbitems lbSetPicture [_index,(getText(missionConfigFile >> "VirtualItems" >> _item >> "icon"))];
    } forEach (wpnStorageObj getVariable ["toolboxs", -1]);

} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
};
