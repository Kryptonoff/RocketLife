/*
    Author(s):
    Arrra (original)
    Discord: arrra#9745
    cc by-nc-nd
*/
try {
    if (wpnStorageObj getVariable ["dontUse", false]) throw "Уже кем-то используеться!";
    private ["_display","_ctrLb","_selledItem","_amount","_ctrlEdit","_price"];
    _display = uiNamespace getVariable ["RRPWeaponStorageDialog",displayNull];
    if (_display isEqualTo  displayNull) throw "";

    _ctrLb = _display displayCtrl 1204;
    _ctrlEdit = _display displayCtrl 1400;

    _selledItem = _ctrLb lbData (lbCurSel _ctrLb);
    _amount = parseNumber(ctrlText _ctrlEdit);

    if (_amount > missionNamespace getVariable [format ["life_inv_%1",_selledItem],0]) throw "У вас нет такого кол-ва ресурса";
    if (_amount <= 0) throw "Цена не может быть равна 0 или отрицательным значением!";
    if !([str(_amount)] call RRPClient_system_isnumeric) throw "Некорректный ввод. Введите кол-во";

    _price = 0;
    {
        if (_selledItem isEqualTo _x # 0) then {
            _price = (_x # 0) * _amount;
        }
    } forEach (wpnStorageObj getVariable ["toolboxs", -1]);
    if ((_price * _amount) > (wpnStorageObj getVariable ["balance", -1])) throw "На балансе хранилища недостаточно денег";


    [player,_amount,_selledItem,wpnStorageID] remoteExecCall ["RRPServer_wpnStorage_updateStorage",2];
} catch {
    ["ErrorTitleAndText", ["Ошибка!", _exception]] call SmartClient_gui_toaster_addTemplateToast;
    closeDialog 0;
};
